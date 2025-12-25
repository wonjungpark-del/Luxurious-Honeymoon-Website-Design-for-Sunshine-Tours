-- 프로덕션 데이터베이스 샘플 데이터 입력

-- 지역 데이터
INSERT OR IGNORE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at) VALUES
('region-maldives', 'MV', 'Maldives', '몰디브', 'Maldives', '인도양의 보석, 몰디브에서 누리는 최고급 수상빌라 허니문', 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-bali', 'ID-BA', 'Indonesia', '발리', 'Bali', '신들의 섬 발리, 열대 낙원에서의 로맨틱한 휴가', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-phuket', 'TH-83', 'Thailand', '푸켓', 'Phuket', '태국의 진주 푸켓, 에메랄드빛 바다와 럭셔리 리조트', 'https://images.unsplash.com/photo-1589394815804-964ed0be2eb5?w=800', 3, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-santorini', 'GR-82', 'Greece', '산토리니', 'Santorini', '에게해의 낭만, 하얀 건물과 푸른 돔의 아름다운 조화', 'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800', 4, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-hawaii', 'US-HI', 'USA', '하와이', 'Hawaii', '태평양의 낙원 하와이, 자연과 문화가 어우러진 섬', 'https://images.unsplash.com/photo-1542259009477-d625272157b7?w=800', 5, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-paris', 'FR-75', 'France', '파리', 'Paris', '사랑의 도시 파리, 로맨틱한 유럽 여행의 시작', 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800', 6, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-mauritius', 'MU', 'Mauritius', '모리셔스', 'Mauritius', '인도양의 보물섬, 럭셔리와 자연의 완벽한 조화', 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', 7, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('region-cancun', 'MX-QR', 'Mexico', '칸쿤', 'Cancun', '카리브해의 천국 칸쿤, 올인클루시브 리조트의 메카', 'https://images.unsplash.com/photo-1548574505-5e239809ee19?w=800', 8, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000);

-- 리조트 데이터
INSERT OR IGNORE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at) VALUES
-- 몰디브 리조트
('resort-soneva-jani', 'region-maldives', '소네바 자니', 'Soneva Jani', 'luxury', '세계 최고의 수상빌라 리조트, 프라이빗 워터 슬라이드와 천문대', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800', '[]', '["프라이빗 워터 슬라이드", "천문대", "무인도 피크닉", "오픈에어 시네마"]', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('resort-gili-lankanfushi', 'region-maldives', '길리 랑칸푸시', 'Gili Lankanfushi', 'luxury', '에코 럭셔리의 정수, 대나무로 지은 수상빌라', 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', '[]', '["에코 럭셔리", "프라이빗 리저브", "스노클링", "돌고래 크루즈"]', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),

-- 발리 리조트
('resort-ayana-bali', 'region-bali', '아야나 리조트 발리', 'AYANA Resort Bali', 'luxury', '세계적으로 유명한 록 바와 절벽 위 인피니티 풀', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800', '[]', '["록 바", "클리프사이드 풀", "스파", "골프 코스"]', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('resort-bulgari-bali', 'region-bali', '불가리 리조트 발리', 'Bulgari Resort Bali', 'luxury', '이탈리아 명품 브랜드의 럭셔리 리조트', 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800', '[]', '["불가리 스파", "클리프탑 다이닝", "프라이빗 비치", "이탈리안 레스토랑"]', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),

-- 푸켓 리조트
('resort-sri-panwa', 'region-phuket', '스리 판와', 'Sri panwa', 'luxury', '판와 곶의 럭셔리 풀빌라 리조트', 'https://images.unsplash.com/photo-1540202404-a2f29016b523?w=800', '[]', '["프라이빗 풀빌라", "옥상 바", "스파", "프라이빗 비치"]', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('resort-trisara', 'region-phuket', '트리사라', 'Trisara', 'luxury', '왕족의 휴양지, 최고급 프라이빗 풀빌라', 'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800', '[]', '["로얄 풀빌라", "미쉐린 레스토랑", "프라이빗 비치", "요트 서비스"]', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),

-- 산토리니 리조트
('resort-katikies', 'region-santorini', '카티키에스', 'Katikies', 'luxury', '칼데라 뷰의 화이트 케이브 스위트', 'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800', '[]', '["칼데라 뷰", "케이브 스위트", "인피니티 풀", "선셋 다이닝"]', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('resort-canaves-oia', 'region-santorini', '카나베스 오이아', 'Canaves Oia', 'luxury', '오이아의 럭셔리 스위트와 빌라', 'https://images.unsplash.com/photo-1533104816931-20fa691ff6ca?w=800', '[]', '["오이아 선셋", "플런지 풀", "와인 셀러", "그리스 요리"]', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),

-- 하와이 리조트
('resort-four-seasons-maui', 'region-hawaii', '포시즌스 마우이', 'Four Seasons Resort Maui', 'luxury', '와일레아 해변의 최고급 리조트', 'https://images.unsplash.com/photo-1542259009477-d625272157b7?w=800', '[]', '["골든 비치", "3개 인피니티 풀", "스파", "스노클링"]', 1, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('resort-halekulani', 'region-hawaii', '할레쿨라니', 'Halekulani', 'luxury', '와이키키 비치의 전설적인 럭셔리 호텔', 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800', '[]', '["오션프론트", "미쉐린 레스토랑", "오키드 풀", "선셋 칵테일"]', 2, 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000);

-- 후기 데이터
INSERT OR IGNORE INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at) VALUES
('review-prod-1', 'maldives', '몰디브', '평생 잊지 못할 몰디브 여행', '소네바 자니 리조트에서 보낸 7박 8일은 정말 환상적이었습니다. 프라이빗 워터 슬라이드가 있는 수상빌라는 아이들도 너무 좋아했고, 밤에는 천문대에서 별을 보며 로맨틱한 시간을 보냈어요. 선샤인투어 덕분에 완벽한 허니문이었습니다!', 5, '이서연', '2024-11', 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800', 'approved', 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('review-prod-2', 'bali', '발리', '발리 럭셔리 리조트 최고!', '아야나 리조트의 록 바에서 본 석양은 정말 잊을 수 없어요. 클리프사이드 인피니티 풀에서 수영하며 바다를 바라보는 경험은 최고였습니다. 스파도 훌륭했고, 직원들의 서비스도 완벽했어요.', 5, '박지훈', '2024-10', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800', 'approved', 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000),
('review-prod-3', 'phuket', '푸켓', '꿈같았던 푸켓 허니문!', '트리사라 리조트의 로얄 풀빌라는 정말 왕족이 된 기분이었어요. 프라이빗 비치에서 두 사람만의 시간을 보낼 수 있어서 좋았고, 미쉐린 레스토랑 음식도 최고였습니다!', 5, '김민지', '2024-09', 'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800', 'approved', 1, strftime('%s', 'now') * 1000, strftime('%s', 'now') * 1000);
