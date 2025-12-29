const { sql } = require('@vercel/postgres');
const fs = require('fs');
const path = require('path');

// Import data from JSON instead of SQL
const resortData = require('../upload_results.json');

module.exports = async function handler(req, res) {
  try {
    // Security: Only allow with special key
    const authKey = req.query.key;
    if (authKey !== 'update-resorts-2024') {
      return res.status(403).json({ 
        success: false, 
        error: 'Unauthorized' 
      });
    }

    if (req.method !== 'POST') {
      return res.status(405).json({ 
        success: false, 
        error: 'Method not allowed' 
      });
    }

    console.log('Starting resort data update from JSON...');

    // Region ID mapping (Korean names to database IDs)
    const regionMapping = {
      '발리': 'region-bali',
      '빅아일랜드': 'region-hawaii-bigisland',
      '칸쿤': 'region-cancun',
      '두바이': 'region-dubai',
      '카오락': 'region-thailand-khao-lak',
      '코사무이': 'region-thailand-koh-samui',
      '롬복': 'region-lombok',
      '몰디브': 'region-maldives',
      '마우이': 'region-hawaii-maui',
      '오아후': 'region-hawaii-oahu',
      '파타야': 'region-thailand-pattaya',
      '푸켓': 'region-thailand-phuket'
    };

    const results = {
      total: 0,
      success: 0,
      failed: 0,
      errors: []
    };

    let resortId = 1000;

    // Process each region from upload results
    for (const item of resortData.success) {
      const regionName = item.region_name; // Use Korean name directly
      const regionId = regionMapping[regionName] || `region-${regionName}`;
      const resortName = item.resort_name;
      const images = item.images || [];

      if (images.length === 0) {
        console.log(`Skipping ${resortName} - no images`);
        continue;
      }

      // Extract URLs from image objects (handle both string and object formats)
      const imageUrls = images.map(img => {
        if (typeof img === 'string') return img;
        if (img && img.url) return img.url;
        return null;
      }).filter(url => url !== null);

      if (imageUrls.length === 0) {
        console.log(`Skipping ${resortName} - no valid image URLs`);
        continue;
      }

      const mainImage = imageUrls[0];
      const galleryImages = imageUrls.slice(1);

      results.total++;

      try {
        console.log(`[${results.total}] Processing: ${resortName} (${regionId})`);

        // UPSERT using @vercel/postgres
        const result = await sql`
          INSERT INTO resorts (
            id, region_id, name_ko, name_en,
            category, description,
            main_image_url, gallery_images,
            features, display_order, is_active,
            created_at, updated_at
          ) VALUES (
            ${'resort-' + resortId},
            ${regionId},
            ${resortName},
            ${resortName},
            '리조트',
            ${resortName + ' - 프리미엄 허니문 리조트'},
            ${mainImage},
            ${JSON.stringify(galleryImages)},
            '[]',
            ${resortId},
            true,
            NOW(),
            NOW()
          )
          ON CONFLICT (id) DO UPDATE SET
            region_id = EXCLUDED.region_id,
            name_ko = EXCLUDED.name_ko,
            name_en = EXCLUDED.name_en,
            main_image_url = EXCLUDED.main_image_url,
            gallery_images = EXCLUDED.gallery_images,
            updated_at = NOW()
        `;

        results.success++;
        console.log(`  ✓ Success: ${resortName}`);
        resortId++;

      } catch (error) {
        results.failed++;
        const errorInfo = {
          resort: resortName,
          region: regionId,
          error: error.message
        };
        results.errors.push(errorInfo);
        console.error(`  ✗ Failed: ${resortName} - ${error.message}`);
      }
    }

    console.log('Resort data update completed');
    console.log(`Success: ${results.success}, Failed: ${results.failed}`);

    return res.status(200).json({
      success: true,
      message: 'Resort data update completed',
      results: results
    });

  } catch (error) {
    console.error('Update resorts error:', error);
    return res.status(500).json({
      success: false,
      error: 'Internal server error',
      details: error.message,
      stack: process.env.NODE_ENV === 'development' ? error.stack : undefined
    });
  }
};
