#!/bin/bash

echo "🌺 하와이 지역 및 리조트 데이터 추가 시작..."
echo ""

# 1. 하와이 지역(Regions) 추가
echo "📍 하와이 지역 데이터 추가..."
echo ""

# 마우이
echo "1️⃣  마우이 (Maui)..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-hawaii-maui",
    "code": "maui",
    "country": "usa",
    "name_ko": "마우이",
    "name_en": "Maui",
    "description": "하와이 제도에서 두 번째로 큰 섬. 황금빛 해변, 할레아칼라 화산, 고래 관찰로 유명한 로맨틱한 휴양지.",
    "image_url": "/static/images/destinations/hawaii/maui.jpg",
    "display_order": 1,
    "is_active": true
  }'
echo ""

# 빅아일랜드
echo "2️⃣  빅아일랜드 (Big Island)..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-hawaii-bigisland",
    "code": "bigisland",
    "country": "usa",
    "name_ko": "빅아일랜드",
    "name_en": "Big Island",
    "description": "하와이에서 가장 큰 섬. 활화산, 블랙 샌드 비치, 다양한 기후대를 경험할 수 있는 자연의 보고.",
    "image_url": "/static/images/destinations/hawaii/bigisland.jpg",
    "display_order": 2,
    "is_active": true
  }'
echo ""

# 오아후
echo "3️⃣  오아후 (Oahu)..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-hawaii-oahu",
    "code": "oahu",
    "country": "usa",
    "name_ko": "오아후",
    "name_en": "Oahu",
    "description": "하와이의 수도 호놀룰루가 있는 섬. 와이키키 비치, 다이아몬드 헤드, 진주만 등 다양한 볼거리가 있는 활기찬 섬.",
    "image_url": "/static/images/destinations/hawaii/oahu.jpg",
    "display_order": 3,
    "is_active": true
  }'
echo ""
echo ""

# 2. 하와이 리조트 추가
echo "🏨 하와이 리조트 데이터 추가..."
echo ""

# 마우이 리조트
echo "📍 마우이 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-maui-four-seasons-wailea",
    "region_id": "region-hawaii-maui",
    "name_ko": "포시즌스 리조트 마우이 와일레아",
    "name_en": "Four Seasons Resort Maui at Wailea",
    "category": "럭셔리",
    "description": "와일레아 해변의 최고급 리조트. 세 개의 인피니티 풀과 수상 경력에 빛나는 스파를 자랑합니다.",
    "main_image_url": "/static/images/resorts/maui/four-seasons-main.jpg",
    "gallery_images": [],
    "features": ["3개 인피니티 풀", "골든 비치", "스파", "7개 레스토랑", "스노클링", "피트니스"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-maui-grand-wailea",
    "region_id": "region-hawaii-maui",
    "name_ko": "그랜드 와일레아 월도프 아스토리아",
    "name_en": "Grand Wailea, A Waldorf Astoria Resort",
    "category": "럭셔리",
    "description": "마우이 최대 규모의 럭셔리 리조트. 워터파크와 세계적인 스파 그란데로 유명합니다.",
    "main_image_url": "/static/images/resorts/maui/grand-wailea-main.jpg",
    "gallery_images": [],
    "features": ["워터파크", "스파 그란데", "9개 풀", "6개 레스토랑", "비치프론트", "키즈 프로그램"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-maui-montage-kapalua",
    "region_id": "region-hawaii-maui",
    "name_ko": "몬타주 카팔루아 베이",
    "name_en": "Montage Kapalua Bay",
    "category": "럭셔리",
    "description": "카팔루아 베이의 고급 레지던스 스타일 리조트. 넓은 빌라와 프라이빗한 분위기.",
    "main_image_url": "/static/images/resorts/maui/montage-main.jpg",
    "gallery_images": [],
    "features": ["레지던스 빌라", "프라이빗 풀", "골프 코스", "스파", "4개 레스토랑", "비치 액세스"],
    "display_order": 3,
    "is_active": true
  }'
echo ""

# 빅아일랜드 리조트
echo "📍 빅아일랜드 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bigisland-four-seasons-hualalai",
    "region_id": "region-hawaii-bigisland",
    "name_ko": "포시즌스 리조트 후알랄라이",
    "name_en": "Four Seasons Resort Hualalai",
    "category": "럭셔리",
    "description": "코나 코스트의 최고급 리조트. 용암 지대에 조성된 독특한 풍경과 프라이빗 비치.",
    "main_image_url": "/static/images/resorts/bigisland/four-seasons-main.jpg",
    "gallery_images": [],
    "features": ["용암 풀", "프라이빗 비치", "골프 코스", "스파", "5개 레스토랑", "스노클링"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bigisland-mauna-kea",
    "region_id": "region-hawaii-bigisland",
    "name_ko": "마우나 케아 비치 호텔",
    "name_en": "Mauna Kea Beach Hotel",
    "category": "럭셔리",
    "description": "1965년 개장한 전설적인 리조트. 화이트 샌드 비치와 세계적인 골프 코스.",
    "main_image_url": "/static/images/resorts/bigisland/mauna-kea-main.jpg",
    "gallery_images": [],
    "features": ["화이트 샌드 비치", "골프 코스", "테니스", "스파", "3개 레스토랑", "아트 컬렉션"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-bigisland-fairmont-orchid",
    "region_id": "region-hawaii-bigisland",
    "name_ko": "페어몬트 오키드",
    "name_en": "Fairmont Orchid",
    "category": "프리미엄",
    "description": "코할라 코스트의 대형 리조트. 가족 단위 여행객과 골프 애호가에게 인기.",
    "main_image_url": "/static/images/resorts/bigisland/fairmont-main.jpg",
    "gallery_images": [],
    "features": ["골프 코스", "10개 테니스 코트", "워터 스포츠", "스파", "5개 레스토랑", "키즈클럽"],
    "display_order": 3,
    "is_active": true
  }'
echo ""

# 오아후 리조트
echo "📍 오아후 리조트..."
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-oahu-halekulani",
    "region_id": "region-hawaii-oahu",
    "name_ko": "할레쿨라니",
    "name_en": "Halekulani",
    "category": "럭셔리",
    "description": "와이키키 비치의 전설적인 럭셔리 호텔. 오키드 풀과 미슐랭 레스토랑 라 메르.",
    "main_image_url": "/static/images/resorts/oahu/halekulani-main.jpg",
    "gallery_images": [],
    "features": ["오션프론트", "오키드 풀", "미슐랭 레스토랑", "스파", "라이브 음악", "선셋 칵테일"],
    "display_order": 1,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-oahu-turtle-bay",
    "region_id": "region-hawaii-oahu",
    "name_ko": "터틀 베이 리조트",
    "name_en": "Turtle Bay Resort",
    "category": "프리미엄",
    "description": "노스 쇼어의 대형 리조트. 서핑과 골프의 천국, 한적한 분위기.",
    "main_image_url": "/static/images/resorts/oahu/turtle-bay-main.jpg",
    "gallery_images": [],
    "features": ["5마일 해변", "2개 골프 코스", "서핑", "승마", "6개 레스토랑", "스파"],
    "display_order": 2,
    "is_active": true
  }'
echo ""

curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-oahu-royal-hawaiian",
    "region_id": "region-hawaii-oahu",
    "name_ko": "로얄 하와이안",
    "name_en": "The Royal Hawaiian",
    "category": "럭셔리",
    "description": "1927년 개장한 핑크 팰리스. 와이키키 비치의 아이콘이자 역사적 랜드마크.",
    "main_image_url": "/static/images/resorts/oahu/royal-hawaiian-main.jpg",
    "gallery_images": [],
    "features": ["역사적 건물", "비치프론트", "스파", "3개 레스토랑", "마이타이 바", "쇼핑"],
    "display_order": 3,
    "is_active": true
  }'
echo ""

echo ""
echo "✅ 완료! 데이터 확인 중..."
echo ""

# 확인
echo "📊 하와이 지역 확인..."
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/regions?country=usa" | jq -r '.data[] | "   ✅ \(.name_ko) (\(.name_en))"'
echo ""

echo "📊 하와이 리조트 확인..."
for region_id in "region-hawaii-maui" "region-hawaii-bigisland" "region-hawaii-oahu"; do
  region_name=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/regions" | jq -r ".data[] | select(.id==\"$region_id\") | .name_ko")
  echo "   🏝️  $region_name:"
  curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=$region_id" | jq -r '.data[] | "      - \(.name_ko)"'
done

echo ""
echo "🎉 하와이 데이터 추가 완료!"
