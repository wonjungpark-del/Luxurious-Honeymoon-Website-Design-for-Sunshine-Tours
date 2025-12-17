-- Insert regions data from production
INSERT OR REPLACE INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
VALUES
  ('region-thailand-khao-lak', 'thailand-khao-lak', 'thailand', '카오락', 'Khao Lak', '태국 남부 푸켓 북쪽에 위치한 조용한 해변 휴양지. 2004년 쓰나미 이후 완전히 재건되어 더욱 아름다운 리조트들이 들어섰습니다.', '/static/images/regions/khao-lak.jpg', 1, 1, 1702742400000, 1702742400000),
  ('region-thailand-koh-samui', 'thailand-koh-samui', 'thailand', '코사무이', 'Koh Samui', '태국에서 세 번째로 큰 섬으로 야자수 해변과 럭셔리 리조트가 유명합니다.', '/static/images/regions/koh-samui.jpg', 2, 1, 1702742400000, 1702742400000),
  ('region-thailand-phuket', 'thailand-phuket', 'thailand', '푸켓', 'Phuket', '태국 최대의 섬이자 최고의 휴양지. 다양한 해변과 나이트라이프가 발달되어 있습니다.', '/static/images/regions/phuket.jpg', 3, 1, 1702742400000, 1702742400000),
  ('region-thailand-krabi', 'thailand-krabi', 'thailand', '끄라비', 'Krabi', '석회암 절벽과 에메랄드빛 바다가 어우러진 천혜의 자연을 간직한 곳.', '/static/images/regions/krabi.jpg', 4, 1, 1702742400000, 1702742400000),
  ('region-thailand-pattaya', 'thailand-pattaya', 'thailand', '파타야', 'Pattaya', '방콕에서 가까운 해변 휴양 도시. 다양한 액티비티와 엔터테인먼트가 풍부합니다.', '/static/images/regions/pattaya.jpg', 5, 1, 1702742400000, 1702742400000),
  ('region-thailand-hua-hin', 'thailand-hua-hin', 'thailand', '후아힌', 'Hua Hin', '태국 왕실의 휴양지로 유명한 조용하고 고급스러운 해변 도시.', '/static/images/regions/hua-hin.jpg', 6, 1, 1702742400000, 1702742400000),
  ('region-bali', 'bali', 'indonesia', '발리', 'Bali', '신들의 섬이라 불리는 인도네시아 최고의 관광지. 아름다운 해변, 사원, 테라스 논이 유명합니다.', '/static/images/regions/bali.jpg', 10, 1, 1702742400000, 1702742400000),
  ('region-lombok', 'lombok', 'indonesia', '롬복', 'Lombok', '발리 옆의 섬으로 한적하고 자연이 잘 보존된 휴양지.', '/static/images/regions/lombok.jpg', 11, 1, 1702742400000, 1702742400000),
  ('region-boracay', 'boracay', 'philippines', '보라카이', 'Boracay', '하얀 백사장과 맑은 바다로 유명한 필리핀 대표 휴양지.', '/static/images/regions/boracay.jpg', 20, 1, 1702742400000, 1702742400000),
  ('region-cebu-bohol', 'cebu-bohol', 'philippines', '세부/보홀', 'Cebu/Bohol', '필리핀 중부의 아름다운 섬들. 세부는 도시적이고 보홀은 자연이 풍부합니다.', '/static/images/regions/cebu-bohol.jpg', 21, 1, 1702742400000, 1702742400000),
  ('region-palawan', 'palawan', 'philippines', '팔라완', 'Palawan', '세계에서 가장 아름다운 섬으로 선정된 자연의 보고.', '/static/images/regions/palawan.jpg', 22, 1, 1702742400000, 1702742400000),
  ('region-maldives', 'maldives', 'maldives', '몰디브', 'Maldives', '일생에 한 번은 꼭 가야 할 천국의 섬. 수상 빌라와 맑은 바다가 유명합니다.', '/static/images/regions/maldives.jpg', 30, 1, 1702742400000, 1702742400000);
