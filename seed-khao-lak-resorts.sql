-- Khao Lak Resorts Data (8 resorts with 7 low-quality images each)

-- 1. JW Marriott Khao Lak
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description, 
  main_image_url, gallery_images, features, 
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-jw-marriott',
  'region-thailand-khao-lak',
  'JW 메리어트 카오락',
  'JW Marriott Khao Lak Resort & Spa',
  '5성급 프리미엄',
  '프라이빗 비치와 럭셔리한 스파를 갖춘 최고급 리조트입니다.',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=70',
  '["https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["프라이빗 비치", "럭셔리 스파", "무료 조식", "수영장 3개"]',
  1, 1, 1702742400000, 1702742400000
);

-- 2. La Bella Resort
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-la-bella',
  'region-thailand-khao-lak',
  '라 벨라 리조트',
  'La Bella Khao Lak Resort',
  '5성급 프리미엄',
  '이탈리안 스타일의 고급 리조트로 로맨틱한 분위기가 일품입니다.',
  'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=70',
  '["https://images.unsplash.com/photo-1540541338287-41700207dee6?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["이탈리안 레스토랑", "인피니티 풀", "커플 스파", "비치 바"]',
  2, 1, 1702742400000, 1702742400000
);

-- 3. Robinson Club Khao Lak
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-robinson',
  'region-thailand-khao-lak',
  '로빈슨 클럽 카오락',
  'Robinson Club Khao Lak',
  '4.5성급 럭셔리',
  '올인클루시브 시스템의 독일식 럭셔리 리조트입니다.',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=70',
  '["https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["올인클루시브", "5개 레스토랑", "워터파크", "키즈클럽"]',
  3, 1, 1702742400000, 1702742400000
);

-- 4. Mai Khao Lak Beach Resort
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-mai-khao',
  'region-thailand-khao-lak',
  '마이 카오락 비치 리조트',
  'Mai Khao Lak Beach Resort & Spa',
  '4성급 스탠다드',
  '합리적인 가격의 편안한 비치 리조트입니다.',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=70',
  '["https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["비치프론트", "대형 수영장", "태국 레스토랑", "무료 WiFi"]',
  4, 1, 1702742400000, 1702742400000
);

-- 5. Mukdara Resort
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-mukdara',
  'region-thailand-khao-lak',
  '묵다라 리조트',
  'Mukdara Beach Villa & Spa Resort',
  '4성급 스탠다드',
  '조용하고 한적한 프라이빗 빌라 스타일 리조트입니다.',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=70',
  '["https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["프라이빗 빌라", "스파", "조식 포함", "자전거 대여"]',
  5, 1, 1702742400000, 1702742400000
);

-- 6. Beyond Resort Khao Lak
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-beyond',
  'region-thailand-khao-lak',
  '비욘드 리조트 카오락',
  'Beyond Resort Khao Lak',
  '4.5성급 럭셔리',
  '현대적인 디자인과 편안함이 조화된 부티크 리조트입니다.',
  'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800&q=70',
  '["https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60"]',
  '["모던 디자인", "루프탑 바", "요가 클래스", "셔틀 버스"]',
  6, 1, 1702742400000, 1702742400000
);

-- 7. Senmai Resort Khao Lak
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-senmai',
  'region-thailand-khao-lak',
  '센마이 리조트 카오락',
  'Senmai Resort Khao Lak',
  '4성급 스탠다드',
  '가족 단위 여행객에게 적합한 편안한 리조트입니다.',
  'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=800&q=70',
  '["https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60"]',
  '["패밀리룸", "키즈풀", "놀이터", "레스토랑"]',
  7, 1, 1702742400000, 1702742400000
);

-- 8. Eden Beach Resort
INSERT OR REPLACE INTO resorts (
  id, region_id, name_ko, name_en, category, description,
  main_image_url, gallery_images, features,
  display_order, is_active, created_at, updated_at
) VALUES (
  'resort-khao-lak-eden',
  'region-thailand-khao-lak',
  '에덴 비치 리조트',
  'Eden Beach Resort Khao Lak',
  '4성급 스탠다드',
  '아름다운 정원과 해변이 어우러진 평화로운 리조트입니다.',
  'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=70',
  '["https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=400&q=60","https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=60","https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&q=60","https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=60","https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=60","https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&q=60","https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400&q=60"]',
  '["가든뷰", "비치 접근", "수영장", "바비큐 시설"]',
  8, 1, 1702742400000, 1702742400000
);
