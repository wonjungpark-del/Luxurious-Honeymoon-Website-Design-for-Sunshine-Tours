-- ==========================================
-- 리조트 데이터 UPSERT SQL (INSERT OR UPDATE)
-- 실제 Vercel Blob 이미지 URL 사용
-- ==========================================

INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1000',
  'region-bali',
  '반얀트리',
  '반얀트리',
  '리조트',
  '반얀트리 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016441141-pn2fme.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016442125-4w1vh.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016442707-fjca.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016443277-jufsm.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016444081-c7qozk.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016444493-1mz6hm.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016445057-ys70u.jpg"]'::jsonb,
  '[]'::jsonb,
  1000,
  true,
  NOW(),
  NOW()
);

-- 발리: 아야나
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1001',
  'region-bali',
  '아야나',
  '아야나',
  '리조트',
  '아야나 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016445750-pvkka.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016446514-w3cv9.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016447563-htsi4l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016448455-tvlsxl.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016449247-40put.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016449963-e1cpic.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016450948-95p9q6.jpg"]'::jsonb,
  '[]'::jsonb,
  1001,
  true,
  NOW(),
  NOW()
);

-- 발리: 알란드라 짐바란
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1002',
  'region-bali',
  '알란드라 짐바란',
  '알란드라 짐바란',
  '리조트',
  '알란드라 짐바란 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016451953-xhmxcf.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016452601-odz9wa.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016453464-4yzfz.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016454391-cq76c8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016455864-72w4m.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016456519-jibbo.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016456863-4yu3mr.jpg"]'::jsonb,
  '[]'::jsonb,
  1002,
  true,
  NOW(),
  NOW()
);

-- 발리: 포시즌
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1003',
  'region-bali',
  '포시즌',
  '포시즌',
  '리조트',
  '포시즌 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016457552-qc287d.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016458134-9rgbbg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016459000-weapms.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016459581-r90d1i.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016460030-ih76cj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016461234-1cesgs.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016462172-0xtd7.jpg"]'::jsonb,
  '[]'::jsonb,
  1003,
  true,
  NOW(),
  NOW()
);

-- 빅아일랜드: 쉐라톤코나
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1004',
  'region-hawaii-bigisland',
  '쉐라톤코나',
  '쉐라톤코나',
  '리조트',
  '쉐라톤코나 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016463016-ok3egn.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016463717-edjr8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016464423-3b5wyg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016465156-dhy027.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016465950-6l7dsw.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016466820-n0wx4f.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016467508-fnmngq.jpg"]'::jsonb,
  '[]'::jsonb,
  1004,
  true,
  NOW(),
  NOW()
);

-- 칸쿤: 멜로디메이커
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1005',
  'region-cancun',
  '멜로디메이커',
  '멜로디메이커',
  '리조트',
  '멜로디메이커 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016468170-hs6b9h.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016468898-2xt4r.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016469497-jq8we6.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016470115-o0vbbn.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016470672-jfu17.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016471356-yiddj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016471860-gbsm2.jpg"]'::jsonb,
  '[]'::jsonb,
  1005,
  true,
  NOW(),
  NOW()
);

-- 칸쿤: 선 팰리스
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1006',
  'region-cancun',
  '선 팰리스',
  '선 팰리스',
  '리조트',
  '선 팰리스 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016472257-thzyj.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016472667-aot1ss.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016473017-y8ar.jpg"]'::jsonb,
  '[]'::jsonb,
  1006,
  true,
  NOW(),
  NOW()
);

-- 칸쿤: 시크릿더바인
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1007',
  'region-cancun',
  '시크릿더바인',
  '시크릿더바인',
  '리조트',
  '시크릿더바인 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016473661-93nbjo.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016474316-cocs4k.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016475014-pgdro8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016475850-gckzno.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016476534-0i3zbh.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016477280-nngdq.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016477878-3zyaus.jpg"]'::jsonb,
  '[]'::jsonb,
  1007,
  true,
  NOW(),
  NOW()
);

-- 칸쿤: 파라디수스 칸쿤
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1008',
  'region-cancun',
  '파라디수스 칸쿤',
  '파라디수스 칸쿤',
  '리조트',
  '파라디수스 칸쿤 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016478678-ntw9d9.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016479500-by5afe.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016480357-i5oxtu.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016481090-ra6c8j.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016481884-xwcim.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016482726-tput6v.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016483802-xrjb5m.jpg"]'::jsonb,
  '[]'::jsonb,
  1008,
  true,
  NOW(),
  NOW()
);

-- 칸쿤: 하얏트지바
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1009',
  'region-cancun',
  '하얏트지바',
  '하얏트지바',
  '리조트',
  '하얏트지바 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016485065-1m34v.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016485686-hx4jzf.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016486398-gnhphm.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016487058-znp9x4.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016487537-99ub4t.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016488166-lei6on.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016488766-3zv8pd.jpg"]'::jsonb,
  '[]'::jsonb,
  1009,
  true,
  NOW(),
  NOW()
);

-- 두바이: 디바나 플라자
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1010',
  'region-dubai',
  '디바나 플라자',
  '디바나 플라자',
  '리조트',
  '디바나 플라자 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016489380-gm20db.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016490043-mhfqma.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016490695-nnh98v.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016491199-yfi2nd.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016491936-mmlyyi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016492640-x6rj04.jpg"]'::jsonb,
  '[]'::jsonb,
  1010,
  true,
  NOW(),
  NOW()
);

-- 두바이: 리치칼튼
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1011',
  'region-dubai',
  '리치칼튼',
  '리치칼튼',
  '리조트',
  '리치칼튼 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016492995-yy82ce.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016493319-7qfn7.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016493990-ul9ij.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016494374-9qdux.jpg"]'::jsonb,
  '[]'::jsonb,
  1011,
  true,
  NOW(),
  NOW()
);

-- 두바이: 피말라이
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1012',
  'region-dubai',
  '피말라이',
  '피말라이',
  '리조트',
  '피말라이 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016494722-5lgtdj.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016495213-e28ks.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016495536-79ifxj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016495892-ptsmsl.jpg"]'::jsonb,
  '[]'::jsonb,
  1012,
  true,
  NOW(),
  NOW()
);

-- 카오락: JW
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1013',
  'region-thailand-khao-lak',
  'JW',
  'JW',
  '리조트',
  'JW - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016496243-slzbsu.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016496642-zw7isq.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016496964-t6fbnd.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016497280-f8pfjah.jpg"]'::jsonb,
  '[]'::jsonb,
  1013,
  true,
  NOW(),
  NOW()
);

-- 카오락: 라벨라
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1014',
  'region-thailand-khao-lak',
  '라벨라',
  '라벨라',
  '리조트',
  '라벨라 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016497823-m7jd7e.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016498291-l5mtkd.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016498817-fg9fyc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016499446-mhfbsp.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016499916-b6zpm.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016500372-1p7dkt.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016500775-1n6az6.jpg"]'::jsonb,
  '[]'::jsonb,
  1014,
  true,
  NOW(),
  NOW()
);

-- 카오락: 로빈슨
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1015',
  'region-thailand-khao-lak',
  '로빈슨',
  '로빈슨',
  '리조트',
  '로빈슨 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016501407-ei202w.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016501998-z9l50b.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016502626-v4pw5a.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016503184-8sgi5q.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016503690-wdj5f3.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016504201-e1mqqw.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016504732-8r0lcf.jpg"]'::jsonb,
  '[]'::jsonb,
  1015,
  true,
  NOW(),
  NOW()
);

-- 카오락: 마이카오락
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1016',
  'region-thailand-khao-lak',
  '마이카오락',
  '마이카오락',
  '리조트',
  '마이카오락 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016505377-r4dto.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016506139-ntpx0s.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016506982-y7sv9l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016507489-m81oz.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016507920-jah1hi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016508380-0naoz3.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016508904-b1ecci.jpg"]'::jsonb,
  '[]'::jsonb,
  1016,
  true,
  NOW(),
  NOW()
);

-- 카오락: 비욘드
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1017',
  'region-thailand-khao-lak',
  '비욘드',
  '비욘드',
  '리조트',
  '비욘드 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016509424-lgspci.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016510792-1dmuuc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016511677-c88uj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016512768-o73f7p.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016513850-6r8ek5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016514792-iq0jf.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016515518-b3wcil.jpg"]'::jsonb,
  '[]'::jsonb,
  1017,
  true,
  NOW(),
  NOW()
);

-- 카오락: 센마이리조트
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1018',
  'region-thailand-khao-lak',
  '센마이리조트',
  '센마이리조트',
  '리조트',
  '센마이리조트 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016516335-qbrzpg.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016517085-qyggl.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016517637-qa7v7.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016518233-l6k0l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016518748-x7r1pl.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016519207-fi20oj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016519682-ca2hkr.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016520148-2g4z9x.jpg"]'::jsonb,
  '[]'::jsonb,
  1018,
  true,
  NOW(),
  NOW()
);

-- 카오락: 에덴비치
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1019',
  'region-thailand-khao-lak',
  '에덴비치',
  '에덴비치',
  '리조트',
  '에덴비치 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016520822-zm8tdg.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016521566-gr0ycc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016522300-l10do.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016522907-nj5jqi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016523490-0upm3h.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016524045-swsf.jpg"]'::jsonb,
  '[]'::jsonb,
  1019,
  true,
  NOW(),
  NOW()
);

-- 코사무이: 더사란
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1020',
  'region-thailand-koh-samui',
  '더사란',
  '더사란',
  '리조트',
  '더사란 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016524544-vj8sef.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016525157-3blwl8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016526026-notc6a.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016526682-oc2d328.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016527410-ndjhn.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016528022-hqzd3.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016528535-t9b4nny.jpg"]'::jsonb,
  '[]'::jsonb,
  1020,
  true,
  NOW(),
  NOW()
);

-- 코사무이: 반얀트리
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1021',
  'region-thailand-koh-samui',
  '반얀트리',
  '반얀트리',
  '리조트',
  '반얀트리 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016529265-re7bkh.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016529854-pasw8h.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016530546-ekvw2.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016531229-6204z.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016531855-h8ata.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016532420-10b6h.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016532939-zaumzq.jpg"]'::jsonb,
  '[]'::jsonb,
  1021,
  true,
  NOW(),
  NOW()
);

-- 코사무이: 인터콘티넨탈
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1022',
  'region-thailand-koh-samui',
  '인터콘티넨탈',
  '인터콘티넨탈',
  '리조트',
  '인터콘티넨탈 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016533637-m89j1.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016534334-wzrkuv.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016534864-vo5e5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016535278-1vh8o5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016535808-009efx.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016536646-ehnuoe.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016537300-omiai.jpg"]'::jsonb,
  '[]'::jsonb,
  1022,
  true,
  NOW(),
  NOW()
);

-- 코사무이: 키리카얀
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1023',
  'region-thailand-koh-samui',
  '키리카얀',
  '키리카얀',
  '리조트',
  '키리카얀 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016538027-dydupk.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016538700-hwr3a.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016539322-l8qzae.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016539972-91t9kp.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016540512-b8ajfa.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016541155-gd66o4.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016541765-ihj1ui.jpg"]'::jsonb,
  '[]'::jsonb,
  1023,
  true,
  NOW(),
  NOW()
);

-- 코사무이: 포시즌리조트
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1024',
  'region-thailand-koh-samui',
  '포시즌리조트',
  '포시즌리조트',
  '리조트',
  '포시즌리조트 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016542338-3fwb.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016542990-8yz349.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016543618-u058bi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016544202-ec5l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016544752-aspv59.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016545622-fwy18u.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016546296-7cnac.jpg"]'::jsonb,
  '[]'::jsonb,
  1024,
  true,
  NOW(),
  NOW()
);

-- 롬복: 수다말라
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1025',
  'region-lombok',
  '수다말라',
  '수다말라',
  '리조트',
  '수다말라 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016546709-cpps1a.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016547068-kk37ji.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016547402-upur0d.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016547723-cjcftth.jpg"]'::jsonb,
  '[]'::jsonb,
  1025,
  true,
  NOW(),
  NOW()
);

-- 롬복: 옴박
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1026',
  'region-lombok',
  '옴박',
  '옴박',
  '리조트',
  '옴박 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016548395-y1utv.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016549136-kl0lcg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016549833-wmos1.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016550457-9c3ugo.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016551244-xgin1i.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016551861-wc1v3t.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016552454-f54jft.jpg"]'::jsonb,
  '[]'::jsonb,
  1026,
  true,
  NOW(),
  NOW()
);

-- 롬복: 푸리마스
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1027',
  'region-lombok',
  '푸리마스',
  '푸리마스',
  '리조트',
  '푸리마스 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016552812-uts187.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016553137-gii96m.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016553474-hzkkrh.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016553819-y597cg.jpg"]'::jsonb,
  '[]'::jsonb,
  1027,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 길리랑칸푸쉬
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1028',
  'region-maldives',
  '길리랑칸푸쉬',
  '길리랑칸푸쉬',
  '리조트',
  '길리랑칸푸쉬 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016554193-sb9tcb.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016555048-ugxz8l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016555782-351tr.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016557587-pz67k.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016558278-4fb4qr.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016559987-i6bi3i.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016561926-pfht1g.jpg"]'::jsonb,
  '[]'::jsonb,
  1028,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 바두
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1029',
  'region-maldives',
  '바두',
  '바두',
  '리조트',
  '바두 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016562562-026exq.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016563141-pfx5c.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016563739-g6mcca.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016564351-v4bbwv.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016564982-95fp9a.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016565712-f6p1u8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016566270-wbk46m.jpg"]'::jsonb,
  '[]'::jsonb,
  1029,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 벨라사루 리조트
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1030',
  'region-maldives',
  '벨라사루 리조트',
  '벨라사루 리조트',
  '리조트',
  '벨라사루 리조트 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016566969-eeakqk.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016567880-36iold.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016568726-xcjaae.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016569493-klxc2.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016570119-9n8iu.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016570734-a30d6.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016571433-rz731m.jpg"]'::jsonb,
  '[]'::jsonb,
  1030,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 소바자니
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1031',
  'region-maldives',
  '소바자니',
  '소바자니',
  '리조트',
  '소바자니 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016571975-7hqtn.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016572750-l4w7v5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016573447-250f78.jpg"]'::jsonb,
  '[]'::jsonb,
  1031,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 시나몬 돈벨리
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1032',
  'region-maldives',
  '시나몬 돈벨리',
  '시나몬 돈벨리',
  '리조트',
  '시나몬 돈벨리 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016574090-1r911p.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016575027-img5g7.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016575816-gr2hrr.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016576529-dzvb8e.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016577172-1b43zn.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016577870-zxu1j.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016578558-6oyure.jpg"]'::jsonb,
  '[]'::jsonb,
  1032,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 아다아란 프레스티지 오션빌라 & 후두란푸시
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1033',
  'region-maldives',
  '아다아란 프레스티지 오션빌라 & 후두란푸시',
  '아다아란 프레스티지 오션빌라 & 후두란푸시',
  '리조트',
  '아다아란 프레스티지 오션빌라 & 후두란푸시 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016579054-w8z0x.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016579542-2ysup.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016580019-ki296.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016580459-v2ef6l.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016580942-u6qqy.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016581438-zeplzg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016582069-wnn1y.jpg"]'::jsonb,
  '[]'::jsonb,
  1033,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 오블루
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1034',
  'region-maldives',
  '오블루',
  '오블루',
  '리조트',
  '오블루 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016582520-k54q05.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016583024-f0pm5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016583635-ggcvfi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016584143-nqapjd.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016584664-x4jwh.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016585271-6k3il.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016585897-9p3s7c.jpg"]'::jsonb,
  '[]'::jsonb,
  1034,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 칸두마
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1035',
  'region-maldives',
  '칸두마',
  '칸두마',
  '리조트',
  '칸두마 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016586350-fwty1k.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016586813-c36ow.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016587328-g7dx05.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016587747-hl6iko.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016588153-4tsf3g.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016588567-h2jll3.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016589335-ihshr8.jpg"]'::jsonb,
  '[]'::jsonb,
  1035,
  true,
  NOW(),
  NOW()
);

-- 몰디브: 코코팜 보두히티
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1036',
  'region-maldives',
  '코코팜 보두히티',
  '코코팜 보두히티',
  '리조트',
  '코코팜 보두히티 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016589828-uiodyu.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016590546-js8h1e.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016591114-yu9fb.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016591580-an6r4b.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016592012-284p5h.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016592405-vhf9x.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016592770-yy18v.jpg"]'::jsonb,
  '[]'::jsonb,
  1036,
  true,
  NOW(),
  NOW()
);

-- 마우이: 쉐라톤마우이 리조트
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1037',
  'region-hawaii-maui',
  '쉐라톤마우이 리조트',
  '쉐라톤마우이 리조트',
  '리조트',
  '쉐라톤마우이 리조트 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016593318-p91r6.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016593924-7x3vr.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016594458-2opdjm.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016595107-98bb5.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016595844-23mhik.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016596753-9whppi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016597519-oj42zb.jpg"]'::jsonb,
  '[]'::jsonb,
  1037,
  true,
  NOW(),
  NOW()
);

-- 마우이: 웨스틴마우이 리조트
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1038',
  'region-hawaii-maui',
  '웨스틴마우이 리조트',
  '웨스틴마우이 리조트',
  '리조트',
  '웨스틴마우이 리조트 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016598398-6ve5l5.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016599106-vihjla.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016599958-cvmi2.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016600834-vdxo9.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016601652-q6gz1w.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016602346-nj1cxk.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016603019-74pm7k.jpg"]'::jsonb,
  '[]'::jsonb,
  1038,
  true,
  NOW(),
  NOW()
);

-- 마우이: 하얏트리젠시 마우이
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1039',
  'region-hawaii-maui',
  '하얏트리젠시 마우이',
  '하얏트리젠시 마우이',
  '리조트',
  '하얏트리젠시 마우이 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016603771-si5r0m.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016604447-vonl6r.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016605174-48o6w8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016605813-aclszd.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016606465-9xvt5e.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016607173-trddqe.jpg"]'::jsonb,
  '[]'::jsonb,
  1039,
  true,
  NOW(),
  NOW()
);

-- 오아후: 쉐라톤 와이키키
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1040',
  'region-hawaii-oahu',
  '쉐라톤 와이키키',
  '쉐라톤 와이키키',
  '리조트',
  '쉐라톤 와이키키 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016607765-few1v9.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016608281-4zuzv.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016608851-i30s1q.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016609465-c9fjidc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016610008-clca98.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016610465-0u9p8j.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016610927-zphx8e.jpg"]'::jsonb,
  '[]'::jsonb,
  1040,
  true,
  NOW(),
  NOW()
);

-- 오아후: 쉐라톤 프린세스 카이울라니
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1041',
  'region-hawaii-oahu',
  '쉐라톤 프린세스 카이울라니',
  '쉐라톤 프린세스 카이울라니',
  '리조트',
  '쉐라톤 프린세스 카이울라니 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016611601-fyf2fc.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016612229-odt93a.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016612834-btvsok.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016613446-er2zxe.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016613993-mie3f.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016614590-44edcf.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016615153-9njvnl.jpg"]'::jsonb,
  '[]'::jsonb,
  1041,
  true,
  NOW(),
  NOW()
);

-- 오아후: 트럼프
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1042',
  'region-hawaii-oahu',
  '트럼프',
  '트럼프',
  '리조트',
  '트럼프 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016615960-cuzvta.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016616637-h5w5od.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016617243-0yhecu.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016617892-yimty4j.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016618632-ivlvvg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016619281-tg484y.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016619891-6oxifj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016620933-ntx6c.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016621973-7flu2r.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016622982-v2omvj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016624290-n909yt.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016625496-w4js.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016626275-cnrsr8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016627036-mpt76e.jpg"]'::jsonb,
  '[]'::jsonb,
  1042,
  true,
  NOW(),
  NOW()
);

-- 오아후: 힐튼 하와이언 빌리지
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1043',
  'region-hawaii-oahu',
  '힐튼 하와이언 빌리지',
  '힐튼 하와이언 빌리지',
  '리조트',
  '힐튼 하와이언 빌리지 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016627717-vc80pn.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016628405-ims4yf.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016629090-youkg.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016629738-aiyfop.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016630367-380z7g.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016631021-aacp4q.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016631803-f9bc14.jpg"]'::jsonb,
  '[]'::jsonb,
  1043,
  true,
  NOW(),
  NOW()
);

-- 파타야: 쉐라톤
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1044',
  'region-thailand-pattaya',
  '쉐라톤',
  '쉐라톤',
  '리조트',
  '쉐라톤 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016632152-6c6p2a.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016632532-5ognl.jpg"]'::jsonb,
  '[]'::jsonb,
  1044,
  true,
  NOW(),
  NOW()
);

-- 파타야: 자인
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1045',
  'region-thailand-pattaya',
  '자인',
  '자인',
  '리조트',
  '자인 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016632874-vxlnh.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016633204-kd704h.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016633519-pw3k4e.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016633837-ji5uxk.jpg"]'::jsonb,
  '[]'::jsonb,
  1045,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 노보텔 까말라
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1046',
  'region-thailand-phuket',
  '노보텔 까말라',
  '노보텔 까말라',
  '리조트',
  '노보텔 까말라 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016634577-r2rysm.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016635242-qywfz.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016635955-6r254b.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016636488-t0qape.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016637152-d4pulq.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016637867-6k1786.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016638442-19z9y.jpg"]'::jsonb,
  '[]'::jsonb,
  1046,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 라플로라 파통
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1047',
  'region-thailand-phuket',
  '라플로라 파통',
  '라플로라 파통',
  '리조트',
  '라플로라 파통 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016639003-pbwgwj.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016639481-8j2lbw.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016639925-tpb5pi.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016640375-z7sf5f.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016640830-rtln37.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016641286-f1v28i.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016641821-vmwrl9.jpg"]'::jsonb,
  '[]'::jsonb,
  1047,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 반다라 빌라스
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1048',
  'region-thailand-phuket',
  '반다라 빌라스',
  '반다라 빌라스',
  '리조트',
  '반다라 빌라스 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016642376-5rszb2.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016642989-v5vtj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016643521-nkkrn5o.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016644180-oewmke.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016644716-lwaghu.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016645428-e1cv3r.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016646005-zvhvh6.jpg"]'::jsonb,
  '[]'::jsonb,
  1048,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 센타라 빌라스 푸켓
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1049',
  'region-thailand-phuket',
  '센타라 빌라스 푸켓',
  '센타라 빌라스 푸켓',
  '리조트',
  '센타라 빌라스 푸켓 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016646741-d0oh89.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016647492-1oa92.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016648317-5tmog.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016649117-q3xifj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016649742-jez8y2.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016650361-ks5hhsf.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016650996-b3irj.jpg"]'::jsonb,
  '[]'::jsonb,
  1049,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 웨스턴
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1050',
  'region-thailand-phuket',
  '웨스턴',
  '웨스턴',
  '리조트',
  '웨스턴 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016651568-x35hgn.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016652240-j18wm7.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016652883-2ay11v.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016653503-mom4gc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016654022-eu3r3i.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016654489-5nk1hc.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016654926-lf311.jpg"]'::jsonb,
  '[]'::jsonb,
  1050,
  true,
  NOW(),
  NOW()
);

-- 푸켓: 윈덤 그랜드
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();


INSERT INTO resorts(
  id, region_id, name_ko, name_en, 
  category, description, 
  main_image_url, gallery_images, 
  features, display_order, is_active, 
  created_at, updated_at
) VALUES (
  'resort-1051',
  'region-thailand-phuket',
  '윈덤 그랜드',
  '윈덤 그랜드',
  '리조트',
  '윈덤 그랜드 - 프리미엄 허니문 리조트',
  'https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016655767-n36y0s.jpg',
  '["https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016656744-2vzehh.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016657633-mgb1gk.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016658900-hccbuj.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016659940-1bopjk.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016660775-ir5vu8.jpg", "https://atntzsryivyk2c4y.public.blob.vercel-storage.com/1767016661469-hkf6.jpg"]'::jsonb,
  '[]'::jsonb,
  1051,
  true,
  NOW(),
  NOW()
);
ON CONFLICT (id) DO UPDATE SET
  region_id = EXCLUDED.region_id,
  name_ko = EXCLUDED.name_ko,
  name_en = EXCLUDED.name_en,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  main_image_url = EXCLUDED.main_image_url,
  gallery_images = EXCLUDED.gallery_images,
  features = EXCLUDED.features,
  display_order = EXCLUDED.display_order,
  is_active = EXCLUDED.is_active,
  updated_at = NOW();

