# 갤러리 네비게이션 수정 가이드

## 문제 증상
- 갤러리 이미지 클릭은 되지만 ◀/▶ 버튼이 작동하지 않음
- 키보드 화살표(←/→)가 작동하지 않음
- 이미지가 전환되지 않음

## 표준 해결 방법

### 1단계: 정상 작동하는 페이지 확인
```bash
# 태국 후아힌, 발리 등 정상 작동하는 페이지 확인
cd /home/user/webapp/public
grep -l "console.log('✅.*갤러리 이미지 수집 완료" *.html
```

### 2단계: 문제 페이지를 정상 페이지 기준으로 재생성
```bash
# 예: 발리(정상)를 기준으로 롬복(문제) 수정
cd /home/user/webapp/public

# 백업
cp lombok-resorts.html lombok-resorts-backup.html

# 발리 기준으로 재생성 (지역명/ID만 변경)
sed 's/region-bali/region-lombok/g; s/발리/롬복/g; s/Bali/Lombok/g; s/bali/lombok/g' \
    bali-resorts.html > lombok-resorts.html
```

### 3단계: 검증
```bash
# REGION_ID 확인
grep "const REGION_ID" lombok-resorts.html

# 디버깅 로그 확인
grep "console.log('✅" lombok-resorts.html
```

### 4단계: 커밋 및 배포
```bash
cd /home/user/webapp
git add public/[문제-페이지].html
git commit -m "Fix gallery navigation: sync with working structure"
git push origin main
```

### 5단계: 캐시 버스팅 (필요시)
```bash
# vercel.json에 no-cache 헤더 추가
{
  "source": "/[페이지-경로]",
  "headers": [{
    "key": "Cache-Control",
    "value": "no-cache, no-store, must-revalidate"
  }]
}
```

## 핵심 코드 구조

### 필수 구성 요소
1. **전역 변수**
```javascript
let allGalleryImages = [];
let currentImageIndex = 0;
```

2. **이미지 수집** (loadResorts 함수 내)
```javascript
allGalleryImages = [];
resorts.forEach(resort => {
    const gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : [];
    gallery.forEach((img, index) => {
        allGalleryImages.push({
            src: img,
            caption: `${resort.name_ko} - 이미지 ${index + 1}`
        });
    });
});
console.log('✅ [지역명] 갤러리 이미지 수집 완료:', allGalleryImages.length, '개');
```

3. **갤러리 HTML 렌더링**
```javascript
onclick="openLightbox('${img}', '${resort.name_ko} - 이미지 ${index + 1}')"
```

4. **openLightbox 함수**
```javascript
function openLightbox(imgSrc, caption) {
    const modal = document.getElementById('lightbox-modal');
    const img = document.getElementById('lightbox-img');
    const captionText = document.getElementById('lightbox-caption');
    
    modal.classList.add('active');
    img.src = imgSrc;
    captionText.textContent = caption;
    
    currentImageIndex = allGalleryImages.findIndex(item => item.src === imgSrc);
    if (currentImageIndex === -1) currentImageIndex = 0;
}
```

5. **navigateLightbox 함수**
```javascript
function navigateLightbox(direction) {
    if (allGalleryImages.length === 0) return;
    
    currentImageIndex += direction;
    
    if (currentImageIndex < 0) {
        currentImageIndex = allGalleryImages.length - 1;
    } else if (currentImageIndex >= allGalleryImages.length) {
        currentImageIndex = 0;
    }
    
    const currentImage = allGalleryImages[currentImageIndex];
    const img = document.getElementById('lightbox-img');
    const captionText = document.getElementById('lightbox-caption');
    
    img.src = currentImage.src;
    captionText.textContent = currentImage.caption;
}
```

6. **이벤트 리스너**
```javascript
document.addEventListener('DOMContentLoaded', () => {
    loadResorts();
    
    const prevBtn = document.querySelector('.lightbox-prev');
    const nextBtn = document.querySelector('.lightbox-next');
    if (prevBtn) prevBtn.addEventListener('click', () => navigateLightbox(-1));
    if (nextBtn) nextBtn.addEventListener('click', () => navigateLightbox(1));
    
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') closeLightbox();
        else if (e.key === 'ArrowLeft') navigateLightbox(-1);
        else if (e.key === 'ArrowRight') navigateLightbox(1);
    });
});
```

## 테스트 체크리스트
- [ ] 콘솔에 "✅ 갤러리 이미지 수집 완료: X 개" 표시
- [ ] 갤러리 이미지 클릭 시 라이트박스 열림
- [ ] ◀ 버튼으로 이전 이미지 이동
- [ ] ▶ 버튼으로 다음 이미지 이동
- [ ] 키보드 ← 로 이전 이미지
- [ ] 키보드 → 로 다음 이미지
- [ ] 첫 이미지에서 ◀ → 마지막 이미지 순환
- [ ] 마지막 이미지에서 ▶ → 첫 이미지 순환
- [ ] ESC 키로 닫기
- [ ] 배경 클릭으로 닫기

## 문제 해결 팁

### 문제: 배포 후에도 작동 안 함
- 시크릿/프라이빗 브라우징 모드로 테스트
- Ctrl + Shift + R로 강제 새로고침
- vercel.json에 no-cache 헤더 추가

### 문제: 콘솔에 로그가 안 나옴
- 배포된 파일과 로컬 파일 비교
- Vercel 캐시 문제일 가능성 → 타임스탬프 추가하여 재배포

### 문제: REGION_ID가 잘못됨
```bash
# API로 올바른 REGION_ID 확인
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/regions" | \
  python3 -c "import sys, json; [print(r['id'], '-', r['name_ko']) for r in json.load(sys.stdin)['data']]"
```

## 완료된 페이지
- ✅ 태국: 후아힌, 크라비, 푸켓, 파타야, 코사무이, 카오락
- ✅ 인도네시아: 발리, 롬복
- ✅ 멕시코: 칸쿤

## 남은 페이지 (필요시 동일하게 처리)
- 하와이: 오아후, 마우이, 빅아일랜드
- 필리핀: 보라카이, 세부/보홀, 팔라완
- 남태평양: 피지, 괌, 사이판, 호주
- 몰디브
- 모리셔스
- 베트남: 다낭
