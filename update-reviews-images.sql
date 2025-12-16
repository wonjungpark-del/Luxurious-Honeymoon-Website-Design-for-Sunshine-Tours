-- 후기에 이미지 URL 추가

-- 몰디브 후기 이미지 (Unsplash 무료 이미지)
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&h=500&fit=crop&q=80' WHERE id = 'review-001';
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800&h=500&fit=crop&q=80' WHERE id = 'review-005';

-- 태국 카오락 후기 이미지
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?w=800&h=500&fit=crop&q=80' WHERE id = 'review-002';
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800&h=500&fit=crop&q=80' WHERE id = 'review-006';

-- 태국 코사무이 후기 이미지
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=800&h=500&fit=crop&q=80' WHERE id = 'review-003';
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&h=500&fit=crop&q=80' WHERE id = 'review-007';

-- 발리 후기 이미지
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&h=500&fit=crop&q=80' WHERE id = 'review-004';
UPDATE reviews SET image_url = 'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800&h=500&fit=crop&q=80' WHERE id = 'review-008';
