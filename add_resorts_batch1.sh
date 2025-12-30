#!/bin/bash

API_URL="https://luxurious-honeymoon-website-design.vercel.app/api/resorts"

echo "=== 리조트 데이터 추가 시작 ==="
echo ""

# 몰디브 - 길리 랑칸푸시
echo "1/11: 몰디브 - 길리 랑칸푸시 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-maldives-10",
    "region_id": "region-maldives",
    "name_ko": "길리 랑칸푸시",
    "name_en": "Gili Lankanfushi",
    "category": "럭셔리",
    "description": "세계에서 가장 큰 독립형 수상 빌라를 보유한 초고급 리조트. 맨발의 럭셔리를 추구하며 프라이빗하고 고요한 휴식을 제공합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800&q=80",
      "https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80"
    ],
    "features": [
      "세계 최대 수상 빌라",
      "프라이빗 인피니티 풀",
      "개인 집사 서비스",
      "수상 스파",
      "유기농 레스토랑",
      "스노클링"
    ],
    "display_order": 10,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 1 - 두짓타니 괌 리조트
echo "2/11: 괌 - 두짓타니 괌 리조트 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-1",
    "region_id": "region-pacific-guam",
    "name_ko": "두짓타니 괌 리조트",
    "name_en": "Dusit Thani Guam Resort",
    "category": "럭셔리",
    "description": "투몬 베이의 프라이빗 비치에 위치한 5성급 리조트. 태국의 우아함과 괌의 아름다움이 조화를 이룬 최고급 리조트입니다.",
    "main_image_url": "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "프라이빗 비치",
      "인피니티 풀",
      "럭셔리 스파",
      "5개 레스토랑",
      "키즈 클럽",
      "피트니스 센터"
    ],
    "display_order": 1,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 2 - 하얏트 리젠시 괌
echo "3/11: 괌 - 하얏트 리젠시 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-2",
    "region_id": "region-pacific-guam",
    "name_ko": "하얏트 리젠시 괌",
    "name_en": "Hyatt Regency Guam",
    "category": "럭셔리",
    "description": "투몬 베이 중심에 위치한 최고급 비치프론트 리조트. 탁 트인 오션뷰와 세계적인 서비스를 자랑합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "비치프론트",
      "워터파크",
      "레갈리 스파",
      "8개 레스토랑",
      "캠프 하얏트",
      "웨딩 채플"
    ],
    "display_order": 2,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 3 - 웨스틴 리조트 괌
echo "4/11: 괌 - 웨스틴 리조트 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-3",
    "region_id": "region-pacific-guam",
    "name_ko": "웨스틴 리조트 괌",
    "name_en": "The Westin Resort Guam",
    "category": "프리미엄",
    "description": "투몬 베이의 화이트 샌드 비치에 위치한 프리미엄 리조트. 웨스틴만의 웰니스 프로그램과 편안한 휴식을 제공합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "화이트 샌드 비치",
      "해비니 스파",
      "피트니스 스튜디오",
      "4개 레스토랑",
      "웨스틴 키즈 클럽",
      "수영장 5개"
    ],
    "display_order": 3,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 4 - 힐튼 괌 리조트 앤 스파
echo "5/11: 괌 - 힐튼 괌 리조트 앤 스파 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-4",
    "region_id": "region-pacific-guam",
    "name_ko": "힐튼 괌 리조트 앤 스파",
    "name_en": "Hilton Guam Resort & Spa",
    "category": "프리미엄",
    "description": "투몬 베이의 중심에 위치한 대형 비치 리조트. 가족 단위 여행객에게 최적화된 시설과 서비스를 제공합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "650m 비치",
      "5개 수영장",
      "에포리아 스파",
      "6개 레스토랑",
      "키즈 프로그램",
      "워터 슬라이드"
    ],
    "display_order": 4,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 5 - 호텔 닛코 괌
echo "6/11: 괌 - 호텔 닛코 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-5",
    "region_id": "region-pacific-guam",
    "name_ko": "호텔 닛코 괌",
    "name_en": "Hotel Nikko Guam",
    "category": "프리미엄",
    "description": "일본의 세련된 서비스와 괌의 열대 분위기가 조화를 이룬 프리미엄 비치 리조트입니다.",
    "main_image_url": "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "건스 비치",
      "2개 수영장",
      "만다라 스파",
      "5개 레스토랑",
      "키즈 클럽",
      "테니스 코트"
    ],
    "display_order": 5,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 6 - 로얄 오키드 괌
echo "7/11: 괌 - 로얄 오키드 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-6",
    "region_id": "region-pacific-guam",
    "name_ko": "로얄 오키드 괌",
    "name_en": "Royal Orchid Guam",
    "category": "프리미엄",
    "description": "투몬 베이의 조용한 북쪽 끝에 위치한 프리미엄 호텔. 한적하고 고급스러운 분위기를 자랑합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80"
    ],
    "features": [
      "프라이빗 비치",
      "인피니티 풀",
      "스파",
      "3개 레스토랑",
      "비즈니스 센터",
      "연회장"
    ],
    "display_order": 6,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 7 - 두짓 비치 리조트 괌
echo "8/11: 괌 - 두짓 비치 리조트 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-7",
    "region_id": "region-pacific-guam",
    "name_ko": "두짓 비치 리조트 괌",
    "name_en": "Dusit Beach Resort Guam",
    "category": "스탠다드",
    "description": "투몬 베이의 중심에 위치한 편안한 비치 리조트. 가성비 좋은 숙박과 친절한 서비스를 제공합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "비치프론트",
      "야외 수영장",
      "레스토랑",
      "바",
      "피트니스",
      "무료 와이파이"
    ],
    "display_order": 7,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 8 - 괌 플라자 리조트
echo "9/11: 괌 - 괌 플라자 리조트 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-8",
    "region_id": "region-pacific-guam",
    "name_ko": "괌 플라자 리조트",
    "name_en": "Guam Plaza Resort",
    "category": "스탠다드",
    "description": "투몬 베이 중심가에 위치한 합리적인 가격의 리조트. 쇼핑과 관광에 편리한 위치를 자랑합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "야외 수영장",
      "레스토랑",
      "쇼핑 접근성",
      "무료 셔틀",
      "비즈니스 센터",
      "무료 주차"
    ],
    "display_order": 8,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 9 - 퍼시픽 아일랜드 클럽 괌
echo "10/11: 괌 - 퍼시픽 아일랜드 클럽 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-9",
    "region_id": "region-pacific-guam",
    "name_ko": "퍼시픽 아일랜드 클럽 괌",
    "name_en": "Pacific Islands Club Guam",
    "category": "스탠다드",
    "description": "가족 단위 여행객을 위한 올인클루시브 리조트. 다양한 액티비티와 워터파크를 즐길 수 있습니다.",
    "main_image_url": "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "워터파크",
      "올인클루시브",
      "키즈 클럽",
      "6개 수영장",
      "레스토랑",
      "액티비티"
    ],
    "display_order": 9,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

sleep 1

# 괌 10 - 로테 호텔 괌
echo "11/11: 괌 - 로테 호텔 괌 추가 중..."
curl -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-guam-10",
    "region_id": "region-pacific-guam",
    "name_ko": "로테 호텔 괌",
    "name_en": "Lotte Hotel Guam",
    "category": "프리미엄",
    "description": "한국인 여행객에게 친숙한 프리미엄 비치 리조트. 투몬 베이의 중심에서 편안한 휴식을 제공합니다.",
    "main_image_url": "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=1200&q=80",
    "gallery_images": [
      "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
      "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
      "https://images.unsplash.com/photo-1439130490301-25e322d88054?w=800&q=80"
    ],
    "features": [
      "비치프론트",
      "인피니티 풀",
      "한식당",
      "스파",
      "피트니스",
      "면세점 접근"
    ],
    "display_order": 10,
    "is_active": true
  }' 2>/dev/null && echo "✓ 완료" || echo "✗ 실패"

echo ""
echo "=== 작업 완료 ==="
echo "총 11개 리조트 추가 완료"
echo "- 몰디브: 1개"
echo "- 괌: 10개"
