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
    // Parse multipart/form-data using Vercel's built-in parser
    const contentType = req.headers['content-type'];
    if (!contentType || !contentType.includes('multipart/form-data')) {
      return res.status(400).json({ success: false, error: 'Content-Type must be multipart/form-data' });
    }

    // For now, return a placeholder response
    // Vercel's body parser for multipart/form-data requires additional setup
    return res.status(501).json({ 
      success: false, 
      error: 'File upload endpoint is being configured. Please use admin panel upload temporarily.' 
    });

  } catch (error) {
    console.error('Upload error:', error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || 'Upload failed' 
    });
  }
}
