const { put } = require('@vercel/blob');
const fs = require('fs');

async function uploadImages() {
  const token = 'vercel_blob_rw_rvdTR47udfuSmDIN_qC0pPp1wIXLHQDtTt2UBVH8e4DHcGi';
  
  const images = [
    { file: 'interlaken-jungfrau.jpg', name: 'interlaken-jungfrau' },
    { file: 'interlaken-lake.jpg', name: 'interlaken-lake' },
    { file: 'geneva-jet-new.jpg', name: 'geneva-jet' },
    { file: 'geneva-lake.jpg', name: 'geneva-lake' },
    { file: 'split-palace-alt.jpg', name: 'split-palace' },
    { file: 'cappadocia-sunrise.jpg', name: 'cappadocia-sunrise' },
    { file: 'cappadocia-rocks.jpg', name: 'cappadocia-rocks' },
    { file: 'nice-coast.jpg', name: 'nice-coast' },
    { file: 'nice-promenade.jpg', name: 'nice-promenade' }
  ];
  
  const urls = {};
  
  for (const img of images) {
    try {
      if (!fs.existsSync(img.file)) continue;
      const size = fs.statSync(img.file).size;
      if (size < 1000) continue;
      
      const buffer = fs.readFileSync(img.file);
      const blob = await put(`${Date.now()}-${img.name}.jpg`, buffer, {
        access: 'public',
        token: token
      });
      
      urls[img.name] = blob.url;
      console.log(`${img.name}: ${blob.url}`);
    } catch (err) {
      console.error(`Failed ${img.name}:`, err.message);
    }
  }
  
  console.log('\n=== URLs ===');
  console.log(JSON.stringify(urls, null, 2));
}

uploadImages();
