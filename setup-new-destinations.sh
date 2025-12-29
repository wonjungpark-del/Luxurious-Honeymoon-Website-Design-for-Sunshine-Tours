#!/bin/bash

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "=== 새 여행지 설정: 다낭, 남태평양, 유럽 ==="
echo ""

# 1. 다낭 (베트남)
echo "📍 다낭 지역 생성..."
curl -s -X POST "$BASE_URL/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-vietnam-danang",
    "country": "vietnam",
    "code": "danang",
    "name_ko": "다낭",
    "name_en": "Da Nang",
    "description": "베트남 중부의 아름다운 해변 도시. 유네스코 세계문화유산 호이안과 가까운 휴양지.",
    "image_url": "/static/images/destinations/danang/danang.jpg",
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

echo "📍 다낭 리조트 추가..."

# 다낭 리조트 1
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-danang-intercontinental",
    "region_id": "region-vietnam-danang",
    "name_ko": "인터컨티넨탈 다낭",
    "name_en": "InterContinental Danang Sun Peninsula Resort",
    "category": "럭셔리",
    "description": "세계 최고의 리조트로 선정된 곳. 산과 바다가 어우러진 절경과 최상급 서비스.",
    "main_image_url": "/static/images/resorts/danang/danang-resort01-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["인피니티 풀", "미슐랭 레스토랑", "프라이빗 비치", "스파"],
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

# 다낭 리조트 2
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-danang-pullman",
    "region_id": "region-vietnam-danang",
    "name_ko": "풀만 다낭",
    "name_en": "Pullman Danang Beach Resort",
    "category": "프리미엄",
    "description": "논느억 해변의 5성급 리조트. 넓은 객실과 다양한 액티비티로 가족 여행객에게 인기.",
    "main_image_url": "/static/images/resorts/danang/danang-resort02-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["대형 수영장", "키즈 클럽", "비치프론트", "레스토랑"],
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

# 다낭 리조트 3
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-danang-furama",
    "region_id": "region-vietnam-danang",
    "name_ko": "푸라마 리조트",
    "name_en": "Furama Resort Danang",
    "category": "프리미엄",
    "description": "다낭 최초의 5성급 리조트. 넓은 정원과 프라이빗 비치가 매력적.",
    "main_image_url": "/static/images/resorts/danang/danang-resort03-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["열대 정원", "프라이빗 비치", "풀빌라", "골프장"],
    "display_order": 3,
    "is_active": true
  }' | jq -r '.message'

echo ""
echo "✅ 다낭 완료 (3개 리조트)"
echo ""

# 2. 남태평양 - 피지
echo "📍 피지 지역 생성..."
curl -s -X POST "$BASE_URL/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-fiji",
    "country": "southpacific",
    "code": "fiji",
    "name_ko": "피지",
    "name_en": "Fiji",
    "description": "남태평양의 천국. 300여 개의 섬으로 이루어진 열대 낙원으로 청정 산호초와 프라이빗 아일랜드 리조트.",
    "image_url": "/static/images/destinations/fiji/fiji.jpg",
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

echo "📍 피지 리조트 추가..."

# 피지 리조트 1
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-fiji-likuliku",
    "region_id": "region-fiji",
    "name_ko": "리쿨리쿠 라군",
    "name_en": "Likuliku Lagoon Resort",
    "category": "럭셔리",
    "description": "피지 최초의 오버워터 방갈로. 성인 전용 리조트로 완벽한 프라이빗 허니문.",
    "main_image_url": "/static/images/resorts/fiji/fiji-resort01-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["오버워터 방갈로", "성인 전용", "스쿠버 다이빙", "스파"],
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

# 피지 리조트 2
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-fiji-tokoriki",
    "region_id": "region-fiji",
    "name_ko": "토코리키 아일랜드",
    "name_en": "Tokoriki Island Resort",
    "category": "럭셔리",
    "description": "부티크 스타일의 프라이빗 아일랜드 리조트. 로맨틱한 분위기와 최상급 서비스.",
    "main_image_url": "/static/images/resorts/fiji/fiji-resort02-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["프라이빗 아일랜드", "비치프론트 빌라", "스노클링", "선셋 크루즈"],
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

# 피지 리조트 3
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-fiji-yasawa",
    "region_id": "region-fiji",
    "name_ko": "야사와 아일랜드",
    "name_en": "Yasawa Island Resort",
    "category": "럭셔리",
    "description": "야사와 제도의 독점적인 프라이빗 리조트. 영화 촬영지로도 유명한 천국의 섬.",
    "main_image_url": "/static/images/resorts/fiji/fiji-resort03-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["화이트 샌드 비치", "만타레이 다이빙", "로맨틱 디너", "카약"],
    "display_order": 3,
    "is_active": true
  }' | jq -r '.message'

echo ""
echo "✅ 피지 완료 (3개 리조트)"
echo ""

# 3. 남태평양 - 타히티/보라보라
echo "📍 타히티/보라보라 지역 생성..."
curl -s -X POST "$BASE_URL/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-tahiti-borabora",
    "country": "southpacific",
    "code": "borabora",
    "name_ko": "타히티/보라보라",
    "name_en": "Tahiti/Bora Bora",
    "description": "프랑스령 폴리네시아의 보석. 세계에서 가장 아름다운 석호와 럭셔리 오버워터 빌라.",
    "image_url": "/static/images/destinations/borabora/borabora.jpg",
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

echo "📍 보라보라 리조트 추가..."

# 보라보라 리조트 1
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-borabora-stregis",
    "region_id": "region-tahiti-borabora",
    "name_ko": "세인트 레지스 보라보라",
    "name_en": "The St. Regis Bora Bora Resort",
    "category": "럭셔리",
    "description": "세계 최고의 오버워터 빌라. 유리 바닥을 통해 산호초를 감상할 수 있는 특별한 경험.",
    "main_image_url": "/static/images/resorts/borabora/borabora-resort01-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["오버워터 빌라", "유리 바닥", "버틀러 서비스", "라군 뷰"],
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

# 보라보라 리조트 2
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-borabora-fourseasons",
    "region_id": "region-tahiti-borabora",
    "name_ko": "포시즌스 보라보라",
    "name_en": "Four Seasons Resort Bora Bora",
    "category": "럭셔리",
    "description": "오테마누 산이 보이는 최상급 리조트. 프라이빗 풀장이 있는 오버워터 방갈로.",
    "main_image_url": "/static/images/resorts/borabora/borabora-resort02-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["프라이빗 풀", "오테마누 산 뷰", "고급 레스토랑", "스파"],
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

# 보라보라 리조트 3
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-borabora-intercontinental",
    "region_id": "region-tahiti-borabora",
    "name_ko": "인터컨티넨탈 보라보라",
    "name_en": "InterContinental Bora Bora Resort",
    "category": "럭셔리",
    "description": "에메랄드 빛 석호 위의 워터 빌라. 스노클링과 상어 먹이주기 체험.",
    "main_image_url": "/static/images/resorts/borabora/borabora-resort03-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["에메랄드 라군", "상어 체험", "스노클링", "카누"],
    "display_order": 3,
    "is_active": true
  }' | jq -r '.message'

echo ""
echo "✅ 타히티/보라보라 완료 (3개 리조트)"
echo ""

# 4. 유럽 - 그리스 산토리니
echo "📍 그리스 산토리니 지역 생성..."
curl -s -X POST "$BASE_URL/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-greece-santorini",
    "country": "europe",
    "code": "santorini",
    "name_ko": "산토리니",
    "name_en": "Santorini",
    "description": "그리스 에게해의 백색 마을과 파란 돔. 세계에서 가장 로맨틱한 석양의 섬.",
    "image_url": "/static/images/destinations/santorini/santorini.jpg",
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

echo "📍 산토리니 리조트 추가..."

# 산토리니 리조트 1
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-santorini-katikies",
    "region_id": "region-greece-santorini",
    "name_ko": "카티키에스 호텔",
    "name_en": "Katikies Hotel Santorini",
    "category": "럭셔리",
    "description": "칼데라 절벽 위의 부티크 호텔. 인피니티 풀과 에게해 선셋이 압권.",
    "main_image_url": "/static/images/resorts/santorini/santorini-resort01-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["칼데라 뷰", "인피니티 풀", "동굴 스위트", "선셋 디너"],
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

# 산토리니 리조트 2
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-santorini-canaves-oia",
    "region_id": "region-greece-santorini",
    "name_ko": "카나베스 오이아",
    "name_en": "Canaves Oia Suites",
    "category": "럭셔리",
    "description": "오이아 마을의 최고급 스위트. 전용 풀과 칼데라 전망의 완벽한 조화.",
    "main_image_url": "/static/images/resorts/santorini/santorini-resort02-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["프라이빗 풀", "칼데라 뷰", "럭셔리 스위트", "와인 투어"],
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

# 산토리니 리조트 3
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-santorini-mystique",
    "region_id": "region-greece-santorini",
    "name_ko": "미스티크 호텔",
    "name_en": "Mystique Hotel Santorini",
    "category": "럭셔리",
    "description": "성인 전용 부티크 호텔. 미니멀리즘 디자인과 최상급 서비스.",
    "main_image_url": "/static/images/resorts/santorini/santorini-resort03-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["성인 전용", "동굴 풀", "미슐랭 레스토랑", "스파"],
    "display_order": 3,
    "is_active": true
  }' | jq -r '.message'

echo ""
echo "✅ 산토리니 완료 (3개 리조트)"
echo ""

# 5. 유럽 - 이탈리아 아말피
echo "📍 이탈리아 아말피 지역 생성..."
curl -s -X POST "$BASE_URL/api/regions" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "region-italy-amalfi",
    "country": "europe",
    "code": "amalfi",
    "name_ko": "아말피 코스트",
    "name_en": "Amalfi Coast",
    "description": "이탈리아 남부의 해안 절경. 유네스코 세계문화유산으로 레몬 향기가 가득한 낭만의 해안선.",
    "image_url": "/static/images/destinations/amalfi/amalfi.jpg",
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

echo "📍 아말피 리조트 추가..."

# 아말피 리조트 1
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-amalfi-monastero",
    "region_id": "region-italy-amalfi",
    "name_ko": "모나스테로 산타 로사",
    "name_en": "Monastero Santa Rosa Hotel & Spa",
    "category": "럭셔리",
    "description": "17세기 수도원을 개조한 5성급 호텔. 인피니티 풀에서 바라보는 아말피 해안.",
    "main_image_url": "/static/images/resorts/amalfi/amalfi-resort01-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["인피니티 풀", "미슐랭 레스토랑", "스파", "해안 전망"],
    "display_order": 1,
    "is_active": true
  }' | jq -r '.message'

# 아말피 리조트 2
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-amalfi-belmond",
    "region_id": "region-italy-amalfi",
    "name_ko": "벨몬드 호텔 카루소",
    "name_en": "Belmond Hotel Caruso",
    "category": "럭셔리",
    "description": "11세기 궁전을 리모델링한 럭셔리 호텔. 라벨로 마을의 절경과 우아한 분위기.",
    "main_image_url": "/static/images/resorts/amalfi/amalfi-resort02-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["역사적 건축", "정원 테라스", "이탈리안 레스토랑", "와인 셀러"],
    "display_order": 2,
    "is_active": true
  }' | jq -r '.message'

# 아말피 리조트 3
curl -s -X POST "$BASE_URL/api/resorts" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "resort-amalfi-mezzatorre",
    "region_id": "region-italy-amalfi",
    "name_ko": "메짜토레 리조트",
    "name_en": "Mezzatorre Resort & Spa",
    "category": "럭셔리",
    "description": "이스키아 섬의 열대 정원 리조트. 천연 온천과 스파가 유명.",
    "main_image_url": "/static/images/resorts/amalfi/amalfi-resort03-01.webp",
    "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
    "features": ["천연 온천", "열대 정원", "프라이빗 비치", "스파"],
    "display_order": 3,
    "is_active": true
  }' | jq -r '.message'

echo ""
echo "✅ 아말피 코스트 완료 (3개 리조트)"
echo ""

echo "🎉 === 모든 여행지 설정 완료 === 🎉"
echo ""
echo "📊 요약:"
echo "- 다낭: 3개 리조트"
echo "- 피지: 3개 리조트"
echo "- 타히티/보라보라: 3개 리조트"
echo "- 산토리니: 3개 리조트"
echo "- 아말피 코스트: 3개 리조트"
echo ""
echo "총 5개 지역, 15개 리조트 추가됨"
