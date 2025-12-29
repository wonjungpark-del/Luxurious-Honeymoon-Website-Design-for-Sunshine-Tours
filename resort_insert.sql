-- ==========================================
-- 리조트 데이터 INSERT SQL
-- ==========================================


-- 발리 (bali) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1000',
  'bali',
  '반얀트리',
  '반얀트리',
  '리조트',
  '반얀트리 - 프리미엄 리조트',
  'https://example.com/resorts/bali/1000_main.jpg',
  '["https://example.com/resorts/bali/1000_1.jpg", "https://example.com/resorts/bali/1000_2.jpg", "https://example.com/resorts/bali/1000_3.jpg", "https://example.com/resorts/bali/1000_4.jpg", "https://example.com/resorts/bali/1000_5.jpg", "https://example.com/resorts/bali/1000_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1000,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1001',
  'bali',
  '아야나',
  '아야나',
  '리조트',
  '아야나 - 프리미엄 리조트',
  'https://example.com/resorts/bali/1001_main.jpg',
  '["https://example.com/resorts/bali/1001_1.jpg", "https://example.com/resorts/bali/1001_2.jpg", "https://example.com/resorts/bali/1001_3.jpg", "https://example.com/resorts/bali/1001_4.jpg", "https://example.com/resorts/bali/1001_5.jpg", "https://example.com/resorts/bali/1001_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1001,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1002',
  'bali',
  '알란드라 짐바란',
  '알란드라 짐바란',
  '리조트',
  '알란드라 짐바란 - 프리미엄 리조트',
  'https://example.com/resorts/bali/1002_main.jpg',
  '["https://example.com/resorts/bali/1002_1.jpg", "https://example.com/resorts/bali/1002_2.jpg", "https://example.com/resorts/bali/1002_3.jpg", "https://example.com/resorts/bali/1002_4.jpg", "https://example.com/resorts/bali/1002_5.jpg", "https://example.com/resorts/bali/1002_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1002,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1003',
  'bali',
  '포시즌',
  '포시즌',
  '리조트',
  '포시즌 - 프리미엄 리조트',
  'https://example.com/resorts/bali/1003_main.jpg',
  '["https://example.com/resorts/bali/1003_1.jpg", "https://example.com/resorts/bali/1003_2.jpg", "https://example.com/resorts/bali/1003_3.jpg", "https://example.com/resorts/bali/1003_4.jpg", "https://example.com/resorts/bali/1003_5.jpg", "https://example.com/resorts/bali/1003_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1003,
  true,
  NOW(),
  NOW()
);

-- 빅아일랜드 (big-island) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1004',
  'big-island',
  '쉐라톤코나',
  '쉐라톤코나',
  '리조트',
  '쉐라톤코나 - 프리미엄 리조트',
  'https://example.com/resorts/big-island/1004_main.jpg',
  '["https://example.com/resorts/big-island/1004_1.jpg", "https://example.com/resorts/big-island/1004_2.jpg", "https://example.com/resorts/big-island/1004_3.jpg", "https://example.com/resorts/big-island/1004_4.jpg", "https://example.com/resorts/big-island/1004_5.jpg", "https://example.com/resorts/big-island/1004_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1004,
  true,
  NOW(),
  NOW()
);

-- 칸쿤 (cancun) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1005',
  'cancun',
  '멜로디메이커',
  '멜로디메이커',
  '리조트',
  '멜로디메이커 - 프리미엄 리조트',
  'https://example.com/resorts/cancun/1005_main.jpg',
  '["https://example.com/resorts/cancun/1005_1.jpg", "https://example.com/resorts/cancun/1005_2.jpg", "https://example.com/resorts/cancun/1005_3.jpg", "https://example.com/resorts/cancun/1005_4.jpg", "https://example.com/resorts/cancun/1005_5.jpg", "https://example.com/resorts/cancun/1005_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1005,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1006',
  'cancun',
  '선 팰리스',
  '선 팰리스',
  '리조트',
  '선 팰리스 - 프리미엄 리조트',
  'https://example.com/resorts/cancun/1006_main.jpg',
  '["https://example.com/resorts/cancun/1006_1.jpg", "https://example.com/resorts/cancun/1006_2.jpg"]'::jsonb,
  '[]'::jsonb,
  1006,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1007',
  'cancun',
  '시크릿더바인',
  '시크릿더바인',
  '리조트',
  '시크릿더바인 - 프리미엄 리조트',
  'https://example.com/resorts/cancun/1007_main.jpg',
  '["https://example.com/resorts/cancun/1007_1.jpg", "https://example.com/resorts/cancun/1007_2.jpg", "https://example.com/resorts/cancun/1007_3.jpg", "https://example.com/resorts/cancun/1007_4.jpg", "https://example.com/resorts/cancun/1007_5.jpg", "https://example.com/resorts/cancun/1007_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1007,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1008',
  'cancun',
  '파라디수스 칸쿤',
  '파라디수스 칸쿤',
  '리조트',
  '파라디수스 칸쿤 - 프리미엄 리조트',
  'https://example.com/resorts/cancun/1008_main.jpg',
  '["https://example.com/resorts/cancun/1008_1.jpg", "https://example.com/resorts/cancun/1008_2.jpg", "https://example.com/resorts/cancun/1008_3.jpg", "https://example.com/resorts/cancun/1008_4.jpg", "https://example.com/resorts/cancun/1008_5.jpg", "https://example.com/resorts/cancun/1008_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1008,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1009',
  'cancun',
  '하얏트지바',
  '하얏트지바',
  '리조트',
  '하얏트지바 - 프리미엄 리조트',
  'https://example.com/resorts/cancun/1009_main.jpg',
  '["https://example.com/resorts/cancun/1009_1.jpg", "https://example.com/resorts/cancun/1009_2.jpg", "https://example.com/resorts/cancun/1009_3.jpg", "https://example.com/resorts/cancun/1009_4.jpg", "https://example.com/resorts/cancun/1009_5.jpg", "https://example.com/resorts/cancun/1009_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1009,
  true,
  NOW(),
  NOW()
);

-- 두바이 (dubai) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1010',
  'dubai',
  '디바나 플라자',
  '디바나 플라자',
  '리조트',
  '디바나 플라자 - 프리미엄 리조트',
  'https://example.com/resorts/dubai/1010_main.jpg',
  '["https://example.com/resorts/dubai/1010_1.jpg", "https://example.com/resorts/dubai/1010_2.jpg", "https://example.com/resorts/dubai/1010_3.jpg", "https://example.com/resorts/dubai/1010_4.jpg", "https://example.com/resorts/dubai/1010_5.jpg"]'::jsonb,
  '[]'::jsonb,
  1010,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1011',
  'dubai',
  '리치칼튼',
  '리치칼튼',
  '리조트',
  '리치칼튼 - 프리미엄 리조트',
  'https://example.com/resorts/dubai/1011_main.jpg',
  '["https://example.com/resorts/dubai/1011_1.jpg", "https://example.com/resorts/dubai/1011_2.jpg", "https://example.com/resorts/dubai/1011_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1011,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1012',
  'dubai',
  '피말라이',
  '피말라이',
  '리조트',
  '피말라이 - 프리미엄 리조트',
  'https://example.com/resorts/dubai/1012_main.jpg',
  '["https://example.com/resorts/dubai/1012_1.jpg", "https://example.com/resorts/dubai/1012_2.jpg", "https://example.com/resorts/dubai/1012_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1012,
  true,
  NOW(),
  NOW()
);

-- 카오락 (khao-lak) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1013',
  'khao-lak',
  'JW',
  'JW',
  '리조트',
  'JW - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1013_main.jpg',
  '["https://example.com/resorts/khao-lak/1013_1.jpg", "https://example.com/resorts/khao-lak/1013_2.jpg", "https://example.com/resorts/khao-lak/1013_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1013,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1014',
  'khao-lak',
  '라벨라',
  '라벨라',
  '리조트',
  '라벨라 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1014_main.jpg',
  '["https://example.com/resorts/khao-lak/1014_1.jpg", "https://example.com/resorts/khao-lak/1014_2.jpg", "https://example.com/resorts/khao-lak/1014_3.jpg", "https://example.com/resorts/khao-lak/1014_4.jpg", "https://example.com/resorts/khao-lak/1014_5.jpg", "https://example.com/resorts/khao-lak/1014_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1014,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1015',
  'khao-lak',
  '로빈슨',
  '로빈슨',
  '리조트',
  '로빈슨 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1015_main.jpg',
  '["https://example.com/resorts/khao-lak/1015_1.jpg", "https://example.com/resorts/khao-lak/1015_2.jpg", "https://example.com/resorts/khao-lak/1015_3.jpg", "https://example.com/resorts/khao-lak/1015_4.jpg", "https://example.com/resorts/khao-lak/1015_5.jpg", "https://example.com/resorts/khao-lak/1015_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1015,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1016',
  'khao-lak',
  '마이카오락',
  '마이카오락',
  '리조트',
  '마이카오락 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1016_main.jpg',
  '["https://example.com/resorts/khao-lak/1016_1.jpg", "https://example.com/resorts/khao-lak/1016_2.jpg", "https://example.com/resorts/khao-lak/1016_3.jpg", "https://example.com/resorts/khao-lak/1016_4.jpg", "https://example.com/resorts/khao-lak/1016_5.jpg", "https://example.com/resorts/khao-lak/1016_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1016,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1017',
  'khao-lak',
  '비욘드',
  '비욘드',
  '리조트',
  '비욘드 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1017_main.jpg',
  '["https://example.com/resorts/khao-lak/1017_1.jpg", "https://example.com/resorts/khao-lak/1017_2.jpg", "https://example.com/resorts/khao-lak/1017_3.jpg", "https://example.com/resorts/khao-lak/1017_4.jpg", "https://example.com/resorts/khao-lak/1017_5.jpg", "https://example.com/resorts/khao-lak/1017_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1017,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1018',
  'khao-lak',
  '센마이리조트',
  '센마이리조트',
  '리조트',
  '센마이리조트 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1018_main.jpg',
  '["https://example.com/resorts/khao-lak/1018_1.jpg", "https://example.com/resorts/khao-lak/1018_2.jpg", "https://example.com/resorts/khao-lak/1018_3.jpg", "https://example.com/resorts/khao-lak/1018_4.jpg", "https://example.com/resorts/khao-lak/1018_5.jpg", "https://example.com/resorts/khao-lak/1018_6.jpg", "https://example.com/resorts/khao-lak/1018_7.jpg"]'::jsonb,
  '[]'::jsonb,
  1018,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1019',
  'khao-lak',
  '에덴비치',
  '에덴비치',
  '리조트',
  '에덴비치 - 프리미엄 리조트',
  'https://example.com/resorts/khao-lak/1019_main.jpg',
  '["https://example.com/resorts/khao-lak/1019_1.jpg", "https://example.com/resorts/khao-lak/1019_2.jpg", "https://example.com/resorts/khao-lak/1019_3.jpg", "https://example.com/resorts/khao-lak/1019_4.jpg", "https://example.com/resorts/khao-lak/1019_5.jpg"]'::jsonb,
  '[]'::jsonb,
  1019,
  true,
  NOW(),
  NOW()
);

-- 코사무이 (koh-samui) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1020',
  'koh-samui',
  '더사란',
  '더사란',
  '리조트',
  '더사란 - 프리미엄 리조트',
  'https://example.com/resorts/koh-samui/1020_main.jpg',
  '["https://example.com/resorts/koh-samui/1020_1.jpg", "https://example.com/resorts/koh-samui/1020_2.jpg", "https://example.com/resorts/koh-samui/1020_3.jpg", "https://example.com/resorts/koh-samui/1020_4.jpg", "https://example.com/resorts/koh-samui/1020_5.jpg", "https://example.com/resorts/koh-samui/1020_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1020,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1021',
  'koh-samui',
  '반얀트리',
  '반얀트리',
  '리조트',
  '반얀트리 - 프리미엄 리조트',
  'https://example.com/resorts/koh-samui/1021_main.jpg',
  '["https://example.com/resorts/koh-samui/1021_1.jpg", "https://example.com/resorts/koh-samui/1021_2.jpg", "https://example.com/resorts/koh-samui/1021_3.jpg", "https://example.com/resorts/koh-samui/1021_4.jpg", "https://example.com/resorts/koh-samui/1021_5.jpg", "https://example.com/resorts/koh-samui/1021_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1021,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1022',
  'koh-samui',
  '인터콘티넨탈',
  '인터콘티넨탈',
  '리조트',
  '인터콘티넨탈 - 프리미엄 리조트',
  'https://example.com/resorts/koh-samui/1022_main.jpg',
  '["https://example.com/resorts/koh-samui/1022_1.jpg", "https://example.com/resorts/koh-samui/1022_2.jpg", "https://example.com/resorts/koh-samui/1022_3.jpg", "https://example.com/resorts/koh-samui/1022_4.jpg", "https://example.com/resorts/koh-samui/1022_5.jpg", "https://example.com/resorts/koh-samui/1022_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1022,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1023',
  'koh-samui',
  '키리카얀',
  '키리카얀',
  '리조트',
  '키리카얀 - 프리미엄 리조트',
  'https://example.com/resorts/koh-samui/1023_main.jpg',
  '["https://example.com/resorts/koh-samui/1023_1.jpg", "https://example.com/resorts/koh-samui/1023_2.jpg", "https://example.com/resorts/koh-samui/1023_3.jpg", "https://example.com/resorts/koh-samui/1023_4.jpg", "https://example.com/resorts/koh-samui/1023_5.jpg", "https://example.com/resorts/koh-samui/1023_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1023,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1024',
  'koh-samui',
  '포시즌리조트',
  '포시즌리조트',
  '리조트',
  '포시즌리조트 - 프리미엄 리조트',
  'https://example.com/resorts/koh-samui/1024_main.jpg',
  '["https://example.com/resorts/koh-samui/1024_1.jpg", "https://example.com/resorts/koh-samui/1024_2.jpg", "https://example.com/resorts/koh-samui/1024_3.jpg", "https://example.com/resorts/koh-samui/1024_4.jpg", "https://example.com/resorts/koh-samui/1024_5.jpg", "https://example.com/resorts/koh-samui/1024_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1024,
  true,
  NOW(),
  NOW()
);

-- 롬복 (lombok) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1025',
  'lombok',
  '수다말라',
  '수다말라',
  '리조트',
  '수다말라 - 프리미엄 리조트',
  'https://example.com/resorts/lombok/1025_main.jpg',
  '["https://example.com/resorts/lombok/1025_1.jpg", "https://example.com/resorts/lombok/1025_2.jpg", "https://example.com/resorts/lombok/1025_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1025,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1026',
  'lombok',
  '옴박',
  '옴박',
  '리조트',
  '옴박 - 프리미엄 리조트',
  'https://example.com/resorts/lombok/1026_main.jpg',
  '["https://example.com/resorts/lombok/1026_1.jpg", "https://example.com/resorts/lombok/1026_2.jpg", "https://example.com/resorts/lombok/1026_3.jpg", "https://example.com/resorts/lombok/1026_4.jpg", "https://example.com/resorts/lombok/1026_5.jpg", "https://example.com/resorts/lombok/1026_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1026,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1027',
  'lombok',
  '푸리마스',
  '푸리마스',
  '리조트',
  '푸리마스 - 프리미엄 리조트',
  'https://example.com/resorts/lombok/1027_main.jpg',
  '["https://example.com/resorts/lombok/1027_1.jpg", "https://example.com/resorts/lombok/1027_2.jpg", "https://example.com/resorts/lombok/1027_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1027,
  true,
  NOW(),
  NOW()
);

-- 몰디브 (maldives) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1028',
  'maldives',
  '길리랑칸푸쉬',
  '길리랑칸푸쉬',
  '리조트',
  '길리랑칸푸쉬 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1028_main.jpg',
  '["https://example.com/resorts/maldives/1028_1.jpg", "https://example.com/resorts/maldives/1028_2.jpg", "https://example.com/resorts/maldives/1028_3.jpg", "https://example.com/resorts/maldives/1028_4.jpg", "https://example.com/resorts/maldives/1028_5.jpg", "https://example.com/resorts/maldives/1028_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1028,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1029',
  'maldives',
  '바두',
  '바두',
  '리조트',
  '바두 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1029_main.jpg',
  '["https://example.com/resorts/maldives/1029_1.jpg", "https://example.com/resorts/maldives/1029_2.jpg", "https://example.com/resorts/maldives/1029_3.jpg", "https://example.com/resorts/maldives/1029_4.jpg", "https://example.com/resorts/maldives/1029_5.jpg", "https://example.com/resorts/maldives/1029_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1029,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1030',
  'maldives',
  '벨라사루 리조트',
  '벨라사루 리조트',
  '리조트',
  '벨라사루 리조트 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1030_main.jpg',
  '["https://example.com/resorts/maldives/1030_1.jpg", "https://example.com/resorts/maldives/1030_2.jpg", "https://example.com/resorts/maldives/1030_3.jpg", "https://example.com/resorts/maldives/1030_4.jpg", "https://example.com/resorts/maldives/1030_5.jpg", "https://example.com/resorts/maldives/1030_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1030,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1031',
  'maldives',
  '소바자니',
  '소바자니',
  '리조트',
  '소바자니 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1031_main.jpg',
  '["https://example.com/resorts/maldives/1031_1.jpg", "https://example.com/resorts/maldives/1031_2.jpg"]'::jsonb,
  '[]'::jsonb,
  1031,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1032',
  'maldives',
  '시나몬 돈벨리',
  '시나몬 돈벨리',
  '리조트',
  '시나몬 돈벨리 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1032_main.jpg',
  '["https://example.com/resorts/maldives/1032_1.jpg", "https://example.com/resorts/maldives/1032_2.jpg", "https://example.com/resorts/maldives/1032_3.jpg", "https://example.com/resorts/maldives/1032_4.jpg", "https://example.com/resorts/maldives/1032_5.jpg", "https://example.com/resorts/maldives/1032_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1032,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1033',
  'maldives',
  '아다아란 프레스티지 오션빌라 & 후두란푸시',
  '아다아란 프레스티지 오션빌라 & 후두란푸시',
  '리조트',
  '아다아란 프레스티지 오션빌라 & 후두란푸시 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1033_main.jpg',
  '["https://example.com/resorts/maldives/1033_1.jpg", "https://example.com/resorts/maldives/1033_2.jpg", "https://example.com/resorts/maldives/1033_3.jpg", "https://example.com/resorts/maldives/1033_4.jpg", "https://example.com/resorts/maldives/1033_5.jpg", "https://example.com/resorts/maldives/1033_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1033,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1034',
  'maldives',
  '오블루',
  '오블루',
  '리조트',
  '오블루 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1034_main.jpg',
  '["https://example.com/resorts/maldives/1034_1.jpg", "https://example.com/resorts/maldives/1034_2.jpg", "https://example.com/resorts/maldives/1034_3.jpg", "https://example.com/resorts/maldives/1034_4.jpg", "https://example.com/resorts/maldives/1034_5.jpg", "https://example.com/resorts/maldives/1034_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1034,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1035',
  'maldives',
  '칸두마',
  '칸두마',
  '리조트',
  '칸두마 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1035_main.jpg',
  '["https://example.com/resorts/maldives/1035_1.jpg", "https://example.com/resorts/maldives/1035_2.jpg", "https://example.com/resorts/maldives/1035_3.jpg", "https://example.com/resorts/maldives/1035_4.jpg", "https://example.com/resorts/maldives/1035_5.jpg", "https://example.com/resorts/maldives/1035_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1035,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1036',
  'maldives',
  '코코팜 보두히티',
  '코코팜 보두히티',
  '리조트',
  '코코팜 보두히티 - 프리미엄 리조트',
  'https://example.com/resorts/maldives/1036_main.jpg',
  '["https://example.com/resorts/maldives/1036_1.jpg", "https://example.com/resorts/maldives/1036_2.jpg", "https://example.com/resorts/maldives/1036_3.jpg", "https://example.com/resorts/maldives/1036_4.jpg", "https://example.com/resorts/maldives/1036_5.jpg", "https://example.com/resorts/maldives/1036_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1036,
  true,
  NOW(),
  NOW()
);

-- 마우이 (maui) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1037',
  'maui',
  '쉐라톤마우이 리조트',
  '쉐라톤마우이 리조트',
  '리조트',
  '쉐라톤마우이 리조트 - 프리미엄 리조트',
  'https://example.com/resorts/maui/1037_main.jpg',
  '["https://example.com/resorts/maui/1037_1.jpg", "https://example.com/resorts/maui/1037_2.jpg", "https://example.com/resorts/maui/1037_3.jpg", "https://example.com/resorts/maui/1037_4.jpg", "https://example.com/resorts/maui/1037_5.jpg", "https://example.com/resorts/maui/1037_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1037,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1038',
  'maui',
  '웨스틴마우이 리조트',
  '웨스틴마우이 리조트',
  '리조트',
  '웨스틴마우이 리조트 - 프리미엄 리조트',
  'https://example.com/resorts/maui/1038_main.jpg',
  '["https://example.com/resorts/maui/1038_1.jpg", "https://example.com/resorts/maui/1038_2.jpg", "https://example.com/resorts/maui/1038_3.jpg", "https://example.com/resorts/maui/1038_4.jpg", "https://example.com/resorts/maui/1038_5.jpg", "https://example.com/resorts/maui/1038_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1038,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1039',
  'maui',
  '하얏트리젠시 마우이',
  '하얏트리젠시 마우이',
  '리조트',
  '하얏트리젠시 마우이 - 프리미엄 리조트',
  'https://example.com/resorts/maui/1039_main.jpg',
  '["https://example.com/resorts/maui/1039_1.jpg", "https://example.com/resorts/maui/1039_2.jpg", "https://example.com/resorts/maui/1039_3.jpg", "https://example.com/resorts/maui/1039_4.jpg", "https://example.com/resorts/maui/1039_5.jpg"]'::jsonb,
  '[]'::jsonb,
  1039,
  true,
  NOW(),
  NOW()
);

-- 오아후 (oahu) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1040',
  'oahu',
  '쉐라톤 와이키키',
  '쉐라톤 와이키키',
  '리조트',
  '쉐라톤 와이키키 - 프리미엄 리조트',
  'https://example.com/resorts/oahu/1040_main.jpg',
  '["https://example.com/resorts/oahu/1040_1.jpg", "https://example.com/resorts/oahu/1040_2.jpg", "https://example.com/resorts/oahu/1040_3.jpg", "https://example.com/resorts/oahu/1040_4.jpg", "https://example.com/resorts/oahu/1040_5.jpg", "https://example.com/resorts/oahu/1040_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1040,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1041',
  'oahu',
  '쉐라톤 프린세스 카이울라니',
  '쉐라톤 프린세스 카이울라니',
  '리조트',
  '쉐라톤 프린세스 카이울라니 - 프리미엄 리조트',
  'https://example.com/resorts/oahu/1041_main.jpg',
  '["https://example.com/resorts/oahu/1041_1.jpg", "https://example.com/resorts/oahu/1041_2.jpg", "https://example.com/resorts/oahu/1041_3.jpg", "https://example.com/resorts/oahu/1041_4.jpg", "https://example.com/resorts/oahu/1041_5.jpg", "https://example.com/resorts/oahu/1041_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1041,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1042',
  'oahu',
  '트럼프',
  '트럼프',
  '리조트',
  '트럼프 - 프리미엄 리조트',
  'https://example.com/resorts/oahu/1042_main.jpg',
  '["https://example.com/resorts/oahu/1042_1.jpg", "https://example.com/resorts/oahu/1042_2.jpg", "https://example.com/resorts/oahu/1042_3.jpg", "https://example.com/resorts/oahu/1042_4.jpg", "https://example.com/resorts/oahu/1042_5.jpg", "https://example.com/resorts/oahu/1042_6.jpg", "https://example.com/resorts/oahu/1042_7.jpg", "https://example.com/resorts/oahu/1042_8.jpg", "https://example.com/resorts/oahu/1042_9.jpg", "https://example.com/resorts/oahu/1042_10.jpg", "https://example.com/resorts/oahu/1042_11.jpg", "https://example.com/resorts/oahu/1042_12.jpg", "https://example.com/resorts/oahu/1042_13.jpg"]'::jsonb,
  '[]'::jsonb,
  1042,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1043',
  'oahu',
  '힐튼 하와이언 빌리지',
  '힐튼 하와이언 빌리지',
  '리조트',
  '힐튼 하와이언 빌리지 - 프리미엄 리조트',
  'https://example.com/resorts/oahu/1043_main.jpg',
  '["https://example.com/resorts/oahu/1043_1.jpg", "https://example.com/resorts/oahu/1043_2.jpg", "https://example.com/resorts/oahu/1043_3.jpg", "https://example.com/resorts/oahu/1043_4.jpg", "https://example.com/resorts/oahu/1043_5.jpg", "https://example.com/resorts/oahu/1043_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1043,
  true,
  NOW(),
  NOW()
);

-- 파타야 (pattaya) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1044',
  'pattaya',
  '쉐라톤',
  '쉐라톤',
  '리조트',
  '쉐라톤 - 프리미엄 리조트',
  'https://example.com/resorts/pattaya/1044_main.jpg',
  '["https://example.com/resorts/pattaya/1044_1.jpg"]'::jsonb,
  '[]'::jsonb,
  1044,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1045',
  'pattaya',
  '자인',
  '자인',
  '리조트',
  '자인 - 프리미엄 리조트',
  'https://example.com/resorts/pattaya/1045_main.jpg',
  '["https://example.com/resorts/pattaya/1045_1.jpg", "https://example.com/resorts/pattaya/1045_2.jpg", "https://example.com/resorts/pattaya/1045_3.jpg"]'::jsonb,
  '[]'::jsonb,
  1045,
  true,
  NOW(),
  NOW()
);

-- 푸켓 (phuket) 리조트
--------------------------------------------------------------
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1046',
  'phuket',
  '노보텔 까말라',
  '노보텔 까말라',
  '리조트',
  '노보텔 까말라 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1046_main.jpg',
  '["https://example.com/resorts/phuket/1046_1.jpg", "https://example.com/resorts/phuket/1046_2.jpg", "https://example.com/resorts/phuket/1046_3.jpg", "https://example.com/resorts/phuket/1046_4.jpg", "https://example.com/resorts/phuket/1046_5.jpg", "https://example.com/resorts/phuket/1046_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1046,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1047',
  'phuket',
  '라플로라 파통',
  '라플로라 파통',
  '리조트',
  '라플로라 파통 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1047_main.jpg',
  '["https://example.com/resorts/phuket/1047_1.jpg", "https://example.com/resorts/phuket/1047_2.jpg", "https://example.com/resorts/phuket/1047_3.jpg", "https://example.com/resorts/phuket/1047_4.jpg", "https://example.com/resorts/phuket/1047_5.jpg", "https://example.com/resorts/phuket/1047_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1047,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1048',
  'phuket',
  '반다라 빌라스',
  '반다라 빌라스',
  '리조트',
  '반다라 빌라스 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1048_main.jpg',
  '["https://example.com/resorts/phuket/1048_1.jpg", "https://example.com/resorts/phuket/1048_2.jpg", "https://example.com/resorts/phuket/1048_3.jpg", "https://example.com/resorts/phuket/1048_4.jpg", "https://example.com/resorts/phuket/1048_5.jpg", "https://example.com/resorts/phuket/1048_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1048,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1049',
  'phuket',
  '센타라 빌라스 푸켓',
  '센타라 빌라스 푸켓',
  '리조트',
  '센타라 빌라스 푸켓 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1049_main.jpg',
  '["https://example.com/resorts/phuket/1049_1.jpg", "https://example.com/resorts/phuket/1049_2.jpg", "https://example.com/resorts/phuket/1049_3.jpg", "https://example.com/resorts/phuket/1049_4.jpg", "https://example.com/resorts/phuket/1049_5.jpg", "https://example.com/resorts/phuket/1049_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1049,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1050',
  'phuket',
  '웨스턴',
  '웨스턴',
  '리조트',
  '웨스턴 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1050_main.jpg',
  '["https://example.com/resorts/phuket/1050_1.jpg", "https://example.com/resorts/phuket/1050_2.jpg", "https://example.com/resorts/phuket/1050_3.jpg", "https://example.com/resorts/phuket/1050_4.jpg", "https://example.com/resorts/phuket/1050_5.jpg", "https://example.com/resorts/phuket/1050_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1050,
  true,
  NOW(),
  NOW()
);
INSERT INTO resorts (
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1051',
  'phuket',
  '윈덤 그랜드',
  '윈덤 그랜드',
  '리조트',
  '윈덤 그랜드 - 프리미엄 리조트',
  'https://example.com/resorts/phuket/1051_main.jpg',
  '["https://example.com/resorts/phuket/1051_1.jpg", "https://example.com/resorts/phuket/1051_2.jpg", "https://example.com/resorts/phuket/1051_3.jpg", "https://example.com/resorts/phuket/1051_4.jpg", "https://example.com/resorts/phuket/1051_5.jpg", "https://example.com/resorts/phuket/1051_6.jpg"]'::jsonb,
  '[]'::jsonb,
  1051,
  true,
  NOW(),
  NOW()
);