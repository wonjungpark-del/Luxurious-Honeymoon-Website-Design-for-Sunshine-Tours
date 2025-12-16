-- ===================================
-- 선샤인투어 데이터베이스 시드 데이터
-- ===================================

-- Regions (지역) 데이터
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-thailand-khao-lak', 'thailand-khao-lak', 'thailand', '카오락', 'Khao Lak', '태국 남부 푸켓 북쪽에 위치한 조용한 해변 휴양지. 2004년 쓰나미 이후 완전히 재건되어 더욱 아름다운 리조트들이 들어섰습니다.', '/static/images/regions/khao-lak.jpg', 1, 1, 1702742400000, 1702742400000),
('region-thailand-koh-samui', 'thailand-koh-samui', 'thailand', '코사무이', 'Koh Samui', '태국에서 세 번째로 큰 섬으로 야자수 해변과 럭셔리 리조트가 유명합니다.', '/static/images/regions/koh-samui.jpg', 2, 1, 1702742400000, 1702742400000),
('region-thailand-phuket', 'thailand-phuket', 'thailand', '푸켓', 'Phuket', '태국 최대의 섬이자 최고의 휴양지. 다양한 해변과 나이트라이프가 발달되어 있습니다.', '/static/images/regions/phuket.jpg', 3, 1, 1702742400000, 1702742400000),
('region-thailand-krabi', 'thailand-krabi', 'thailand', '끄라비', 'Krabi', '석회암 절벽과 에메랄드빛 바다가 어우러진 천혜의 자연을 간직한 곳.', '/static/images/regions/krabi.jpg', 4, 1, 1702742400000, 1702742400000),
('region-thailand-pattaya', 'thailand-pattaya', 'thailand', '파타야', 'Pattaya', '방콕에서 가까운 해변 휴양 도시. 다양한 액티비티와 엔터테인먼트가 풍부합니다.', '/static/images/regions/pattaya.jpg', 5, 1, 1702742400000, 1702742400000),
('region-thailand-hua-hin', 'thailand-hua-hin', 'thailand', '후아힌', 'Hua Hin', '태국 왕실의 휴양지로 유명한 조용하고 고급스러운 해변 도시.', '/static/images/regions/hua-hin.jpg', 6, 1, 1702742400000, 1702742400000);

-- 발리/인도네시아
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-bali', 'bali', 'indonesia', '발리', 'Bali', '신들의 섬이라 불리는 인도네시아 최고의 관광지. 아름다운 해변, 사원, 테라스 논이 유명합니다.', '/static/images/regions/bali.jpg', 10, 1, 1702742400000, 1702742400000),
('region-lombok', 'lombok', 'indonesia', '롬복', 'Lombok', '발리 옆의 섬으로 한적하고 자연이 잘 보존된 휴양지.', '/static/images/regions/lombok.jpg', 11, 1, 1702742400000, 1702742400000);

-- 필리핀
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-boracay', 'boracay', 'philippines', '보라카이', 'Boracay', '하얀 백사장과 맑은 바다로 유명한 필리핀 대표 휴양지.', '/static/images/regions/boracay.jpg', 20, 1, 1702742400000, 1702742400000),
('region-cebu-bohol', 'cebu-bohol', 'philippines', '세부/보홀', 'Cebu/Bohol', '필리핀 중부의 아름다운 섬들. 세부는 도시적이고 보홀은 자연이 풍부합니다.', '/static/images/regions/cebu-bohol.jpg', 21, 1, 1702742400000, 1702742400000),
('region-palawan', 'palawan', 'philippines', '팔라완', 'Palawan', '세계에서 가장 아름다운 섬으로 선정된 자연의 보고.', '/static/images/regions/palawan.jpg', 22, 1, 1702742400000, 1702742400000);

-- 몰디브
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-maldives', 'maldives', 'maldives', '몰디브', 'Maldives', '일생에 한 번은 꼭 가야 할 천국의 섬. 수상 빌라와 맑은 바다가 유명합니다.', '/static/images/regions/maldives.jpg', 30, 1, 1702742400000, 1702742400000);

-- Resorts (리조트) 데이터 - 카오락
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-khao-lak-jw-marriott', 'region-thailand-khao-lak', 'JW 메리어트 카오락', 'JW Marriott Khao Lak Resort & Spa', '5성급 럭셔리 리조트', '프라이빗 비치와 열대 정원이 어우러진 최고급 리조트. 넓은 객실과 다양한 레스토랑, 스파 시설을 갖추고 있습니다.', '/static/images/resorts/khao-lak/jw-marriott-main.jpg', '[]', '["프라이빗 비치", "인피니티 풀", "럭셔리 스파", "키즈클럽", "5개 레스토랑", "피트니스 센터"]', 1, 1, 1702742400000, 1702742400000),
('resort-khao-lak-sensimar', 'region-thailand-khao-lak', '센시마 카오락 비치프론트', 'Sensimar Khaolak Beachfront Resort', '5성급 어른 전용 리조트', '성인 전용 리조트로 조용하고 로맨틱한 분위기. 모든 객실에서 바다 전망을 감상할 수 있습니다.', '/static/images/resorts/khao-lak/sensimar-main.jpg', '[]', '["어른 전용", "올 인클루시브", "비치프론트", "3개 풀", "스파", "무료 와이파이"]', 2, 1, 1702742400000, 1702742400000),
('resort-khao-lak-moracea', 'region-thailand-khao-lak', '모라시 카오락', 'Moracea by Khaolak Resort', '5성급 부티크 리조트', '모던하고 세련된 디자인의 부티크 리조트. 가족 단위 여행객에게 인기가 많습니다.', '/static/images/resorts/khao-lak/moracea-main.jpg', '[]', '["패밀리 풀", "키즈클럽", "수상 스포츠", "5개 레스토랑", "스파", "비치 액세스"]', 3, 1, 1702742400000, 1702742400000);

-- Resorts - 코사무이
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-koh-samui-conrad', 'region-thailand-koh-samui', '콘래드 코사무이', 'Conrad Koh Samui', '5성급 럭셔리 리조트', '언덕 위에 위치한 초호화 리조트. 모든 빌라에 프라이빗 풀이 있으며 360도 바다 전망을 자랑합니다.', '/static/images/resorts/koh-samui/conrad-main.jpg', '[]', '["프라이빗 풀 빌라", "인피니티 풀", "미슐랭 레스토랑", "럭셔리 스파", "버틀러 서비스", "무료 셔틀"]', 1, 1, 1702742400000, 1702742400000),
('resort-koh-samui-four-seasons', 'region-thailand-koh-samui', '포시즌스 코사무이', 'Four Seasons Resort Koh Samui', '5성급 럭셔리 리조트', '코코넛 나무 숲과 해변이 어우러진 열대 낙원. 최상급 서비스와 시설을 제공합니다.', '/static/images/resorts/koh-samui/four-seasons-main.jpg', '[]', '["프라이빗 풀 빌라", "비치 액세스", "스파", "3개 레스토랑", "키즈클럽", "요가 세션"]', 2, 1, 1702742400000, 1702742400000);

-- Resorts - 푸켓
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-phuket-anantara-layan', 'region-thailand-phuket', '아난타라 라얀 푸켓', 'Anantara Layan Phuket Resort', '5성급 럭셔리 리조트', '조용한 라얀 비치에 위치한 프라이빗 리조트. 태국 전통 양식과 현대적 럭셔리가 조화를 이룹니다.', '/static/images/resorts/phuket/anantara-layan-main.jpg', '[]', '["프라이빗 비치", "풀 빌라", "스파", "3개 레스토랑", "키즈클럽", "수상 스포츠"]', 1, 1, 1702742400000, 1702742400000),
('resort-phuket-trisara', 'region-thailand-phuket', '트리사라 푸켓', 'Trisara Phuket', '5성급 울트라 럭셔리', '푸켓 최고급 리조트 중 하나. 모든 빌라에 프라이빗 풀과 개인 집사 서비스가 제공됩니다.', '/static/images/resorts/phuket/trisara-main.jpg', '[]', '["프라이빗 풀 빌라", "버틀러 서비스", "프라이빗 비치", "미슐랭 레스토랑", "요트 서비스", "럭셔리 스파"]', 2, 1, 1702742400000, 1702742400000);

-- Resorts - 몰디브
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-maldives-soneva-jani', 'region-maldives', '소네바 자니', 'Soneva Jani', '6성급 울트라 럭셔리', '몰디브 최고급 리조트. 수상 빌라에 워터 슬라이드와 천문대가 있는 독특한 경험을 제공합니다.', '/static/images/resorts/maldives/soneva-jani-main.jpg', '[]', '["수상 빌라", "워터 슬라이드", "천문대", "무인도 피크닉", "프라이빗 풀", "올 인클루시브"]', 1, 1, 1702742400000, 1702742400000),
('resort-maldives-gili-lankanfushi', 'region-maldives', '길리 란칸푸시', 'Gili Lankanfushi', '5성급 럭셔리 에코 리조트', '환경 친화적인 럭셔리 리조트. 신발 없는 럭셔리(No Shoes, No News) 컨셉으로 유명합니다.', '/static/images/resorts/maldives/gili-lankanfushi-main.jpg', '[]', '["에코 럭셔리", "수상 빌라", "프라이빗 풀", "유기농 레스토랑", "스파", "무인도 투어"]', 2, 1, 1702742400000, 1702742400000);

-- Reviews (후기) 샘플 데이터
INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at) VALUES
('review-001', 'thailand', '태국', '환상적인 카오락 허니문!', 'JW 메리어트에서 정말 최고의 시간을 보냈습니다. 리조트 시설도 훌륭하고 직원들도 정말 친절했어요. 특히 프라이빗 비치가 너무 아름다웠고, 스파도 최고였습니다. 선샤인투어 덕분에 완벽한 허니문을 보낼 수 있었습니다!', 5, '김**', '2024년 11월', '', 'approved', 1, 1702742400000, 1702742400000),
('review-002', 'maldives', '몰디브', '평생 잊지 못할 추억', '소네바 자니는 정말 천국이었어요. 수상 빌라에서 워터 슬라이드를 타고 바다로 풍덩! 매일 아침 돌고래도 보고, 밤에는 별 관측도 했습니다. 가격은 비싸지만 그만한 가치가 있었어요. 선샤인투어 상담이 정말 도움이 됐습니다.', 5, '박**', '2024년 10월', '', 'approved', 1, 1702742400000, 1702742400000),
('review-003', 'thailand', '태국', '코사무이 신혼여행 강추!', '콘래드 코사무이는 정말 럭셔리했어요. 프라이빗 풀 빌라에서 바다를 보며 여유로운 시간을 보냈습니다. 조식도 훌륭하고, 스파 트리트먼트도 최고였어요. 다음에 또 가고 싶습니다!', 5, '이**', '2024년 12월', '', 'approved', 1, 1702742400000, 1702742400000),
('review-004', 'thailand', '태국', '푸켓 가족 여행 후기', '아난타라 라얀에서 가족들과 즐거운 시간을 보냈습니다. 키즈클럽 덕분에 아이들도 즐거워했고, 저희는 스파에서 휴식을 취할 수 있었어요. 비치도 깨끗하고 조용해서 좋았습니다.', 5, '최**', '2024년 9월', '', 'approved', 0, 1702742400000, 1702742400000),
('review-005', 'bali', '발리', '발리 허니문 최고!', '발리는 역시 허니문의 성지네요. 리조트도 좋고 음식도 맛있고, 무엇보다 현지 문화 체험이 인상 깊었어요. 선샤인투어 추천으로 완벽한 일정을 짤 수 있었습니다.', 4, '정**', '2024년 8월', '', 'approved', 0, 1702742400000, 1702742400000);

-- Inquiries (문의) 샘플 데이터
INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at) VALUES
('inquiry-001', '홍길동', 'hong@example.com', '010-1234-5678', 'thailand-phuket', '500-700', 2, '2025-01-15', '5박 6일', '푸켓 허니문 상담 요청', '1월 중순에 푸켓으로 허니문을 계획 중입니다. 프라이빗 풀 빌라가 있는 리조트를 추천해주세요. 예산은 500-700만원 정도 생각하고 있습니다.', 'pending', 1734355200000, 1734355200000),
('inquiry-002', '김영희', 'kim@example.com', '010-9876-5432', 'maldives', '1000-1500', 2, '2025-02-20', '7박 8일', '몰디브 허니문 문의', '2월 말에 몰디브 여행을 계획하고 있습니다. 수상 빌라와 올 인클루시브 리조트를 원합니다. 상세한 견적 부탁드립니다.', 'processing', 1734441600000, 1734441600000),
('inquiry-003', '박철수', 'park@example.com', '010-5555-6666', 'thailand-koh-samui', '700-1000', 2, '2025-03-10', '6박 7일', '코사무이 신혼여행', '3월 초에 코사무이로 신혼여행을 가려고 합니다. 조용하고 로맨틱한 리조트를 추천해주세요.', 'completed', 1734528000000, 1734528000000);
