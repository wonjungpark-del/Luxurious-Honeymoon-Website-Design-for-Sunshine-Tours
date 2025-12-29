#!/bin/bash

echo "🌴 발리와 롬복 완벽 설정 시작..."
echo ""

# 1단계: 지역(Regions) 추가
echo "📍 1단계: 지역 데이터 추가..."
echo ""

# 발리
echo "🏝️  발리 (Bali) 추가..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-bali",
    "code": "bali",
    "country": "indonesia",
    "name_ko": "발리",
    "name_en": "Bali",
    "description": "신들의 섬이라 불리는 인도네시아 최고의 관광지. 아름다운 해변, 사원, 테라스 논, 그리고 독특한 문화가 어우러진 천국.",
    "image_url": "/static/images/destinations/bali/bali.jpg",
    "display_order": 1,
    "is_active": true
  }'
echo ""

# 롬복
echo "🏝️  롬복 (Lombok) 추가..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-lombok",
    "code": "lombok",
    "country": "indonesia",
    "name_ko": "롬복",
    "name_en": "Lombok",
    "description": "발리 옆의 숨은 보석. 한적하고 자연이 잘 보존된 휴양지로, 길리 섬의 맑은 바다와 린자니 화산이 유명.",
    "image_url": "/static/images/destinations/lombok/lombok.jpg",
    "display_order": 2,
    "is_active": true
  }'
echo ""
echo ""

# 2단계: 리조트 데이터 추가
echo "🏨 2단계: 리조트 데이터 추가..."
echo ""

# 발리 리조트 3개
echo "📍 발리 리조트..."

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bali-ayana",
    "region_id": "region-bali",
    "name_ko": "아야나 리조트 발리",
    "name_en": "AYANA Resort Bali",
    "category": "럭셔리",
    "description": "세계적으로 유명한 록 바와 절벽 위 인피니티 풀. 짐바란 베이의 석양을 감상할 수 있는 최고급 리조트.",
    "main_image_url": "/static/images/resorts/lombok/lombok-resort01-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["록 바", "클리프사이드 풀", "스파", "골프 코스"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bali-bulgari",
    "region_id": "region-bali",
    "name_ko": "불가리 리조트 발리",
    "name_en": "Bulgari Resort Bali",
    "category": "럭셔리",
    "description": "이탈리아 명품 브랜드의 럭셔리 리조트. 150m 절벽 위에서 인도양을 내려다보는 프라이빗 빌라.",
    "main_image_url": "/static/images/resorts/lombok/lombok-resort02-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["불가리 스파", "클리프탑 다이닝", "프라이빗 비치", "이탈리안 레스토랑"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bali-four-seasons-sayan",
    "region_id": "region-bali",
    "name_ko": "포시즌스 리조트 사얀",
    "name_en": "Four Seasons Resort Bali at Sayan",
    "category": "럭셔리",
    "description": "우붓의 열대 정글 속 숨겨진 보석. 아융 강 계곡을 내려다보는 독특한 위치의 프라이빗 빌라.",
    "main_image_url": "/static/images/resorts/lombok/lombok-resort03-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["정글 뷰", "프라이빗 풀 빌라", "요가", "스파"],
    "display_order": 3,
    "is_active": true
  }'
echo ""

# 롬복 리조트 3개
echo "📍 롬복 리조트..."

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-lombok-oberoi",
    "region_id": "region-lombok",
    "name_ko": "오베로이 롬복",
    "name_en": "The Oberoi Lombok",
    "category": "럭셔리",
    "description": "롬복 북서부 해안의 프라이빗 비치 리조트. 20헥타르의 열대 정원과 길리 섬 전망.",
    "main_image_url": "/static/images/resorts/krabi/krabi-resort01-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["프라이빗 비치", "풀 빌라", "스파", "길리 섬 투어"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-lombok-katamaran",
    "region_id": "region-lombok",
    "name_ko": "카타마란 리조트",
    "name_en": "Katamaran Resort",
    "category": "프리미엄",
    "description": "센기기 비치의 부티크 리조트. 서핑과 다이빙으로 유명한 지역의 럭셔리 숙소.",
    "main_image_url": "/static/images/resorts/krabi/krabi-resort02-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["비치프론트", "서핑", "다이빙", "스파"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-lombok-jeeva-klui",
    "region_id": "region-lombok",
    "name_ko": "지바 클루이",
    "name_en": "Jeeva Klui Resort",
    "category": "부티크",
    "description": "클루이 비치의 한적한 부티크 리조트. 전통 롬복 스타일과 현대적 편의시설의 조화.",
    "main_image_url": "/static/images/resorts/krabi/krabi-resort03-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": ["부티크 스타일", "비치 액세스", "요가", "스노클링"],
    "display_order": 3,
    "is_active": true
  }'
echo ""

echo ""
echo "✅ 3단계: 데이터 확인..."
echo ""

# 지역 확인
echo "📊 인도네시아 지역:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/regions?country=indonesia" | jq -r '.data[] | "   ✅ \(.name_ko) (\(.name_en))"'
echo ""

# 리조트 확인
echo "📊 발리 리조트:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "   - \(.name_ko)"'
echo ""

echo "📊 롬복 리조트:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "   - \(.name_ko)"'
echo ""

echo "🎉 발리와 롬복 설정 완료!"
echo ""
echo "📋 추가된 내용:"
echo "   - 지역 2개: 발리, 롬복"
echo "   - 리조트 6개: 발리 3개, 롬복 3개"
echo "   - 각 리조트: 메인 이미지 + 갤러리 6개 + 특징 4개"
