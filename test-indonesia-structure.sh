#!/bin/bash

echo "============================================"
echo "🇮🇩 인도네시아 페이지 구조 테스트"
echo "============================================"
echo ""

# Test Indonesia main page
echo "1️⃣ 인도네시아 메인 페이지:"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/indonesia"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://luxurious-honeymoon-website-design.vercel.app/indonesia")
echo "   상태: HTTP $HTTP_CODE"
echo ""

# Test Bali page
echo "2️⃣ 발리 개별 페이지:"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/bali"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "   ✓ \(.name_ko)"'
echo ""

# Test Lombok page
echo "3️⃣ 롬복 개별 페이지:"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/lombok"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "   ✓ \(.name_ko)"'
echo ""

echo "============================================"
echo "✅ 테스트 완료!"
echo ""
echo "📋 페이지 구조:"
echo "   /indonesia → 메인 페이지 (발리/롬복 지역 카드)"
echo "   /bali → 발리 리조트 페이지"
echo "   /lombok → 롬복 리조트 페이지"
echo "============================================"
