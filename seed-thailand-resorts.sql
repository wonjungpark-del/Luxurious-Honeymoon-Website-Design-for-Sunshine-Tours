-- 태국 나머지 5개 지역 리조트 데이터 추가

-- Resorts - 카오락 (추가 리조트)
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-khao-lak-jw-marriott', 'region-thailand-khao-lak', 'JW 메리어트 카오락', 'JW Marriott Khao Lak Resort & Spa', '럭셔리', '프라이빗 비치와 열대 정원이 어우러진 최고급 리조트. 넓은 객실과 다양한 레스토랑, 스파 시설을 갖추고 있습니다.', '/static/images/resorts/khao-lak/jw-marriott-main.jpg', '[]', '["프라이빗 비치", "인피니티 풀", "럭셔리 스파", "키즈클럽", "5개 레스토랑", "피트니스 센터"]', 10, true, NOW(), NOW()),
('resort-khao-lak-sensimar', 'region-thailand-khao-lak', '센시마 카오락 비치프론트', 'Sensimar Khaolak Beachfront Resort', '럭셔리', '성인 전용 리조트로 조용하고 로맨틱한 분위기. 모든 객실에서 바다 전망을 감상할 수 있습니다.', '/static/images/resorts/khao-lak/sensimar-main.jpg', '[]', '["어른 전용", "올 인클루시브", "비치프론트", "3개 풀", "스파", "무료 와이파이"]', 11, true, NOW(), NOW()),
('resort-khao-lak-moracea', 'region-thailand-khao-lak', '모라시 카오락', 'Moracea by Khaolak Resort', '부티크', '모던하고 세련된 디자인의 부티크 리조트. 가족 단위 여행객에게 인기가 많습니다.', '/static/images/resorts/khao-lak/moracea-main.jpg', '[]', '["패밀리 풀", "키즈클럽", "수상 스포츠", "5개 레스토랑", "스파", "비치 액세스"]', 12, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Resorts - 코사무이
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-koh-samui-conrad', 'region-thailand-koh-samui', '콘래드 코사무이', 'Conrad Koh Samui', '럭셔리', '언덕 위에 위치한 초호화 리조트. 모든 빌라에 프라이빗 풀이 있으며 360도 바다 전망을 자랑합니다.', '/static/images/resorts/koh-samui/conrad-main.jpg', '[]', '["프라이빗 풀 빌라", "인피니티 풀", "미슐랭 레스토랑", "럭셔리 스파", "버틀러 서비스", "무료 셔틀"]', 1, true, NOW(), NOW()),
('resort-koh-samui-four-seasons', 'region-thailand-koh-samui', '포시즌스 코사무이', 'Four Seasons Resort Koh Samui', '럭셔리', '코코넛 나무 숲과 해변이 어우러진 열대 낙원. 최상급 서비스와 시설을 제공합니다.', '/static/images/resorts/koh-samui/four-seasons-main.jpg', '[]', '["프라이빗 풀 빌라", "비치 액세스", "스파", "3개 레스토랑", "키즈클럽", "요가 세션"]', 2, true, NOW(), NOW()),
('resort-koh-samui-six-senses', 'region-thailand-koh-samui', '식스센스 사무이', 'Six Senses Samui', '럭셔리', '천혜의 자연을 간직한 프라이빗 리조트. 웰니스와 스파로 유명합니다.', '/static/images/resorts/koh-samui/six-senses-main.jpg', '[]', '["프라이빗 풀 빌라", "웰니스 센터", "유기농 레스토랑", "요가", "스노클링", "카약"]', 3, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Resorts - 푸켓 (추가 리조트)
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-phuket-anantara-layan', 'region-thailand-phuket', '아난타라 라얀 푸켓', 'Anantara Layan Phuket Resort', '럭셔리', '조용한 라얀 비치에 위치한 프라이빗 리조트. 태국 전통 양식과 현대적 럭셔리가 조화를 이룹니다.', '/static/images/resorts/phuket/anantara-layan-main.jpg', '[]', '["프라이빗 비치", "풀 빌라", "스파", "3개 레스토랑", "키즈클럽", "수상 스포츠"]', 3, true, NOW(), NOW()),
('resort-phuket-trisara', 'region-thailand-phuket', '트리사라 푸켓', 'Trisara Phuket', '럭셔리', '푸켓 최고급 리조트 중 하나. 모든 빌라에 프라이빗 풀과 개인 집사 서비스가 제공됩니다.', '/static/images/resorts/phuket/trisara-main.jpg', '[]', '["프라이빗 풀 빌라", "버틀러 서비스", "프라이빗 비치", "미슐랭 레스토랑", "요트 서비스", "럭셔리 스파"]', 4, true, NOW(), NOW()),
('resort-phuket-banyan-tree', 'region-thailand-phuket', '반얀트리 푸켓', 'Banyan Tree Phuket', '럭셔리', '라구나 푸켓의 대표 리조트. 열대 정원과 라구나가 어우러진 독특한 분위기.', '/static/images/resorts/phuket/banyan-tree-main.jpg', '[]', '["풀 빌라", "반얀트리 스파", "골프 코스", "3개 레스토랑", "키즈클럽", "수상 스포츠"]', 5, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Resorts - 끄라비
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-krabi-rayavadee', 'region-thailand-krabi', '라야바디 끄라비', 'Rayavadee', '럭셔리', '프라낭 비치의 전설적인 리조트. 석회암 절벽으로 둘러싸인 프라이빗 파라다이스.', '/static/images/resorts/krabi/rayavadee-main.jpg', '[]', '["프라이빗 빌라", "프라낭 비치", "록 클라이밍", "스파", "3개 레스토랑", "카약"]', 1, true, NOW(), NOW()),
('resort-krabi-centara-grand', 'region-thailand-krabi', '센타라 그랜드 비치 리조트', 'Centara Grand Beach Resort & Villas Krabi', '프리미엄', '아오낭 비치의 대형 리조트. 가족 단위 여행객에게 최적.', '/static/images/resorts/krabi/centara-grand-main.jpg', '[]', '["비치프론트", "워터파크", "키즈클럽", "5개 레스토랑", "스파", "수영장 10개"]', 2, true, NOW(), NOW()),
('resort-krabi-phulay-bay', 'region-thailand-krabi', '풀레이 베이 리츠칼튼', 'Phulay Bay, a Ritz-Carlton Reserve', '럭셔리', '리츠칼튼의 최고급 브랜드. 완벽한 프라이버시와 서비스.', '/static/images/resorts/krabi/phulay-bay-main.jpg', '[]', '["풀 빌라", "버틀러 서비스", "프라이빗 비치", "미슐랭 레스토랑", "스파", "요가"]', 3, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Resorts - 파타야
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-pattaya-intercontinental', 'region-thailand-pattaya', '인터컨티넨탈 파타야', 'InterContinental Pattaya Resort', '프리미엄', '파타야 베이를 내려다보는 힐탑 리조트. 모던한 디자인과 인피니티 풀이 매력적.', '/static/images/resorts/pattaya/intercontinental-main.jpg', '[]', '["인피니티 풀", "스카이 바", "스파", "비치 액세스", "피트니스 센터", "3개 레스토랑"]', 1, true, NOW(), NOW()),
('resort-pattaya-cape-dara', 'region-thailand-pattaya', '케이프 다라 리조트', 'Cape Dara Resort', '프리미엄', '파타야 북부 해변의 모던 리조트. 조용하고 깨끗한 환경.', '/static/images/resorts/pattaya/cape-dara-main.jpg', '[]', '["비치프론트", "인피니티 풀", "스파", "레스토랑", "바", "피트니스"]', 2, true, NOW(), NOW()),
('resort-pattaya-pullman', 'region-thailand-pattaya', '풀만 파타야 G', 'Pullman Pattaya Hotel G', '모던', '파타야 중심가의 모던 비치프론트 호텔. 쇼핑과 엔터테인먼트에 편리.', '/static/images/resorts/pattaya/pullman-main.jpg', '[]', '["비치프론트", "루프탑 바", "수영장", "피트니스", "3개 레스토랑", "나이트라이프"]', 3, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Resorts - 후아힌
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
('resort-hua-hin-chiva-som', 'region-thailand-hua-hin', '치바솜 후아힌', 'Chiva-Som International Health Resort', '럭셔리', '세계 최고의 웰니스 리조트. 건강과 힐링에 특화된 프로그램.', '/static/images/resorts/hua-hin/chiva-som-main.jpg', '[]', '["웰니스 프로그램", "스파", "요가", "건강식", "명상", "피트니스"]', 1, true, NOW(), NOW()),
('resort-hua-hin-intercontinental', 'region-thailand-hua-hin', '인터컨티넨탈 후아힌', 'InterContinental Hua Hin Resort', '럭셔리', '식민지 시대 건축 양식의 우아한 리조트. 왕실 해변 근처에 위치.', '/static/images/resorts/hua-hin/intercontinental-main.jpg', '[]', '["비치프론트", "골프 코스", "스파", "5개 레스토랑", "키즈클럽", "수영장"]', 2, true, NOW(), NOW()),
('resort-hua-hin-hyatt', 'region-thailand-hua-hin', '하얏트 리젠시 후아힌', 'Hyatt Regency Hua Hin', '프리미엄', '가족 친화적인 대형 리조트. 다양한 액티비티와 시설.', '/static/images/resorts/hua-hin/hyatt-main.jpg', '[]', '["비치프론트", "워터파크", "키즈클럽", "4개 레스토랑", "스파", "골프"]', 3, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;
