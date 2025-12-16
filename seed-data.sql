-- 지역(Regions) 데이터
INSERT OR IGNORE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-thailand-khao-lak', 'khao-lak', '태국', '카오락', 'Khao Lak', '조용하고 한적한 해변 휴양지, 시밀란 제도 스노클링', '/static/images/regions/thailand-khao-lak.jpg', 1, 1, 1704067200000, 1704067200000),
('region-thailand-koh-samui', 'koh-samui', '태국', '코사무이', 'Koh Samui', '야자수와 백사장의 열대 낙원, 럭셔리 리조트', '/static/images/regions/thailand-koh-samui.jpg', 2, 1, 1704067200000, 1704067200000),
('region-thailand-phuket', 'phuket', '태국', '푸켓', 'Phuket', '다양한 액티비티와 나이트라이프, 해양 스포츠', '/static/images/regions/thailand-phuket.jpg', 3, 1, 1704067200000, 1704067200000),
('region-thailand-krabi', 'krabi', '태국', '끄라비', 'Krabi', '석회암 절벽과 에메랄드빛 바다, 자연 경관', '/static/images/regions/thailand-krabi.jpg', 4, 1, 1704067200000, 1704067200000),
('region-thailand-pattaya', 'pattaya', '태국', '파타야', 'Pattaya', '방콕 인근 해변 도시, 워터파크와 쇼', '/static/images/regions/thailand-pattaya.jpg', 5, 1, 1704067200000, 1704067200000),
('region-indonesia-bali', 'bali', '인도네시아', '발리', 'Bali', '신들의 섬, 우붓 계단식 논과 사원, 스파', '/static/images/regions/bali.jpg', 6, 1, 1704067200000, 1704067200000),
('region-indonesia-lombok', 'lombok', '인도네시아', '롬복', 'Lombok', '발리보다 조용한 섬, 길리 제도, 서핑', '/static/images/regions/lombok.jpg', 7, 1, 1704067200000, 1704067200000),
('region-maldives', 'maldives', '몰디브', '몰디브', 'Maldives', '수상 방갈로와 산호초, 스노클링, 허니문', '/static/images/regions/maldives.jpg', 8, 1, 1704067200000, 1704067200000),
('region-mexico-cancun', 'cancun', '멕시코', '칸쿤', 'Cancun', '카리브해 휴양지, 마야 유적, 세노테', '/static/images/regions/cancun.jpg', 9, 1, 1704067200000, 1704067200000),
('region-usa-hawaii-maui', 'maui', '미국(하와이)', '마우이', 'Maui', '로맨틱한 석양, 할레아칼라 화산, 와일레아', '/static/images/regions/maui.jpg', 10, 1, 1704067200000, 1704067200000),
('region-usa-hawaii-oahu', 'oahu', '미국(하와이)', '오아후', 'Oahu', '와이키키 해변, 다이아몬드 헤드, 호놀룰루', '/static/images/regions/oahu.jpg', 11, 1, 1704067200000, 1704067200000),
('region-usa-hawaii-bigisland', 'bigisland', '미국(하와이)', '빅아일랜드', 'Big Island', '킬라우에아 화산, 블랙샌드 비치, 마우나케아', '/static/images/regions/bigisland.jpg', 12, 1, 1704067200000, 1704067200000);

-- 리조트(Resorts) 데이터 - 카오락
INSERT OR IGNORE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-khao-lak-01', 'region-thailand-khao-lak', 'JW 메리어트 카오락', 'JW Marriott Khao Lak', 'luxury', '조용하고 한적한 해변에 위치한 5성급 럭셔리 리조트. 넓은 객실과 프라이빗 풀, 세계적인 스파 시설을 갖추고 있습니다.', '/static/images/resorts/khao-lak/khao-lak-resort01-01.webp', '["khao-lak-resort01-01.webp","khao-lak-resort01-02.webp","khao-lak-resort01-03.webp","khao-lak-resort01-04.webp"]', '["프라이빗 비치","인피니티 풀","스파 & 웰니스","고급 레스토랑","키즈 클럽"]', 1, 1, 1704067200000, 1704067200000),
('resort-khao-lak-02', 'region-thailand-khao-lak', '반얀트리 카오락', 'Banyan Tree Khao Lak', 'luxury', '열대 우림과 해변이 조화를 이루는 럭셔리 리조트. 프라이빗 풀 빌라와 수상 경력의 스파로 유명합니다.', '/static/images/resorts/khao-lak/khao-lak-resort02-01.webp', '["khao-lak-resort02-01.webp","khao-lak-resort02-02.webp","khao-lak-resort02-03.webp","khao-lak-resort02-04.webp"]', '["프라이빗 풀 빌라","반얀트리 스파","해변 다이닝","요가 세션","허니문 패키지"]', 2, 1, 1704067200000, 1704067200000);

-- 리조트(Resorts) 데이터 - 코사무이
INSERT OR IGNORE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-koh-samui-01', 'region-thailand-koh-samui', '포시즌 코사무이', 'Four Seasons Koh Samui', 'luxury', '언덕 위에서 만나는 절경의 오션뷰. 프라이빗 풀 빌라와 세계적인 서비스로 완벽한 휴식을 제공합니다.', '/static/images/resorts/koh-samui/koh-samui-resort01-01.webp', '["koh-samui-resort01-01.webp","koh-samui-resort01-02.webp","koh-samui-resort01-03.webp","koh-samui-resort01-04.webp"]', '["프라이빗 풀 빌라","오션뷰","비치 클럽","스노클링 투어","태국 요리 클래스"]', 1, 1, 1704067200000, 1704067200000),
('resort-koh-samui-02', 'region-thailand-koh-samui', '콘래드 코사무이', 'Conrad Koh Samui', 'luxury', '힐튼 그룹의 럭셔리 리조트. 모든 빌라에서 바다 전망과 인피니티 풀을 즐길 수 있습니다.', '/static/images/resorts/koh-samui/koh-samui-resort02-01.webp', '["koh-samui-resort02-01.webp","koh-samui-resort02-02.webp","koh-samui-resort02-03.webp","koh-samui-resort02-04.webp"]', '["언덕 위 빌라","인피니티 풀","선셋 바","스파 트리트먼트","요트 투어"]', 2, 1, 1704067200000, 1704067200000);

-- 리조트(Resorts) 데이터 - 발리
INSERT OR IGNORE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-bali-01', 'region-indonesia-bali', '반얀트리 웅가산', 'Banyan Tree Ungasan', 'luxury', '절벽 위에서 만나는 인도양 절경. 프라이빗 풀 빌라와 반얀트리 스파가 완벽한 휴식을 선사합니다.', '/static/images/resorts/bali/bali-resort01-01.webp', '["bali-resort01-01.webp","bali-resort01-02.webp","bali-resort01-03.webp","bali-resort01-04.webp"]', '["절벽 위 빌라","프라이빗 풀","반얀트리 스파","발리니즈 요리","석양 디너"]', 1, 1, 1704067200000, 1704067200000),
('resort-bali-02', 'region-indonesia-bali', '포시즌 짐바란', 'Four Seasons Jimbaran', 'luxury', '짐바란 해변의 럭셔리 리조트. 넓은 빌라와 가든, 세계적인 서비스로 완벽한 발리 휴가를 제공합니다.', '/static/images/resorts/bali/bali-resort02-01.webp', '["bali-resort02-01.webp","bali-resort02-02.webp","bali-resort02-03.webp","bali-resort02-04.webp"]', '["해변 빌라","트로피컬 가든","선댄스 바","발리 댄스 쇼","서핑 레슨"]', 2, 1, 1704067200000, 1704067200000);

-- 리조트(Resorts) 데이터 - 몰디브
INSERT OR IGNORE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-maldives-01', 'region-maldives', '길리 랑칸푸시', 'Gili Lankanfushi', 'luxury', '몰디브 최고의 수상 빌라 리조트. 노슈즈, 노뉴스 콘셉트로 완벽한 디지털 디톡스를 경험하세요.', '/static/images/resorts/maldives/maldives-resort01-01.webp', '["maldives-resort01-01.webp","maldives-resort01-02.webp","maldives-resort01-03.webp","maldives-resort01-04.webp"]', '["수상 빌라","프라이빗 워터 슬라이드","스노클링","돌핀 워칭","별빛 디너"]', 1, 1, 1704067200000, 1704067200000),
('resort-maldives-02', 'region-maldives', '원앤온리 리띠 라', 'One&Only Reethi Rah', 'luxury', '몰디브에서 가장 큰 프라이빗 섬. 12개의 해변과 럭셔리한 수상 빌라가 완벽한 휴식을 제공합니다.', '/static/images/resorts/maldives/maldives-resort02-01.webp', '["maldives-resort02-01.webp","maldives-resort02-02.webp","maldives-resort02-03.webp","maldives-resort02-04.webp"]', '["프라이빗 섬","12개 해변","수상 빌라","산호초 다이빙","선셋 크루즈"]', 2, 1, 1704067200000, 1704067200000);
