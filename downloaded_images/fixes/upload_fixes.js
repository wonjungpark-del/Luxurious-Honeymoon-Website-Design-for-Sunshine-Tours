const { put } = require('@vercel/blob');
const fs = require('fs');
const path = require('path');

async function uploadImages() {
  const token = process.env.BLOB_READ_WRITE_TOKEN;
  
  const images = [
    'interlaken-jungfrau.jpg',
    'interlaken-lake.jpg',
    'geneva-jet-new.jpg',
    'geneva-lake.jpg',
    'split-palace-alt.jpg',
    'cappadocia-sunrise.jpg',
    'cappadocia-rocks.jpg',
    'nice-coast.jpg',
    'nice-promenade.jpg'
  ];
  
  const urls = {};
  
  for (const imageName of images) {
    try {
      const filePath = path.join(__dirname, imageName);
      if (!fs.existsSync(filePath)) {
        console.log(`Skipping ${imageName} - file not found`);
        continue;
      }
      
      const fileSize = fs.statSync(filePath).size;
      if (fileSize < 1000) {
        console.log(`Skipping ${imageName} - file too small (${fileSize} bytes)`);
        continue;
      }
      
      const fileBuffer = fs.readFileSync(filePath);
      const timestamp = Date.now();
      const blob = await put(`${timestamp}-${imageName}`, fileBuffer, {
        access: 'public',
        token: token
      });
      
      urls[imageName] = blob.url;
      console.log(`Uploaded ${imageName}: ${blob.url}`);
    } catch (error) {
      console.error(`Error uploading ${imageName}:`, error.message);
    }
  }
  
  console.log('\n=== All URLs ===');
  console.log(JSON.stringify(urls, null, 2));
}

uploadImages().catch(console.error);
