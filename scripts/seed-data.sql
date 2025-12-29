-- Sample Regions
INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active) VALUES
('region-thailand-khao-lak', 'khao-lak', '태국', '카오락', 'Khao Lak', '한적한 해변과 코끼리 캠프로 유명한 조용한 휴양지', '/static/images/destinations/thailand/TAI_1.webp', 1, TRUE),
('region-thailand-phuket', 'phuket', '태국', '푸켓', 'Phuket', '안다만 해의 진주, 세계적인 비치 리조트', '/static/images/destinations/thailand/TAI_2.webp', 2, TRUE),
('region-thailand-koh-samui', 'koh-samui', '태국', '코사무이', 'Koh Samui', '야자수 해변과 럭셔리 리조트의 섬', '/static/images/destinations/thailand/TAI_3.webp', 3, TRUE),
('region-thailand-krabi', 'krabi', '태국', '크라비', 'Krabi', '석회암 절벽과 에메랄드 바다의 절경', '/static/images/destinations/thailand/TAI_4.webp', 4, TRUE),
('region-thailand-pattaya', 'pattaya', '태국', '파타야', 'Pattaya', '방콕 근교의 활기찬 해변 도시', '/static/images/destinations/thailand/TAI_5.webp', 5, TRUE),
('region-thailand-hua-hin', 'hua-hin', '태국', '후아힌', 'Hua Hin', '왕실의 휴양지, 고급스러운 리조트', '/static/images/destinations/thailand/TAI_6.webp', 6, TRUE);

-- Sample Resorts for Khao Lak
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active) VALUES
('resort-khao-lak-1', 'region-thailand-khao-lak', '카오락 비치 리조트', 'Khao Lak Beach Resort', '럭셔리', '프라이빗 비치가 있는 5성급 럭셔리 리조트', '/static/images/resorts/krabi/krabi-resort01-01.webp', '[]', '["프라이빗 비치", "인피니티 풀", "스파", "한국인 가이드"]', 1, TRUE),
('resort-khao-lak-2', 'region-thailand-khao-lak', '심리란 리조트', 'Similand Resort', '부티크', '자연 친화적인 부티크 리조트', '/static/images/resorts/krabi/krabi-resort02-01.webp', '[]', '["자연 속 휴식", "스노클링", "정글 투어"]', 2, TRUE);

-- Sample Resorts for Phuket
INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active) VALUES
('resort-phuket-1', 'region-thailand-phuket', '푸켓 럭셔리 빌라', 'Phuket Luxury Villa', '럭셔리', '전용 수영장이 있는 럭셔리 빌라', '/static/images/resorts/lombok/lombok-resort01-01.webp', '[]', '["프라이빗 풀", "바다 전망", "버틀러 서비스", "한식 조식"]', 1, TRUE),
('resort-phuket-2', 'region-thailand-phuket', '파통 비치 리조트', 'Patong Beach Resort', '모던', '파통 비치 중심가의 모던 리조트', '/static/images/resorts/lombok/lombok-resort02-01.webp', '[]', '["비치 접근성", "나이트라이프", "쇼핑 편리"]', 2, TRUE);

-- Sample Reviews
INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured) VALUES
('review-1', 'khao-lak', '카오락', '완벽한 신혼여행이었습니다!', '카오락 비치 리조트에서 정말 행복한 시간을 보냈습니다. 프라이빗 비치가 너무 아름다웠고, 직원들의 서비스도 완벽했어요. 특히 한국인 가이드분이 계셔서 편하게 관광할 수 있었습니다. 다시 가고 싶어요!', 5, '김**', '2024-12', NULL, 'approved', TRUE),
('review-2', 'phuket', '푸켓', '푸켓 최고의 리조트', '푸켓 럭셔리 빌라에서 정말 잊지 못할 경험을 했습니다. 전용 수영장에서 바다를 보며 휴식하는 시간이 최고였어요. 버틀러 서비스도 훌륭했고, 한식 조식이 준비되어 있어서 더욱 만족스러웠습니다.', 5, '이**', '2024-11', NULL, 'approved', TRUE);
