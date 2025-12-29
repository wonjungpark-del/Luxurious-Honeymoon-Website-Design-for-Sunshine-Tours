#!/bin/bash

echo "🏝️  태국 5개 지역 리조트 데이터 추가 시작..."
echo ""

# 카오락 추가 리조트
echo "📍 카오락 추가 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-khao-lak-jw-marriott",
    "region_id": "region-thailand-khao-lak",
    "name_ko": "JW 메리어트 카오락",
    "name_en": "JW Marriott Khao Lak Resort & Spa",
    "category": "럭셔리",
    "description": "프라이빗 비치와 열대 정원이 어우러진 최고급 리조트. 넓은 객실과 다양한 레스토랑, 스파 시설을 갖추고 있습니다.",
    "main_image_url": "/static/images/resorts/khao-lak/jw-marriott-main.jpg",
    "gallery_images": [],
    "features": ["프라이빗 비치", "인피니티 풀", "럭셔리 스파", "키즈클럽", "5개 레스토랑", "피트니스 센터"],
    "display_order": 10,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-khao-lak-sensimar",
    "region_id": "region-thailand-khao-lak",
    "name_ko": "센시마 카오락 비치프론트",
    "name_en": "Sensimar Khaolak Beachfront Resort",
    "category": "럭셔리",
    "description": "성인 전용 리조트로 조용하고 로맨틱한 분위기. 모든 객실에서 바다 전망을 감상할 수 있습니다.",
    "main_image_url": "/static/images/resorts/khao-lak/sensimar-main.jpg",
    "gallery_images": [],
    "features": ["어른 전용", "올 인클루시브", "비치프론트", "3개 풀", "스파", "무료 와이파이"],
    "display_order": 11,
    "is_active": true
  }'
echo ""

# 코사무이
echo "📍 코사무이 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-koh-samui-conrad",
    "region_id": "region-thailand-koh-samui",
    "name_ko": "콘래드 코사무이",
    "name_en": "Conrad Koh Samui",
    "category": "럭셔리",
    "description": "언덕 위에 위치한 초호화 리조트. 모든 빌라에 프라이빗 풀이 있으며 360도 바다 전망을 자랑합니다.",
    "main_image_url": "/static/images/resorts/koh-samui/conrad-main.jpg",
    "gallery_images": [],
    "features": ["프라이빗 풀 빌라", "인피니티 풀", "미슐랭 레스토랑", "럭셔리 스파", "버틀러 서비스", "무료 셔틀"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-koh-samui-four-seasons",
    "region_id": "region-thailand-koh-samui",
    "name_ko": "포시즌스 코사무이",
    "name_en": "Four Seasons Resort Koh Samui",
    "category": "럭셔리",
    "description": "코코넛 나무 숲과 해변이 어우러진 열대 낙원. 최상급 서비스와 시설을 제공합니다.",
    "main_image_url": "/static/images/resorts/koh-samui/four-seasons-main.jpg",
    "gallery_images": [],
    "features": ["프라이빗 풀 빌라", "비치 액세스", "스파", "3개 레스토랑", "키즈클럽", "요가 세션"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

# 끄라비
echo "📍 끄라비 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-krabi-rayavadee",
    "region_id": "region-thailand-krabi",
    "name_ko": "라야바디 끄라비",
    "name_en": "Rayavadee",
    "category": "럭셔리",
    "description": "프라낭 비치의 전설적인 리조트. 석회암 절벽으로 둘러싸인 프라이빗 파라다이스.",
    "main_image_url": "/static/images/resorts/krabi/rayavadee-main.jpg",
    "gallery_images": [],
    "features": ["프라이빗 빌라", "프라낭 비치", "록 클라이밍", "스파", "3개 레스토랑", "카약"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-krabi-centara-grand",
    "region_id": "region-thailand-krabi",
    "name_ko": "센타라 그랜드 비치 리조트",
    "name_en": "Centara Grand Beach Resort & Villas Krabi",
    "category": "프리미엄",
    "description": "아오낭 비치의 대형 리조트. 가족 단위 여행객에게 최적.",
    "main_image_url": "/static/images/resorts/krabi/centara-grand-main.jpg",
    "gallery_images": [],
    "features": ["비치프론트", "워터파크", "키즈클럽", "5개 레스토랑", "스파", "수영장 10개"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

# 파타야
echo "📍 파타야 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-pattaya-intercontinental",
    "region_id": "region-thailand-pattaya",
    "name_ko": "인터컨티넨탈 파타야",
    "name_en": "InterContinental Pattaya Resort",
    "category": "프리미엄",
    "description": "파타야 베이를 내려다보는 힐탑 리조트. 모던한 디자인과 인피니티 풀이 매력적.",
    "main_image_url": "/static/images/resorts/pattaya/intercontinental-main.jpg",
    "gallery_images": [],
    "features": ["인피니티 풀", "스카이 바", "스파", "비치 액세스", "피트니스 센터", "3개 레스토랑"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-pattaya-cape-dara",
    "region_id": "region-thailand-pattaya",
    "name_ko": "케이프 다라 리조트",
    "name_en": "Cape Dara Resort",
    "category": "프리미엄",
    "description": "파타야 북부 해변의 모던 리조트. 조용하고 깨끗한 환경.",
    "main_image_url": "/static/images/resorts/pattaya/cape-dara-main.jpg",
    "gallery_images": [],
    "features": ["비치프론트", "인피니티 풀", "스파", "레스토랑", "바", "피트니스"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

# 후아힌
echo "📍 후아힌 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-hua-hin-chiva-som",
    "region_id": "region-thailand-hua-hin",
    "name_ko": "치바솜 후아힌",
    "name_en": "Chiva-Som International Health Resort",
    "category": "럭셔리",
    "description": "세계 최고의 웰니스 리조트. 건강과 힐링에 특화된 프로그램.",
    "main_image_url": "/static/images/resorts/hua-hin/chiva-som-main.jpg",
    "gallery_images": [],
    "features": ["웰니스 프로그램", "스파", "요가", "건강식", "명상", "피트니스"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-hua-hin-intercontinental",
    "region_id": "region-thailand-hua-hin",
    "name_ko": "인터컨티넨탈 후아힌",
    "name_en": "InterContinental Hua Hin Resort",
    "category": "럭셔리",
    "description": "식민지 시대 건축 양식의 우아한 리조트. 왕실 해변 근처에 위치.",
    "main_image_url": "/static/images/resorts/hua-hin/intercontinental-main.jpg",
    "gallery_images": [],
    "features": ["비치프론트", "골프 코스", "스파", "5개 레스토랑", "키즈클럽", "수영장"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

echo ""
echo "✅ 완료! 데이터 확인 중..."
echo ""

bash check-thailand-resorts.sh
