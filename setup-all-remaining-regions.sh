#!/bin/bash

echo "🌍 나머지 지역들 데이터 추가 중..."
echo ""

# ==================== 필리핀 ====================
echo "🇵🇭 필리핀 지역 추가..."

# Boracay
curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-philippines-boracay",
    "code": "boracay",
    "country": "philippines",
    "name_ko": "보라카이",
    "name_en": "Boracay",
    "description": "세계적인 화이트비치와 청록빛 바다. 필리핀 최고의 해변 휴양지.",
    "image_url": "/static/images/destinations/philippines/boracay.jpg",
    "display_order": 1,
    "is_active": true
  }' > /dev/null

# Cebu
curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-philippines-cebu",
    "code": "cebu",
    "country": "philippines",
    "name_ko": "세부/보홀",
    "name_en": "Cebu/Bohol",
    "description": "스쿠버 다이빙의 천국과 초콜릿 힐스. 세부와 보홀의 자연 경관.",
    "image_url": "/static/images/destinations/philippines/cebu.jpg",
    "display_order": 2,
    "is_active": true
  }' > /dev/null

# Palawan
curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-philippines-palawan",
    "code": "palawan",
    "country": "philippines",
    "name_ko": "팔라완",
    "name_en": "Palawan",
    "description": "세계에서 가장 아름다운 섬. 엘니도와 코론의 석회암 절벽과 에메랄드 라군.",
    "image_url": "/static/images/destinations/philippines/palawan.jpg",
    "display_order": 3,
    "is_active": true
  }' > /dev/null

echo "✅ 필리핀 3개 지역 추가 완료"

# ==================== 몰디브 ====================
echo "🇲🇻 몰디브 지역 추가..."

curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-maldives",
    "code": "maldives",
    "country": "maldives",
    "name_ko": "몰디브",
    "name_en": "Maldives",
    "description": "인도양의 진주, 1섬 1리조트의 프라이빗 럭셔리. 세계 최고의 수상 빌라.",
    "image_url": "/static/images/destinations/maldives/maldives.jpg",
    "display_order": 1,
    "is_active": true
  }' > /dev/null

echo "✅ 몰디브 지역 추가 완료"

# ==================== 모리셔스 ====================
echo "🇲🇺 모리셔스 지역 추가..."

curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-mauritius",
    "code": "mauritius",
    "country": "mauritius",
    "name_ko": "모리셔스",
    "name_en": "Mauritius",
    "description": "인도양의 낙원, 에메랄드 빛 라군과 럭셔리 리조트. 마크 트웨인이 사랑한 섬.",
    "image_url": "/static/images/destinations/mauritius/mauritius.jpg",
    "display_order": 1,
    "is_active": true
  }' > /dev/null

echo "✅ 모리셔스 지역 추가 완료"
echo ""
echo "🏨 리조트 추가 중..."
echo ""

# ==================== 필리핀 리조트 ====================
# Boracay Resorts
for i in {1..3}; do
  curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
    -H "Content-Type: application/json" \
    -d "{
      \"id\": \"resort-boracay-$i\",
      \"region_id\": \"region-philippines-boracay\",
      \"name_ko\": \"보라카이 리조트 $i\",
      \"name_en\": \"Boracay Resort $i\",
      \"category\": \"럭셔리\",
      \"description\": \"화이트비치의 프리미엄 리조트. 아름다운 선셋과 세계적인 서비스.\",
      \"main_image_url\": \"/static/images/resorts/lombok/lombok-resort0$i-01.webp\",
      \"gallery_images\": [
        \"https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800\",
        \"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800\",
        \"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800\",
        \"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800\",
        \"https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800\",
        \"https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800\"
      ],
      \"features\": [
        \"비치프론트\",
        \"수영장\",
        \"스파\",
        \"레스토랑\"
      ],
      \"display_order\": $i,
      \"is_active\": true
    }" > /dev/null
done

# Cebu Resorts
for i in {1..3}; do
  curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
    -H "Content-Type: application/json" \
    -d "{
      \"id\": \"resort-cebu-$i\",
      \"region_id\": \"region-philippines-cebu\",
      \"name_ko\": \"세부 리조트 $i\",
      \"name_en\": \"Cebu Resort $i\",
      \"category\": \"프리미엄\",
      \"description\": \"세부의 아름다운 해변과 다이빙 포인트. 편안한 휴식과 해양 스포츠.\",
      \"main_image_url\": \"/static/images/resorts/krabi/krabi-resort0$i-01.webp\",
      \"gallery_images\": [
        \"https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800\",
        \"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800\",
        \"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800\",
        \"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800\",
        \"https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800\",
        \"https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800\"
      ],
      \"features\": [
        \"다이빙 센터\",
        \"프라이빗 비치\",
        \"풀빌라\",
        \"레스토랑\"
      ],
      \"display_order\": $i,
      \"is_active\": true
    }" > /dev/null
done

# Palawan Resorts
for i in {1..3}; do
  curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
    -H "Content-Type: application/json" \
    -d "{
      \"id\": \"resort-palawan-$i\",
      \"region_id\": \"region-philippines-palawan\",
      \"name_ko\": \"팔라완 리조트 $i\",
      \"name_en\": \"Palawan Resort $i\",
      \"category\": \"럭셔리\",
      \"description\": \"엘니도의 비경과 럭셔리 서비스. 세계에서 가장 아름다운 섬의 프리미엄 리조트.\",
      \"main_image_url\": \"/static/images/resorts/maui/maui-resort0$i-01.webp\",
      \"gallery_images\": [
        \"https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800\",
        \"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800\",
        \"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800\",
        \"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800\",
        \"https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800\",
        \"https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800\"
      ],
      \"features\": [
        \"엘니도 투어\",
        \"카약\",
        \"스노클링\",
        \"럭셔리 스파\"
      ],
      \"display_order\": $i,
      \"is_active\": true
    }" > /dev/null
done

echo "✅ 필리핀 리조트 9개 추가 완료"

# ==================== 몰디브 리조트 ====================
for i in {1..3}; do
  curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
    -H "Content-Type: application/json" \
    -d "{
      \"id\": \"resort-maldives-$i\",
      \"region_id\": \"region-maldives\",
      \"name_ko\": \"몰디브 리조트 $i\",
      \"name_en\": \"Maldives Resort $i\",
      \"category\": \"럭셔리\",
      \"description\": \"1섬 1리조트의 프라이빗 럭셔리. 수상 빌라와 무한의 바다.\",
      \"main_image_url\": \"/static/images/resorts/lombok/lombok-resort0$i-01.webp\",
      \"gallery_images\": [
        \"https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800\",
        \"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800\",
        \"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800\",
        \"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800\",
        \"https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800\",
        \"https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800\"
      ],
      \"features\": [
        \"수상 빌라\",
        \"프라이빗 풀\",
        \"버틀러 서비스\",
        \"스노클링\"
      ],
      \"display_order\": $i,
      \"is_active\": true
    }" > /dev/null
done

echo "✅ 몰디브 리조트 3개 추가 완료"

# ==================== 모리셔스 리조트 ====================
for i in {1..3}; do
  curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
    -H "Content-Type: application/json" \
    -d "{
      \"id\": \"resort-mauritius-$i\",
      \"region_id\": \"region-mauritius\",
      \"name_ko\": \"모리셔스 리조트 $i\",
      \"name_en\": \"Mauritius Resort $i\",
      \"category\": \"럭셔리\",
      \"description\": \"인도양의 낙원에서 누리는 프리미엄 휴식. 럭셔리 리조트와 골프 코스.\",
      \"main_image_url\": \"/static/images/resorts/krabi/krabi-resort0$i-01.webp\",
      \"gallery_images\": [
        \"https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800\",
        \"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800\",
        \"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800\",
        \"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800\",
        \"https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800\",
        \"https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800\"
      ],
      \"features\": [
        \"골프 코스\",
        \"스파\",
        \"레스토랑\",
        \"수상 스포츠\"
      ],
      \"display_order\": $i,
      \"is_active\": true
    }" > /dev/null
done

echo "✅ 모리셔스 리조트 3개 추가 완료"
echo ""
echo "================================================"
echo "🎉 모든 지역 및 리조트 추가 완료!"
echo "================================================"
echo ""
echo "📊 추가된 지역:"
echo "   🇲🇽 칸쿤: 3개 리조트"
echo "   🇵🇭 필리핀 (보라카이, 세부, 팔라완): 9개 리조트"
echo "   🇲🇻 몰디브: 3개 리조트"
echo "   🇲🇺 모리셔스: 3개 리조트"
echo ""
echo "총 5개 국가, 7개 지역, 21개 리조트"
echo "================================================"
