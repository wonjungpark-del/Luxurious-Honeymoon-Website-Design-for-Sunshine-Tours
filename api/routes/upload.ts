import { Hono } from 'hono';
import { put } from '@vercel/blob';

export const uploadApp = new Hono();

// POST /api/upload - Upload images to Vercel Blob Storage
uploadApp.post('/', async (c) => {
  try {
    const formData = await c.req.formData();
    const files = formData.getAll('images') as File[];
    const type = formData.get('type') as string || 'reviews'; // reviews, resorts, regions
    
    if (!files || files.length === 0) {
      return c.json({
        success: false,
        error: '이미지를 선택해주세요.'
      }, 400);
    }
    
    const maxFiles = type === 'reviews' ? 5 : 10;
    if (files.length > maxFiles) {
      return c.json({
        success: false,
        error: `최대 ${maxFiles}장까지 업로드 가능합니다.`
      }, 400);
    }
    
    const uploadedUrls: string[] = [];
    
    for (const file of files) {
      // 파일 크기 체크 (10MB 제한)
      if (file.size > 10 * 1024 * 1024) {
        return c.json({
          success: false,
          error: '각 파일은 10MB 이하여야 합니다.'
        }, 400);
      }
      
      // 이미지 파일인지 체크
      if (!file.type.startsWith('image/')) {
        return c.json({
          success: false,
          error: '이미지 파일만 업로드 가능합니다.'
        }, 400);
      }
      
      // 고유 파일명 생성 (타임스탬프 + 랜덤)
      const timestamp = Date.now();
      const random = Math.random().toString(36).substring(2, 8);
      const ext = file.name.split('.').pop() || 'jpg';
      const fileName = `${type}/${timestamp}-${random}.${ext}`;
      
      // Vercel Blob에 업로드
      const blob = await put(fileName, file, {
        access: 'public',
        addRandomSuffix: false
      });
      
      uploadedUrls.push(blob.url);
    }
    
    return c.json({
      success: true,
      urls: uploadedUrls,
      count: uploadedUrls.length
    });
  } catch (error) {
    console.error('Error uploading images:', error);
    return c.json({
      success: false,
      error: '이미지 업로드 중 오류가 발생했습니다.'
    }, 500);
  }
});
