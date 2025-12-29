#!/bin/bash

# 신규 지역 DB 생성 스크립트 (남태평양 3개 + 유럽 8개)
# Base URL for API
BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "==================================="
echo "신규 지역 및 리조트 데이터 생성"
echo "==================================="

# --------------------------------------------------
# 남태평양 3개 지역 (괌, 사이판, 호주)
# --------------------------------------------------

echo ""
echo "📍 남태평양 - 괌 (Guam)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-southpacific-guam",
  "code": "guam",
  "country": "southpacific",
  "name_ko": "괌",
  "name_en": "Guam",
  "description": "미국령 태평양의 휴양지. 아름다운 비치와 워터 액티비티로 유명.",
  "image_url": "/static/images/destinations/guam/guam.jpg",
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 괌 리조트 1 - 두짓타니 괌"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-guam-dusit",
  "region_id": "region-southpacific-guam",
  "name_ko": "두짓타니 괌",
  "name_en": "Dusit Thani Guam Resort",
  "category": "럭셔리",
  "description": "괌 최고급 비치프론트 리조트. 넓은 야외 수영장과 프라이빗 비치.",
  "main_image_url": "/static/images/resorts/guam/guam-resort01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["인피니티 풀", "프라이빗 비치", "스파", "워터 스포츠"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 괌 리조트 2 - 하얏트 리젠시"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-guam-hyatt",
  "region_id": "region-southpacific-guam",
  "name_ko": "하얏트 리젠시 괌",
  "name_en": "Hyatt Regency Guam",
  "category": "프리미엄",
  "description": "투몬베이의 중심. 다양한 레스토랑과 쇼핑 접근성이 뛰어남.",
  "main_image_url": "/static/images/resorts/guam/guam-resort02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["대형 수영장", "키즈 클럽", "비치프론트", "레스토랑"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 괌 리조트 3 - 힐튼 괌"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-guam-hilton",
  "region_id": "region-southpacific-guam",
  "name_ko": "힐튼 괌 리조트",
  "name_en": "Hilton Guam Resort & Spa",
  "category": "프리미엄",
  "description": "투몬베이 해변의 대표 리조트. 가족 여행객에게 인기.",
  "main_image_url": "/static/images/resorts/guam/guam-resort03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["워터파크", "스파", "비치", "다이닝"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 남태평양 - 사이판 (Saipan)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-southpacific-saipan",
  "code": "saipan",
  "country": "southpacific",
  "name_ko": "사이판",
  "name_en": "Saipan",
  "description": "북마리아나 제도의 천국. 에메랄드 바다와 한적한 리조트.",
  "image_url": "/static/images/destinations/saipan/saipan.jpg",
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 사이판 리조트 1 - 켄싱턴"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-saipan-kensington",
  "region_id": "region-southpacific-saipan",
  "name_ko": "켄싱턴 호텔 사이판",
  "name_en": "Kensington Hotel Saipan",
  "category": "럭셔리",
  "description": "사이판 최고급 비치프론트 호텔. 한국인에게 인기.",
  "main_image_url": "/static/images/resorts/saipan/saipan-resort01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["인피니티 풀", "프라이빗 비치", "스파", "한식 레스토랑"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 사이판 리조트 2 - 아쿠아"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-saipan-aqua",
  "region_id": "region-southpacific-saipan",
  "name_ko": "아쿠아 리조트 클럽",
  "name_en": "Aqua Resort Club Saipan",
  "category": "프리미엄",
  "description": "오션뷰가 아름다운 가족형 리조트. 다양한 액티비티.",
  "main_image_url": "/static/images/resorts/saipan/saipan-resort02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["대형 수영장", "키즈 클럽", "다이빙", "레스토랑"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 사이판 리조트 3 - 하얏트"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-saipan-hyatt",
  "region_id": "region-southpacific-saipan",
  "name_ko": "하얏트 리젠시 사이판",
  "name_en": "Hyatt Regency Saipan",
  "category": "프리미엄",
  "description": "마이크로비치의 고급 리조트. 최상급 서비스.",
  "main_image_url": "/static/images/resorts/saipan/saipan-resort03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["비치프론트", "스파", "레스토랑", "바"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 남태평양 - 호주 (Australia)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-southpacific-australia",
  "code": "australia",
  "country": "southpacific",
  "name_ko": "호주",
  "name_en": "Australia",
  "description": "그레이트 배리어 리프와 골드코스트. 세계적인 휴양지.",
  "image_url": "/static/images/destinations/australia/australia.jpg",
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "🏨 호주 리조트 1 - 헤이만 아일랜드"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-australia-hayman",
  "region_id": "region-southpacific-australia",
  "name_ko": "헤이만 아일랜드",
  "name_en": "Hayman Island by InterContinental",
  "category": "럭셔리",
  "description": "그레이트 배리어 리프의 프라이빗 아일랜드. 최고급 리조트.",
  "main_image_url": "/static/images/resorts/australia/australia-resort01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["프라이빗 아일랜드", "스쿠버 다이빙", "스파", "미슐랭 레스토랑"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 호주 리조트 2 - 퀄리아"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-australia-qualia",
  "region_id": "region-southpacific-australia",
  "name_ko": "퀄리아 리조트",
  "name_en": "qualia Resort",
  "category": "럭셔리",
  "description": "해밀턴 아일랜드의 부티크 리조트. 럭셔리 프라이버시.",
  "main_image_url": "/static/images/resorts/australia/australia-resort02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["프라이빗 비치", "인피니티 풀", "스파", "와인 다이닝"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 호주 리조트 3 - 베르사체"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-australia-versace",
  "region_id": "region-southpacific-australia",
  "name_ko": "베르사체 골드코스트",
  "name_en": "Palazzo Versace Gold Coast",
  "category": "럭셔리",
  "description": "세계 최초의 베르사체 호텔. 이탈리아식 럭셔리.",
  "main_image_url": "/static/images/resorts/australia/australia-resort03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800","https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800","https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800","https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"],
  "features": ["럭셔리 인테리어", "마리나", "스파", "파인 다이닝"],
  "is_active": true,
  "display_order": 3
}'

# --------------------------------------------------
# 유럽 8개 지역
# --------------------------------------------------

echo ""
echo "📍 유럽 - 파리 (Paris)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-paris",
  "code": "paris",
  "country": "europe",
  "name_ko": "파리",
  "name_en": "Paris",
  "description": "낭만의 도시, 에펠탑과 센 강이 어우러진 예술의 도시.",
  "image_url": "/static/images/destinations/paris/paris.jpg",
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 파리 호텔 1 - 리츠"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-paris-ritz",
  "region_id": "region-europe-paris",
  "name_ko": "리츠 파리",
  "name_en": "Ritz Paris",
  "category": "럭셔리",
  "description": "파리 최고의 럭셔리 호텔. 역사와 전통이 살아있는 곳.",
  "main_image_url": "/static/images/resorts/paris/paris-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800","https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=800","https://images.unsplash.com/photo-1549294413-26f195200c16?w=800","https://images.unsplash.com/photo-1550340499-a6c60fc8287c?w=800","https://images.unsplash.com/photo-1431274172761-fca41d930114?w=800","https://images.unsplash.com/photo-1444201983204-c43cbd584d93?w=800"],
  "features": ["미슐랭 레스토랑", "스파", "에펠탑 뷰", "바"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 파리 호텔 2 - 플라자 아테네"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-paris-plaza",
  "region_id": "region-europe-paris",
  "name_ko": "플라자 아테네",
  "name_en": "Hotel Plaza Athenee",
  "category": "럭셔리",
  "description": "샹젤리제 거리의 아이콘. 프렌치 엘레강스의 정수.",
  "main_image_url": "/static/images/resorts/paris/paris-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800","https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=800","https://images.unsplash.com/photo-1549294413-26f195200c16?w=800","https://images.unsplash.com/photo-1550340499-a6c60fc8287c?w=800","https://images.unsplash.com/photo-1431274172761-fca41d930114?w=800","https://images.unsplash.com/photo-1444201983204-c43cbd584d93?w=800"],
  "features": ["에펠탑 뷰", "미슐랭 스타", "스파", "루프톱 바"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 파리 호텔 3 - 조르주 생크"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-paris-four-seasons",
  "region_id": "region-europe-paris",
  "name_ko": "포시즌스 조르주 생크",
  "name_en": "Four Seasons George V",
  "category": "럭셔리",
  "description": "파리 8구의 아르데코 팰리스. 최고급 서비스.",
  "main_image_url": "/static/images/resorts/paris/paris-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800","https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=800","https://images.unsplash.com/photo-1549294413-26f195200c16?w=800","https://images.unsplash.com/photo-1550340499-a6c60fc8287c?w=800","https://images.unsplash.com/photo-1431274172761-fca41d930114?w=800","https://images.unsplash.com/photo-1444201983204-c43cbd584d93?w=800"],
  "features": ["미슐랭 3스타", "플라워 데코", "스파", "컨시어지"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 로마 (Rome)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-rome",
  "code": "rome",
  "country": "europe",
  "name_ko": "로마",
  "name_en": "Rome",
  "description": "영원의 도시, 콜로세움과 고대 유적이 살아있는 곳.",
  "image_url": "/static/images/destinations/rome/rome.jpg",
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 로마 호텔 1 - 해슬러"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-rome-hassler",
  "region_id": "region-europe-rome",
  "name_ko": "호텔 해슬러",
  "name_en": "Hotel Hassler Roma",
  "category": "럭셔리",
  "description": "스페인 계단 정상의 전설적인 호텔. 로마 최고의 전망.",
  "main_image_url": "/static/images/resorts/rome/rome-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800","https://images.unsplash.com/photo-1529260830199-42c24126f198?w=800","https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=800","https://images.unsplash.com/photo-1525874684015-58379d421a52?w=800","https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800","https://images.unsplash.com/photo-1531572753322-ad063cecc140?w=800"],
  "features": ["루프톱 레스토랑", "스파", "컨시어지", "바티칸 뷰"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 로마 호텔 2 - 세인트 레지스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-rome-stregis",
  "region_id": "region-europe-rome",
  "name_ko": "세인트 레지스 로마",
  "name_en": "The St. Regis Rome",
  "category": "럭셔리",
  "description": "보르게세 공원 근처의 우아한 팰리스 호텔.",
  "main_image_url": "/static/images/resorts/rome/rome-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800","https://images.unsplash.com/photo-1529260830199-42c24126f198?w=800","https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=800","https://images.unsplash.com/photo-1525874684015-58379d421a52?w=800","https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800","https://images.unsplash.com/photo-1531572753322-ad063cecc140?w=800"],
  "features": ["미슐랭 레스토랑", "버틀러 서비스", "스파", "바"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 로마 호텔 3 - 로코 포르테"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-rome-rocco-forte",
  "region_id": "region-europe-rome",
  "name_ko": "호텔 드 러시",
  "name_en": "Hotel de Russie",
  "category": "럭셔리",
  "description": "스페인 광장과 포폴로 광장 사이의 시크릿 가든.",
  "main_image_url": "/static/images/resorts/rome/rome-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800","https://images.unsplash.com/photo-1529260830199-42c24126f198?w=800","https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=800","https://images.unsplash.com/photo-1525874684015-58379d421a52?w=800","https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800","https://images.unsplash.com/photo-1531572753322-ad063cecc140?w=800"],
  "features": ["시크릿 가든", "스파", "미슐랭 레스토랑", "바"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 스페인 (Spain)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-spain",
  "code": "spain",
  "country": "europe",
  "name_ko": "스페인",
  "name_en": "Spain",
  "description": "정열의 나라, 가우디와 플라멩코, 바르셀로나의 예술.",
  "image_url": "/static/images/destinations/spain/spain.jpg",
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "🏨 스페인 호텔 1 - 만다린 오리엔탈"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-spain-mandarin",
  "region_id": "region-europe-spain",
  "name_ko": "만다린 오리엔탈 바르셀로나",
  "name_en": "Mandarin Oriental Barcelona",
  "category": "럭셔리",
  "description": "파세오 데 그라시아의 중심. 모더니즘 건축의 걸작.",
  "main_image_url": "/static/images/resorts/spain/spain-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1543783207-ec64e4d95325?w=800","https://images.unsplash.com/photo-1562883676-8c7feb83f09b?w=800","https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800","https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?w=800","https://images.unsplash.com/photo-1509600110300-21b9d5fedeb7?w=800","https://images.unsplash.com/photo-1558862107-d49ef2a04d72?w=800"],
  "features": ["미슐랭 레스토랑", "루프톱 풀", "스파", "가우디 투어"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 스페인 호텔 2 - 아츠"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-spain-arts",
  "region_id": "region-europe-spain",
  "name_ko": "호텔 아츠 바르셀로나",
  "name_en": "Hotel Arts Barcelona",
  "category": "럭셔리",
  "description": "바르셀로네타 해변의 아이코닉 타워. 현대적 럭셔리.",
  "main_image_url": "/static/images/resorts/spain/spain-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1543783207-ec64e4d95325?w=800","https://images.unsplash.com/photo-1562883676-8c7feb83f09b?w=800","https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800","https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?w=800","https://images.unsplash.com/photo-1509600110300-21b9d5fedeb7?w=800","https://images.unsplash.com/photo-1558862107-d49ef2a04d72?w=800"],
  "features": ["오션뷰", "미슐랭 스타", "스파", "루프톱 바"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 스페인 호텔 3 - 엘 팔라스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-spain-el-palace",
  "region_id": "region-europe-spain",
  "name_ko": "엘 팔라스 호텔",
  "name_en": "El Palace Barcelona",
  "category": "럭셔리",
  "description": "1919년 오픈한 역사적 팰리스 호텔. 클래식 엘레강스.",
  "main_image_url": "/static/images/resorts/spain/spain-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1543783207-ec64e4d95325?w=800","https://images.unsplash.com/photo-1562883676-8c7feb83f09b?w=800","https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800","https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?w=800","https://images.unsplash.com/photo-1509600110300-21b9d5fedeb7?w=800","https://images.unsplash.com/photo-1558862107-d49ef2a04d72?w=800"],
  "features": ["역사적 건물", "미슐랭 레스토랑", "스파", "와인 셀러"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 스위스 (Switzerland)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-switzerland",
  "code": "switzerland",
  "country": "europe",
  "name_ko": "스위스",
  "name_en": "Switzerland",
  "description": "알프스의 보석, 융프라우와 마터호른의 절경.",
  "image_url": "/static/images/destinations/switzerland/switzerland.jpg",
  "is_active": true,
  "display_order": 4
}'

echo ""
echo "🏨 스위스 호텔 1 - 바드루트 팰리스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-switzerland-badrutt",
  "region_id": "region-europe-switzerland",
  "name_ko": "바드루트 팰리스",
  "name_en": "Badrutt''s Palace Hotel",
  "category": "럭셔리",
  "description": "생모리츠의 전설적인 팰리스. 왕족과 셀럽의 겨울 휴양지.",
  "main_image_url": "/static/images/resorts/switzerland/switzerland-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1527004013197-933c4bb611b3?w=800","https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800","https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800","https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?w=800","https://images.unsplash.com/photo-1516900448138-898720b936c7?w=800","https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800"],
  "features": ["알프스 뷰", "미슐랭 레스토랑", "스키", "스파"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 스위스 호텔 2 - 그랜드 호텔"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-switzerland-zermatterhof",
  "region_id": "region-europe-switzerland",
  "name_ko": "그랜드 호텔 체르마터호프",
  "name_en": "Grand Hotel Zermatterhof",
  "category": "럭셔리",
  "description": "마터호른을 바라보는 체르마트의 명문 호텔.",
  "main_image_url": "/static/images/resorts/switzerland/switzerland-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1527004013197-933c4bb611b3?w=800","https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800","https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800","https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?w=800","https://images.unsplash.com/photo-1516900448138-898720b936c7?w=800","https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800"],
  "features": ["마터호른 뷰", "스키 인/아웃", "스파", "파인 다이닝"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 스위스 호텔 3 - 빅토리아 융프라우"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-switzerland-victoria",
  "region_id": "region-europe-switzerland",
  "name_ko": "빅토리아 융프라우 그랑 호텔",
  "name_en": "Victoria Jungfrau Grand Hotel",
  "category": "럭셔리",
  "description": "인터라켄의 랜드마크. 융프라우 관광의 베이스.",
  "main_image_url": "/static/images/resorts/switzerland/switzerland-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1527004013197-933c4bb611b3?w=800","https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800","https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800","https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?w=800","https://images.unsplash.com/photo-1516900448138-898720b936c7?w=800","https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800"],
  "features": ["융프라우 뷰", "스파", "미슐랭 레스토랑", "컨시어지"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 프라하 (Prague)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-prague",
  "code": "prague",
  "country": "europe",
  "name_ko": "프라하",
  "name_en": "Prague",
  "description": "동화 같은 도시, 중세 건축과 블타바 강의 아름다움.",
  "image_url": "/static/images/destinations/prague/prague.jpg",
  "is_active": true,
  "display_order": 5
}'

echo ""
echo "🏨 프라하 호텔 1 - 포시즌스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-prague-four-seasons",
  "region_id": "region-europe-prague",
  "name_ko": "포시즌스 프라하",
  "name_en": "Four Seasons Hotel Prague",
  "category": "럭셔리",
  "description": "블타바 강변의 역사적 건물. 프라하 성 전망.",
  "main_image_url": "/static/images/resorts/prague/prague-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1541849546-216549ae216d?w=800","https://images.unsplash.com/photo-1559564484-e48ebcf44067?w=800","https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800","https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=800","https://images.unsplash.com/photo-1512753360435-329c4535a9a7?w=800","https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=800"],
  "features": ["프라하 성 뷰", "미슐랭 레스토랑", "스파", "컨시어지"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 프라하 호텔 2 - 만다린 오리엔탈"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-prague-mandarin",
  "region_id": "region-europe-prague",
  "name_ko": "만다린 오리엔탈 프라하",
  "name_en": "Mandarin Oriental Prague",
  "category": "럭셔리",
  "description": "14세기 수도원을 개조한 부티크 호텔. 역사적 우아함.",
  "main_image_url": "/static/images/resorts/prague/prague-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1541849546-216549ae216d?w=800","https://images.unsplash.com/photo-1559564484-e48ebcf44067?w=800","https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800","https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=800","https://images.unsplash.com/photo-1512753360435-329c4535a9a7?w=800","https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=800"],
  "features": ["역사적 건물", "스파", "미슐랭 레스토랑", "바"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 프라하 호텔 3 - 오거스틴"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-prague-augustine",
  "region_id": "region-europe-prague",
  "name_ko": "오거스틴 호텔",
  "name_en": "Augustine, a Luxury Collection Hotel",
  "category": "럭셔리",
  "description": "13세기 수도원의 재탄생. 프라하 성 도보 거리.",
  "main_image_url": "/static/images/resorts/prague/prague-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1541849546-216549ae216d?w=800","https://images.unsplash.com/photo-1559564484-e48ebcf44067?w=800","https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800","https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=800","https://images.unsplash.com/photo-1512753360435-329c4535a9a7?w=800","https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=800"],
  "features": ["수도원 양조장", "스파", "레스토랑", "역사 투어"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 빈 (Vienna)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-vienna",
  "code": "vienna",
  "country": "europe",
  "name_ko": "빈",
  "name_en": "Vienna",
  "description": "음악의 도시, 모차르트와 합스부르크 왕가의 화려한 유산.",
  "image_url": "/static/images/destinations/vienna/vienna.jpg",
  "is_active": true,
  "display_order": 6
}'

echo ""
echo "🏨 빈 호텔 1 - 사쉐르"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-vienna-sacher",
  "region_id": "region-europe-vienna",
  "name_ko": "호텔 사쉐르 빈",
  "name_en": "Hotel Sacher Wien",
  "category": "럭셔리",
  "description": "오페라 하우스 맞은편의 전설적 호텔. 사쉐르 토르테의 원조.",
  "main_image_url": "/static/images/resorts/vienna/vienna-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1516623634772-3b4c2bfca8e8?w=800","https://images.unsplash.com/photo-1520986606214-8b456906c813?w=800","https://images.unsplash.com/photo-1551918120-9739cb430c6d?w=800","https://images.unsplash.com/photo-1578633974389-1c7e4dd079f9?w=800","https://images.unsplash.com/photo-1566402876472-4fd6778df166?w=800","https://images.unsplash.com/photo-1516537219851-30fe2f209a44?w=800"],
  "features": ["오페라 뷰", "사쉐르 카페", "스파", "컨시어지"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 빈 호텔 2 - 임페리얼"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-vienna-imperial",
  "region_id": "region-europe-vienna",
  "name_ko": "호텔 임페리얼",
  "name_en": "Hotel Imperial Vienna",
  "category": "럭셔리",
  "description": "1873년 오픈한 왕궁 호텔. 합스부르크의 화려함.",
  "main_image_url": "/static/images/resorts/vienna/vienna-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1516623634772-3b4c2bfca8e8?w=800","https://images.unsplash.com/photo-1520986606214-8b456906c813?w=800","https://images.unsplash.com/photo-1551918120-9739cb430c6d?w=800","https://images.unsplash.com/photo-1578633974389-1c7e4dd079f9?w=800","https://images.unsplash.com/photo-1566402876472-4fd6778df166?w=800","https://images.unsplash.com/photo-1516537219851-30fe2f209a44?w=800"],
  "features": ["황실 인테리어", "미슐랭 레스토랑", "스파", "컨서트"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 빈 호텔 3 - 팰리스 코브르크"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-vienna-palais",
  "region_id": "region-europe-vienna",
  "name_ko": "팰리스 코브르크",
  "name_en": "Palais Coburg Residenz",
  "category": "럭셔리",
  "description": "19세기 귀족 저택. 세계 최대 와인 셀러 보유.",
  "main_image_url": "/static/images/resorts/vienna/vienna-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1516623634772-3b4c2bfca8e8?w=800","https://images.unsplash.com/photo-1520986606214-8b456906c813?w=800","https://images.unsplash.com/photo-1551918120-9739cb430c6d?w=800","https://images.unsplash.com/photo-1578633974389-1c7e4dd079f9?w=800","https://images.unsplash.com/photo-1566402876472-4fd6778df166?w=800","https://images.unsplash.com/photo-1516537219851-30fe2f209a44?w=800"],
  "features": ["와인 셀러", "미슐랭 2스타", "스파", "역사 투어"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 크로아티아 (Croatia)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-croatia",
  "code": "croatia",
  "country": "europe",
  "name_ko": "크로아티아",
  "name_en": "Croatia",
  "description": "아드리아해의 진주, 두브로브니크의 성벽과 푸른 바다.",
  "image_url": "/static/images/destinations/croatia/croatia.jpg",
  "is_active": true,
  "display_order": 7
}'

echo ""
echo "🏨 크로아티아 호텔 1 - 엑셀시어"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-croatia-excelsior",
  "region_id": "region-europe-croatia",
  "name_ko": "호텔 엑셀시어",
  "name_en": "Hotel Excelsior Dubrovnik",
  "category": "럭셔리",
  "description": "구시가지 성벽 바로 옆. 아드리아해가 한눈에.",
  "main_image_url": "/static/images/resorts/croatia/croatia-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1555990538-13a0f02ae0f3?w=800","https://images.unsplash.com/photo-1579362243176-b0513ee8ed28?w=800","https://images.unsplash.com/photo-1577471488278-16eec37ffcc2?w=800","https://images.unsplash.com/photo-1576577020921-6f71e11c8d85?w=800","https://images.unsplash.com/photo-1609137144813-7d9921338f24?w=800","https://images.unsplash.com/photo-1621340005248-4d8e611b5ab5?w=800"],
  "features": ["아드리아해 뷰", "미슐랭 레스토랑", "스파", "프라이빗 비치"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 크로아티아 호텔 2 - 빌라 두브로브니크"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-croatia-villa",
  "region_id": "region-europe-croatia",
  "name_ko": "빌라 두브로브니크",
  "name_en": "Villa Dubrovnik",
  "category": "럭셔리",
  "description": "절벽 위의 부티크 호텔. 프라이빗 비치 접근.",
  "main_image_url": "/static/images/resorts/croatia/croatia-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1555990538-13a0f02ae0f3?w=800","https://images.unsplash.com/photo-1579362243176-b0513ee8ed28?w=800","https://images.unsplash.com/photo-1577471488278-16eec37ffcc2?w=800","https://images.unsplash.com/photo-1576577020921-6f71e11c8d85?w=800","https://images.unsplash.com/photo-1609137144813-7d9921338f24?w=800","https://images.unsplash.com/photo-1621340005248-4d8e611b5ab5?w=800"],
  "features": ["인피니티 풀", "프라이빗 비치", "스파", "선셋 바"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 크로아티아 호텔 3 - 팰리스 벨뷰"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-croatia-bellevue",
  "region_id": "region-europe-croatia",
  "name_ko": "호텔 벨뷰",
  "name_en": "Hotel Bellevue Dubrovnik",
  "category": "프리미엄",
  "description": "모던한 디자인의 비치프론트 호텔. 구시가지 도보 거리.",
  "main_image_url": "/static/images/resorts/croatia/croatia-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1555990538-13a0f02ae0f3?w=800","https://images.unsplash.com/photo-1579362243176-b0513ee8ed28?w=800","https://images.unsplash.com/photo-1577471488278-16eec37ffcc2?w=800","https://images.unsplash.com/photo-1576577020921-6f71e11c8d85?w=800","https://images.unsplash.com/photo-1609137144813-7d9921338f24?w=800","https://images.unsplash.com/photo-1621340005248-4d8e611b5ab5?w=800"],
  "features": ["비치프론트", "모던 디자인", "레스토랑", "바"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "📍 유럽 - 터키 (Turkey)"
curl -X POST "${BASE_URL}/api/regions" \
-H "Content-Type: application/json" \
-d '{
  "id": "region-europe-turkey",
  "code": "turkey",
  "country": "europe",
  "name_ko": "터키",
  "name_en": "Turkey",
  "description": "동서양의 만남, 이스탄불과 카파도키아의 신비.",
  "image_url": "/static/images/destinations/turkey/turkey.jpg",
  "is_active": true,
  "display_order": 8
}'

echo ""
echo "🏨 터키 호텔 1 - 포시즌스 보스포러스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-turkey-four-seasons",
  "region_id": "region-europe-turkey",
  "name_ko": "포시즌스 보스포러스",
  "name_en": "Four Seasons Bosphorus",
  "category": "럭셔리",
  "description": "보스포러스 해협의 오스만 팰리스. 유럽과 아시아를 잇는 전망.",
  "main_image_url": "/static/images/resorts/turkey/turkey-hotel01-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b?w=800","https://images.unsplash.com/photo-1568084680786-a84f91d1153c?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800"],
  "features": ["보스포러스 뷰", "오스만 건축", "스파", "미슐랭 레스토랑"],
  "is_active": true,
  "display_order": 1
}'

echo ""
echo "🏨 터키 호텔 2 - 치라간 팰리스"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-turkey-ciragan",
  "region_id": "region-europe-turkey",
  "name_ko": "치라간 팰리스 켐핀스키",
  "name_en": "Ciragan Palace Kempinski",
  "category": "럭셔리",
  "description": "19세기 술탄의 궁전을 개조한 호텔. 화려한 오스만 스타일.",
  "main_image_url": "/static/images/resorts/turkey/turkey-hotel02-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b?w=800","https://images.unsplash.com/photo-1568084680786-a84f91d1153c?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800"],
  "features": ["술탄 궁전", "인피니티 풀", "스파", "터키식 목욕"],
  "is_active": true,
  "display_order": 2
}'

echo ""
echo "🏨 터키 호텔 3 - 무지엄 호텔"
curl -X POST "${BASE_URL}/api/resorts" \
-H "Content-Type: application/json" \
-d '{
  "id": "resort-turkey-museum",
  "region_id": "region-europe-turkey",
  "name_ko": "무지엄 호텔",
  "name_en": "Museum Hotel Cappadocia",
  "category": "럭셔리",
  "description": "카파도키아 동굴 호텔. 유네스코 지역의 유니크한 경험.",
  "main_image_url": "/static/images/resorts/turkey/turkey-hotel03-01.webp",
  "gallery_images": ["https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b?w=800","https://images.unsplash.com/photo-1568084680786-a84f91d1153c?w=800","https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800","https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800"],
  "features": ["동굴 방", "열기구 투어", "스파", "레스토랑"],
  "is_active": true,
  "display_order": 3
}'

echo ""
echo "==================================="
echo "✅ 모든 DB 데이터 생성 완료!"
echo "==================================="
