-- ===================================
-- 선샤인투어 데이터베이스 시드 데이터
-- ===================================

-- ===================================
-- Regions (지역) 샘플 데이터
-- ===================================

-- 태국 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-thailand-khao-lak', 'thailand-khao-lak', 'thailand', '카오락', 'Khao Lak', '태국 남부의 조용한 해변 휴양지, 프라이빗한 분위기와 럭셔리 리조트로 유명', '/static/images/regions/khao-lak.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-thailand-koh-samui', 'thailand-koh-samui', 'thailand', '코사무이', 'Koh Samui', '태국의 대표적인 휴양지, 야자수가 늘어선 백사장과 고급 리조트', '/static/images/regions/koh-samui.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-thailand-phuket', 'thailand-phuket', 'thailand', '푸켓', 'Phuket', '태국 최대의 섬 휴양지, 다양한 액티비티와 나이트라이프', '/static/images/regions/phuket.jpg', 3, 1, 1702742400000, 1702742400000),
  ('region-thailand-krabi', 'thailand-krabi', 'thailand', '끄라비', 'Krabi', '석회암 절벽과 에메랄드빛 바다가 아름다운 휴양지', '/static/images/regions/krabi.jpg', 4, 1, 1702742400000, 1702742400000),
  ('region-thailand-pattaya', 'thailand-pattaya', 'thailand', '파타야', 'Pattaya', '방콕에서 가까운 해변 휴양지, 다양한 엔터테인먼트', '/static/images/regions/pattaya.jpg', 5, 1, 1702742400000, 1702742400000),
  ('region-thailand-hua-hin', 'thailand-hua-hin', 'thailand', '후아힌', 'Hua Hin', '태국 왕실의 휴양지, 조용하고 품격있는 분위기', '/static/images/regions/hua-hin.jpg', 6, 1, 1702742400000, 1702742400000);

-- 발리 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-bali-bali', 'bali-bali', 'indonesia', '발리', 'Bali', '신들의 섬, 사원과 자연이 어우러진 로맨틱한 허니문 성지', '/static/images/regions/bali.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-bali-lombok', 'bali-lombok', 'indonesia', '롬복', 'Lombok', '발리 옆의 숨겨진 보석, 한적하고 프라이빗한 휴양지', '/static/images/regions/lombok.jpg', 2, 1, 1702742400000, 1702742400000);

-- 필리핀 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-philippines-boracay', 'philippines-boracay', 'philippines', '보라카이', 'Boracay', '세계 최고의 백사장을 자랑하는 필리핀 대표 휴양지', '/static/images/regions/boracay.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-philippines-cebu-bohol', 'philippines-cebu-bohol', 'philippines', '세부/보홀', 'Cebu/Bohol', '아름다운 해변과 다이빙 명소, 초콜릿 힐스로 유명', '/static/images/regions/cebu-bohol.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-philippines-palawan', 'philippines-palawan', 'philippines', '팔라완', 'Palawan', '세계에서 가장 아름다운 섬, 천혜의 자연환경', '/static/images/regions/palawan.jpg', 3, 1, 1702742400000, 1702742400000);

-- 하와이 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-hawaii-oahu', 'hawaii-oahu', 'usa', '오아후', 'Oahu', '하와이의 중심, 와이키키 비치와 현대적인 편의시설', '/static/images/regions/oahu.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-hawaii-maui', 'hawaii-maui', 'usa', '마우이', 'Maui', '로맨틱한 선셋과 고급 리조트의 천국', '/static/images/regions/maui.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-hawaii-bigisland', 'hawaii-bigisland', 'usa', '빅아일랜드', 'Big Island', '화산과 자연이 살아있는 하와이 최대의 섬', '/static/images/regions/bigisland.jpg', 3, 1, 1702742400000, 1702742400000);

-- 남태평양 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-southpacific-fiji', 'southpacific-fiji', 'fiji', '피지', 'Fiji', '남태평양의 낙원, 크리스탈처럼 맑은 바다', '/static/images/regions/fiji.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-southpacific-guam', 'southpacific-guam', 'usa', '괌', 'Guam', '가까운 미국령 휴양지, 면세 쇼핑의 천국', '/static/images/regions/guam.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-southpacific-saipan', 'southpacific-saipan', 'usa', '사이판', 'Saipan', '조용하고 한적한 마리아나 제도의 보석', '/static/images/regions/saipan.jpg', 3, 1, 1702742400000, 1702742400000),
  ('region-southpacific-australia', 'southpacific-australia', 'australia', '호주', 'Australia', '다양한 자연경관과 도시를 즐기는 대륙 여행', '/static/images/regions/australia.jpg', 4, 1, 1702742400000, 1702742400000);

-- 몰디브
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-maldives', 'maldives', 'maldives', '몰디브', 'Maldives', '일생에 한 번은 꼭 가야 할 천국의 섬, 수상빌라의 대명사', '/static/images/regions/maldives.jpg', 1, 1, 1702742400000, 1702742400000);

-- 칸쿤
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-cancun', 'cancun', 'mexico', '칸쿤', 'Cancun', '카리브해의 보석, 올인클루시브 리조트의 천국', '/static/images/regions/cancun.jpg', 1, 1, 1702742400000, 1702742400000);

-- 유럽 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-europe-paris', 'europe-paris', 'france', '파리', 'Paris', '낭만의 도시, 예술과 문화의 중심지', '/static/images/regions/paris.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-europe-rome', 'europe-rome', 'italy', '로마', 'Rome', '영원의 도시, 역사와 문화유산의 보고', '/static/images/regions/rome.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-europe-spain', 'europe-spain', 'spain', '스페인', 'Spain', '정열의 나라, 가우디와 플라멩코의 예술', '/static/images/regions/spain.jpg', 3, 1, 1702742400000, 1702742400000),
  ('region-europe-switzerland', 'europe-switzerland', 'switzerland', '스위스', 'Switzerland', '알프스의 절경, 청정한 자연과 하이킹', '/static/images/regions/switzerland.jpg', 4, 1, 1702742400000, 1702742400000),
  ('region-europe-prague', 'europe-prague', 'czech', '프라하', 'Prague', '동화 같은 중세 도시, 건축의 박물관', '/static/images/regions/prague.jpg', 5, 1, 1702742400000, 1702742400000),
  ('region-europe-vienna', 'europe-vienna', 'austria', '비엔나', 'Vienna', '음악의 도시, 우아한 바로크 건축', '/static/images/regions/vienna.jpg', 6, 1, 1702742400000, 1702742400000),
  ('region-europe-croatia', 'europe-croatia', 'croatia', '크로아티아', 'Croatia', '아드리아해의 진주, 두브로브니크의 아름다움', '/static/images/regions/croatia.jpg', 7, 1, 1702742400000, 1702742400000),
  ('region-europe-turkey', 'europe-turkey', 'turkey', '터키', 'Turkey', '동서양의 만남, 이스탄불과 카파도키아', '/static/images/regions/turkey.jpg', 8, 1, 1702742400000, 1702742400000);

-- 기타 지역
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES 
  ('region-other-danang', 'other-danang', 'vietnam', '다낭', 'Da Nang', '베트남의 떠오르는 휴양지, 저렴하고 좋은 리조트', '/static/images/regions/danang.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-other-mauritius', 'other-mauritius', 'mauritius', '모리셔스', 'Mauritius', '인도양의 보석, 럭셔리 허니문 명소', '/static/images/regions/mauritius.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-other-santorini', 'other-santorini', 'greece', '산토리니', 'Santorini', '그리스의 대표 휴양지, 하얀 건물과 푸른 바다', '/static/images/regions/santorini.jpg', 3, 1, 1702742400000, 1702742400000),
  ('region-other-newzealand', 'other-newzealand', 'newzealand', '뉴질랜드', 'New Zealand', '자연의 나라, 영화 같은 풍경', '/static/images/regions/newzealand.jpg', 4, 1, 1702742400000, 1702742400000);

-- ===================================
-- Resorts (리조트) 샘플 데이터
-- ===================================

-- 카오락 리조트
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
VALUES 
  ('resort-khao-lak-jw-marriott', 'region-thailand-khao-lak', 'JW 메리어트 카오락', 'JW Marriott Khao Lak Resort & Spa', '5성급 럭셔리 리조트', '프라이빗 비치와 열대 정원이 어우러진 최고급 리조트입니다. 11개의 레스토랑과 바, 월드클래스 스파, 3개의 대형 수영장을 갖추고 있습니다.', '/static/images/resorts/khao-lak/jw-marriott-main.jpg', '[]', '["프라이빗 비치", "인피니티 풀", "스파", "키즈클럽", "레스토랑 11개", "피트니스센터"]', 1, 1, 1702742400000, 1702742400000),
  ('resort-khao-lak-la-vela', 'region-thailand-khao-lak', '라 벨라 카오락', 'La Vela Khao Lak', '5성급 럭셔리 리조트', '현대적인 디자인과 편안한 분위기의 프리미엄 리조트. 넓은 객실과 발코니에서 바다를 조망할 수 있습니다.', '/static/images/resorts/khao-lak/la-vela-main.jpg', '[]', '["해변 접근", "대형 풀", "스파", "다국적 요리", "룸서비스", "무료 와이파이"]', 2, 1, 1702742400000, 1702742400000);

-- 코사무이 리조트
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
VALUES 
  ('resort-koh-samui-four-seasons', 'region-thailand-koh-samui', '포시즌스 코사무이', 'Four Seasons Resort Koh Samui', '5성급 럭셔리 리조트', '언덕 위에 자리한 프라이빗 빌라 리조트. 각 빌라마다 전용 인피니티 풀과 바다 전망을 자랑합니다.', '/static/images/resorts/koh-samui/four-seasons-main.jpg', '[]', '["프라이빗 풀 빌라", "비치 클럽", "스파", "요가", "레스토랑 3개", "버틀러 서비스"]', 1, 1, 1702742400000, 1702742400000),
  ('resort-koh-samui-conrad', 'region-thailand-koh-samui', '콘래드 코사무이', 'Conrad Koh Samui', '5성급 럭셔리 리조트', '힐튼 그룹의 최고급 브랜드, 모든 빌라에서 인피니티 풀과 바다 전망을 즐길 수 있습니다.', '/static/images/resorts/koh-samui/conrad-main.jpg', '[]', '["풀 빌라", "인피니티 풀", "스파", "레스토랑 2개", "바", "피트니스센터"]', 2, 1, 1702742400000, 1702742400000);

-- 몰디브 리조트
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
VALUES 
  ('resort-maldives-conrad', 'region-maldives', '콘래드 몰디브 랑갈리 아일랜드', 'Conrad Maldives Rangali Island', '5성급 럭셔리 리조트', '세계 최초의 해저 레스토랑 Ithaa를 보유한 몰디브 대표 리조트. 수상빌라와 비치빌라 모두 최상급입니다.', '/static/images/resorts/maldives/conrad-main.jpg', '[]', '["수상빌라", "해저 레스토랑", "스파", "다이빙센터", "레스토랑 12개", "와인셀러"]', 1, 1, 1702742400000, 1702742400000),
  ('resort-maldives-six-senses', 'region-maldives', '식스센스 라암', 'Six Senses Laamu', '5성급 럭셔리 리조트', '지속가능한 럭셔리를 추구하는 에코 리조트. 천혜의 자연환경과 최고급 서비스를 동시에 경험할 수 있습니다.', '/static/images/resorts/maldives/six-senses-main.jpg', '[]', '["수상빌라", "에코 리조트", "스파", "유기농 레스토랑", "서핑", "다이빙"]', 2, 1, 1702742400000, 1702742400000);

-- ===================================
-- Reviews (후기) 샘플 데이터
-- ===================================

INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
VALUES 
  ('review-001', 'thailand', '태국', '환상적인 카오락 허니문!', 'JW 메리어트 카오락에서 정말 최고의 시간을 보냈습니다. 리조트가 너무 넓고 깨끗했으며, 직원들의 서비스도 완벽했습니다. 특히 프라이빗 비치에서의 선셋 디너는 평생 잊지 못할 추억이 되었습니다. 선샤인투어에서 세심하게 준비해주신 덕분에 걱정 없이 즐거운 시간을 보낼 수 있었습니다.', 5, '김**', '2024년 11월', '', 'approved', 1, 1702742400000, 1702742400000),
  ('review-002', 'maldives', '몰디브', '꿈만 같았던 몰디브 여행', '몰디브는 정말 천국이었습니다. 콘래드 리조트의 수상빌라에서 바라본 인도양의 풍경은 그 어떤 사진보다 아름다웠습니다. 해저 레스토랑에서의 식사는 특별한 경험이었고, 스노클링으로 본 형형색색의 물고기들도 잊을 수 없습니다. 비용이 부담되었지만 일생에 한 번 할 수 있는 값진 경험이었습니다.', 5, '이**', '2024년 10월', '', 'approved', 1, 1702742300000, 1702742300000),
  ('review-003', 'bali', '발리', '로맨틱했던 발리 허니문', '발리는 정말 신들의 섬이라는 말이 어울리는 곳이었습니다. 우붓의 사원과 자연 풍경, 스미냑의 해변 리조트 모두 만족스러웠습니다. 특히 테갈랄랑 계단식 논에서 본 일몰은 환상적이었습니다. 선샤인투어에서 추천해주신 리조트도 정말 좋았고, 현지 투어도 알차게 구성되어 있었습니다.', 5, '박**', '2024년 9월', '', 'approved', 1, 1702742200000, 1702742200000),
  ('review-004', 'hawaii', '하와이', '완벽했던 하와이 허니문', '마우이의 와일레아에서 머물렀는데, 리조트가 정말 훌륭했습니다. 매일 아침 발코니에서 바라본 바다가 너무 아름다웠고, 저녁에는 루아우 쇼를 보며 하와이 문화를 체험할 수 있었습니다. 선셋 크루즈도 강력 추천합니다!', 5, '최**', '2024년 8월', '', 'approved', 0, 1702742100000, 1702742100000),
  ('review-005', 'philippines', '필리핀', '가성비 최고 보라카이!', '예산이 빠듯했는데 선샤인투어에서 가성비 좋은 패키지를 추천해주셔서 감사합니다. 보라카이의 화이트비치는 정말 환상적이었고, 리조트도 깨끗하고 편안했습니다. 다이빙과 패러세일링도 즐기고, 맛있는 해산물 요리도 많이 먹었습니다. 다음에 또 가고 싶네요!', 4, '정**', '2024년 7월', '', 'approved', 0, 1702742000000, 1702742000000);

-- ===================================
-- Inquiries (문의) 샘플 데이터
-- ===================================

INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
VALUES 
  ('inquiry-001', '홍길동', 'hong@example.com', '010-1234-5678', 'thailand-phuket', '5m_7m', 2, '2024-12-20', '5박 6일', '푸켓 허니문 리조트 추천 부탁드립니다', '12월 말 푸켓 허니문을 계획 중입니다. 프라이빗한 분위기의 5성급 리조트를 원하며, 예산은 500-700만원 정도 생각하고 있습니다. 추천 부탁드립니다.', 'pending', 1702742400000, 1702742400000),
  ('inquiry-002', '김영희', 'kim@example.com', '010-2345-6789', 'maldives', '10m_over', 2, '2025-01-15', '7박 8일', '몰디브 수상빌라 문의', '2025년 1월 중순 몰디브 여행을 계획 중입니다. 수상빌라에서 지내고 싶은데, 추천해주실 만한 리조트가 있을까요? 예산은 1000만원 이상도 가능합니다.', 'processing', 1702742300000, 1702742300000);
