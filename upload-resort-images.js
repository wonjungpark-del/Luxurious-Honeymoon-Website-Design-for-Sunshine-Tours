/**
 * 리조트 이미지를 Vercel Blob에 업로드하는 Node.js 스크립트
 * 
 * 실행 방법:
 * node upload-resort-images.js
 */

const { put } = require('@vercel/blob');
const fs = require('fs');
const path = require('path');

// 디코딩된 리조트 데이터 로드
const resortData = require('./resort_data_decoded.json');

// 업로드 결과 저장
const uploadResults = {
  success: [],
  failed: [],
  totalProcessed: 0,
  totalSuccess: 0,
  totalFailed: 0
};

/**
 * 이미지 파일을 Vercel Blob에 업로드
 */
async function uploadImageToBlob(imagePath, regionId, resortName, imageIndex) {
  try {
    // 파일 존재 확인
    if (!fs.existsSync(imagePath)) {
      throw new Error(`File not found: ${imagePath}`);
    }

    // 파일 읽기
    const fileBuffer = fs.readFileSync(imagePath);
    const fileExt = path.extname(imagePath);
    
    // 안전한 파일명 생성
    const safeResortName = resortName
      .replace(/\s+/g, '-')
      .replace(/[^\w\-가-힣]/g, '')
      .toLowerCase();
    
    const blobFilename = `resorts/${regionId}/${safeResortName}-${imageIndex}${fileExt}`;
    
    // Vercel Blob에 업로드
    const blob = await put(blobFilename, fileBuffer, {
      access: 'public',
      addRandomSuffix: false
    });
    
    console.log(`  ✅ ${resortName} [${imageIndex}] -> ${blob.url}`);
    
    return {
      success: true,
      url: blob.url,
      resortName,
      imageIndex
    };
    
  } catch (error) {
    console.error(`  ❌ ${resortName} [${imageIndex}] 업로드 실패:`, error.message);
    return {
      success: false,
      error: error.message,
      resortName,
      imageIndex
    };
  }
}

/**
 * 모든 리조트 이미지 업로드
 */
async function uploadAllImages() {
  console.log('='.repeat(80));
  console.log('리조트 이미지 Vercel Blob 업로드 시작');
  console.log('='.repeat(80));
  console.log('');

  for (const [regionId, regionInfo] of Object.entries(resortData)) {
    const regionName = regionInfo.region_name;
    const resorts = regionInfo.resorts;
    
    console.log(`\n📍 ${regionName} (${regionId}) - ${resorts.length}개 리조트`);
    console.log('-'.repeat(80));
    
    for (const resort of resorts) {
      const resortName = resort.name_decoded;
      const images = resort.images;
      
      console.log(`\n🏨 ${resortName} - ${images.length}개 이미지`);
      
      const resortResults = {
        regionId,
        regionName,
        resortName,
        images: []
      };
      
      for (let i = 0; i < images.length; i++) {
        const imagePath = images[i];
        const result = await uploadImageToBlob(imagePath, regionId, resortName, i);
        
        uploadResults.totalProcessed++;
        resortResults.images.push(result);
        
        if (result.success) {
          uploadResults.totalSuccess++;
        } else {
          uploadResults.totalFailed++;
        }
        
        // 너무 빠르게 요청하지 않도록 약간의 지연
        await new Promise(resolve => setTimeout(resolve, 100));
      }
      
      if (resortResults.images.every(r => r.success)) {
        uploadResults.success.push(resortResults);
      } else {
        uploadResults.failed.push(resortResults);
      }
    }
  }
  
  console.log('\n' + '='.repeat(80));
  console.log('업로드 완료!');
  console.log('='.repeat(80));
  console.log(`✅ 성공: ${uploadResults.totalSuccess}개`);
  console.log(`❌ 실패: ${uploadResults.totalFailed}개`);
  console.log(`📊 총계: ${uploadResults.totalProcessed}개`);
  
  // 결과를 JSON 파일로 저장
  const outputPath = path.join(__dirname, 'upload_results.json');
  fs.writeFileSync(outputPath, JSON.stringify(uploadResults, null, 2));
  console.log(`\n📄 결과 저장: ${outputPath}`);
}

// 실행
uploadAllImages()
  .then(() => {
    console.log('\n✅ 모든 작업 완료!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ 오류 발생:', error);
    process.exit(1);
  });
