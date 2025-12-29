const { put } = require('@vercel/blob');
const formidable = require('formidable');
const fs = require('fs');

// Disable Next.js body parsing to allow formidable to handle it
module.exports = async function handler(req, res) {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ success: false, error: 'Method not allowed' });
  }

  try {
    // Parse the multipart form data
    const form = formidable({
      maxFileSize: 10 * 1024 * 1024, // 10MB max
      keepExtensions: true
    });

    const [fields, files] = await new Promise((resolve, reject) => {
      form.parse(req, (err, fields, files) => {
        if (err) reject(err);
        else resolve([fields, files]);
      });
    });

    // Get the uploaded file
    const file = files.file?.[0] || files.file;
    
    if (!file) {
      return res.status(400).json({ 
        success: false, 
        error: 'No file uploaded' 
      });
    }

    // Read file buffer
    const fileBuffer = fs.readFileSync(file.filepath);
    
    // Generate a unique filename with timestamp
    const timestamp = Date.now();
    const originalName = file.originalFilename || 'upload';
    const extension = originalName.split('.').pop();
    const filename = `${timestamp}-${Math.random().toString(36).substring(7)}.${extension}`;
    
    // Upload to Vercel Blob Storage
    const blob = await put(filename, fileBuffer, {
      access: 'public',
      contentType: file.mimetype || 'image/jpeg',
      addRandomSuffix: false
    });

    // Clean up temp file
    fs.unlinkSync(file.filepath);

    // Return the blob URL
    return res.status(200).json({
      success: true,
      url: blob.url,
      filename: filename,
      size: file.size,
      contentType: file.mimetype
    });

  } catch (error) {
    console.error('Upload error:', error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || 'Upload failed' 
    });
  }
};

// Disable Next.js body parser for this API route
module.exports.config = {
  api: {
    bodyParser: false,
  },
};
