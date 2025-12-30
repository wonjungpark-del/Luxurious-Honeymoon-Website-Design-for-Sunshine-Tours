const { put } = require('@vercel/blob');

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
    // Check if BLOB_READ_WRITE_TOKEN is set
    if (!process.env.BLOB_READ_WRITE_TOKEN) {
      return res.status(500).json({ 
        success: false, 
        error: 'BLOB_READ_WRITE_TOKEN is not configured. Please connect Blob Storage to your project.' 
      });
    }

    // Get the request body as Buffer
    const chunks = [];
    for await (const chunk of req) {
      chunks.push(chunk);
    }
    const buffer = Buffer.concat(chunks);

    // Parse the content type to extract boundary
    const contentType = req.headers['content-type'] || '';
    if (!contentType.includes('multipart/form-data')) {
      return res.status(400).json({ 
        success: false, 
        error: 'Content-Type must be multipart/form-data' 
      });
    }

    // Extract boundary from content-type
    const boundaryMatch = contentType.match(/boundary=([^;]+)/);
    if (!boundaryMatch) {
      return res.status(400).json({ 
        success: false, 
        error: 'No boundary found in multipart data' 
      });
    }
    const boundary = boundaryMatch[1];

    // Parse multipart data manually
    const parts = buffer.toString('binary').split(`--${boundary}`);
    
    const files = [];

    for (const part of parts) {
      if (part.includes('Content-Disposition: form-data') && part.includes('filename=')) {
        let filename = 'upload.jpg';
        let contentTypeFile = 'image/jpeg';

        // Extract filename
        const filenameMatch = part.match(/filename="([^"]+)"/);
        if (filenameMatch) {
          filename = filenameMatch[1];
        }

        // Extract content type
        const ctMatch = part.match(/Content-Type: ([^\r\n]+)/);
        if (ctMatch) {
          contentTypeFile = ctMatch[1].trim();
        }

        // Extract file data (everything after the double CRLF)
        const dataStart = part.indexOf('\r\n\r\n') + 4;
        const dataEnd = part.lastIndexOf('\r\n');
        
        if (dataStart > 3 && dataEnd > dataStart) {
          const binaryData = part.substring(dataStart, dataEnd);
          const fileBuffer = Buffer.from(binaryData, 'binary');
          
          if (fileBuffer && fileBuffer.length > 0) {
            files.push({ buffer: fileBuffer, filename, contentType: contentTypeFile });
          }
        }
      }
    }

    if (files.length === 0) {
      return res.status(400).json({ 
        success: false, 
        error: 'No files found' 
      });
    }

    // Upload all files to Vercel Blob
    const uploadedUrls = [];
    for (const file of files) {
      // Generate unique filename
      const timestamp = Date.now();
      const extension = file.filename.split('.').pop() || 'jpg';
      const uniqueFilename = `${timestamp}-${Math.random().toString(36).substring(7)}.${extension}`;

      // Upload to Vercel Blob
      const blob = await put(uniqueFilename, file.buffer, {
        access: 'public',
        contentType: file.contentType,
        addRandomSuffix: false
      });

      uploadedUrls.push(blob.url);
    }

    // Return success response
    // For single file upload (most common case), return url as string
    // For multiple files, return urls as array
    if (uploadedUrls.length === 1) {
      return res.status(200).json({
        success: true,
        url: uploadedUrls[0]  // Single file: return as string
      });
    } else {
      return res.status(200).json({
        success: true,
        urls: uploadedUrls,   // Multiple files: return as array
        count: uploadedUrls.length
      });
    }

  } catch (error) {
    console.error('Upload error:', error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || 'Upload failed' 
    });
  }
};
