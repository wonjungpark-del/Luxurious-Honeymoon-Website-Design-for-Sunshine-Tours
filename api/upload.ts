import type { VercelRequest, VercelResponse } from '@vercel/node';
import { put } from '@vercel/blob';
import { IncomingForm, File } from 'formidable';

// Disable body parsing (formidable will handle it)
export const config = {
  api: {
    bodyParser: false,
  },
};

const MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];

function parseForm(req: VercelRequest): Promise<{ fields: any; files: any }> {
  return new Promise((resolve, reject) => {
    const form = new IncomingForm({
      maxFileSize: MAX_FILE_SIZE,
      multiples: true,
    });

    form.parse(req, (err, fields, files) => {
      if (err) reject(err);
      else resolve({ fields, files });
    });
  });
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== 'POST') {
    return res.status(405).json({ success: false, error: 'Method not allowed' });
  }

  try {
    const { fields, files } = await parseForm(req);
    const type = (fields.type as string) || 'general';
    
    // Get files array
    let fileList: File[] = [];
    if (files.files) {
      fileList = Array.isArray(files.files) ? files.files : [files.files];
    }

    if (fileList.length === 0) {
      return res.status(400).json({ success: false, error: 'No files uploaded' });
    }

    // Validate file count
    const maxFiles = type === 'reviews' ? 5 : 10;
    if (fileList.length > maxFiles) {
      return res.status(400).json({ 
        success: false, 
        error: `Maximum ${maxFiles} files allowed for ${type}` 
      });
    }

    // Upload files to Vercel Blob
    const uploadedUrls: string[] = [];
    
    for (const file of fileList) {
      // Validate file type
      if (!ALLOWED_TYPES.includes(file.mimetype || '')) {
        return res.status(400).json({ 
          success: false, 
          error: `Invalid file type: ${file.mimetype}. Allowed types: ${ALLOWED_TYPES.join(', ')}` 
        });
      }

      // Validate file size
      if (file.size > MAX_FILE_SIZE) {
        return res.status(400).json({ 
          success: false, 
          error: `File too large: ${file.originalFilename}. Maximum size: 10MB` 
        });
      }

      // Generate unique filename
      const timestamp = Date.now();
      const random = Math.random().toString(36).substring(7);
      const ext = file.originalFilename?.split('.').pop() || 'jpg';
      const filename = `${type}/${timestamp}-${random}.${ext}`;

      // Read file buffer
      const fs = await import('fs');
      const fileBuffer = await fs.promises.readFile(file.filepath);

      // Upload to Vercel Blob
      const blob = await put(filename, fileBuffer, {
        access: 'public',
        contentType: file.mimetype || 'image/jpeg',
      });

      uploadedUrls.push(blob.url);
    }

    return res.status(200).json({
      success: true,
      urls: uploadedUrls,
      count: uploadedUrls.length,
    });

  } catch (error: any) {
    console.error('Upload error:', error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || 'Upload failed' 
    });
  }
}
