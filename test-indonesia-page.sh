#!/bin/bash

echo "============================================"
echo "🇮🇩 인도네시아 페이지 테스트"
echo "============================================"
echo ""
echo "📍 페이지 URL: https://luxurious-honeymoon-website-design.vercel.app/bali"
echo ""

# Test Bali section
echo "🌴 발리 리조트 섹션:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "   ✓ \(.name_ko) - 갤러리: \(.gallery_images | length)개 이미지"'
echo ""

# Test Lombok section  
echo "🏝️ 롬복 리조트 섹션:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "   ✓ \(.name_ko) - 갤러리: \(.gallery_images | length)개 이미지"'
echo ""

echo "============================================"
echo "✅ 테스트 완료!"
echo "============================================"
