#!/bin/bash

echo "🇲🇽 칸쿤 데이터 추가 중..."

# Create region
curl -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-cancun",
    "code": "cancun",
    "country": "mexico",
    "name_ko": "칸쿤",
    "name_en": "Cancun",
    "description": "카리브해의 에메랄드빛 바다와 마야 문명이 공존하는 멕시코 최고의 휴양지. 올 인클루시브 리조트의 천국.",
    "image_url": "/static/images/destinations/cancun/cancun.jpg",
    "display_order": 1,
    "is_active": true
  }'

echo ""
echo "✅ 칸쿤 지역 추가 완료"
echo ""

# Add resorts
echo "리조트 추가 중..."

# Resort 1: Hyatt Zilara
curl -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-cancun-hyatt-zilara",
    "region_id": "region-cancun",
    "name_ko": "하얏트 질라라 칸쿤",
    "name_en": "Hyatt Zilara Cancun",
    "category": "럭셔리",
    "description": "성인 전용 올 인클루시브 리조트. 카리브해의 투명한 바다와 세계적인 서비스를 자랑하는 프리미엄 리조트.",
    "main_image_url": "/static/images/resorts/lombok/lombok-resort01-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": [
      "올 인클루시브",
      "프라이빗 비치",
      "무제한 식사",
      "프리미엄 바"
    ],
    "display_order": 1,
    "is_active": true
  }'

echo ""

# Resort 2: Excellence Playa Mujeres
curl -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-cancun-excellence",
    "region_id": "region-cancun",
    "name_ko": "엑설런스 플라야 무헤레스",
    "name_en": "Excellence Playa Mujeres",
    "category": "럭셔리",
    "description": "성인 전용 올 인클루시브. 플라야 무헤레스의 고급스러운 분위기와 최상급 서비스.",
    "main_image_url": "/static/images/resorts/krabi/krabi-resort01-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": [
      "올 인클루시브",
      "스위트 룸",
      "고급 레스토랑",
      "스파"
    ],
    "display_order": 2,
    "is_active": true
  }'

echo ""

# Resort 3: Le Blanc Spa Resort
curl -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-cancun-leblanc",
    "region_id": "region-cancun",
    "name_ko": "르블랑 스파 리조트",
    "name_en": "Le Blanc Spa Resort",
    "category": "럭셔리",
    "description": "칸쿤 최고급 성인 전용 리조트. 세계적인 스파와 미슐랭 스타일 레스토랑.",
    "main_image_url": "/static/images/resorts/maui/maui-resort01-01.webp",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800",
      "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800",
      "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"
    ],
    "features": [
      "럭셔리 스파",
      "버틀러 서비스",
      "고급 레스토랑",
      "프리미엄 바"
    ],
    "display_order": 3,
    "is_active": true
  }'

echo ""
echo "✅ 칸쿤 리조트 3개 추가 완료"
echo ""
echo "📍 확인: https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-cancun"
