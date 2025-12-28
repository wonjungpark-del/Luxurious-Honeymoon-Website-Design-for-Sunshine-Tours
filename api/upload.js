import { put } from '@vercel/blob';

export const config = {
  api: {
    bodyParser: false,
  },
};

const MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ success: false, error: 'Method not allowed' });
  }

  try {
    // Get form data using Vercel's built-in parser
    const formData = await req.formData();
    const type = formData.get('type') || 'general';
    const files = formData.getAll('files');

    if (files.length === 0) {
      return res.status(400).json({ success: false, error: 'No files uploaded' });
    }

    // Validate file count
    const maxFiles = type === 'reviews' ? 5 : 10;
    if (files.length > maxFiles) {
      return res.status(400).json({ 
        success: false, 
        error: `Maximum ${maxFiles} files allowed for ${type}` 
      });
    }

    // Upload files to Vercel Blob
    const uploadedUrls = [];
    
    for (const file of files) {
      // Validate file type
      if (!ALLOWED_TYPES.includes(file.type)) {
        return res.status(400).json({ 
          success: false, 
          error: `Invalid file type: ${file.type}. Allowed types: ${ALLOWED_TYPES.join(', ')}` 
        });
      }

      // Validate file size
      if (file.size > MAX_FILE_SIZE) {
        return res.status(400).json({ 
          success: false, 
          error: `File too large: ${file.name}. Maximum size: 10MB` 
        });
      }

      // Generate unique filename
      const timestamp = Date.now();
      const random = Math.random().toString(36).substring(7);
      const ext = file.name.split('.').pop() || 'jpg';
      const filename = `${type}/${timestamp}-${random}.${ext}`;

      // Upload to Vercel Blob
      const blob = await put(filename, file, {
        access: 'public',
        contentType: file.type || 'image/jpeg',
      });

      uploadedUrls.push(blob.url);
    }

    return res.status(200).json({
      success: true,
      urls: uploadedUrls,
      count: uploadedUrls.length,
    });

  } catch (error) {
    console.error('Upload error:', error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || 'Upload failed' 
    });
  }
}
