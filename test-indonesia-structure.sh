#!/bin/bash

echo "============================================"
echo "🇮🇩 인도네시아 페이지 구조 테스트"
echo "============================================"
echo ""

# Test main Indonesia page
echo "1️⃣ 메인 페이지 (indonesia.html):"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/indonesia"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://luxurious-honeymoon-website-design.vercel.app/indonesia")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ 페이지 정상 접근 (HTTP $HTTP_CODE)"
else
    echo "   ❌ 페이지 접근 실패 (HTTP $HTTP_CODE)"
fi
echo ""

# Test Bali page
echo "2️⃣ 발리 페이지 (bali.html):"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/bali"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://luxurious-honeymoon-website-design.vercel.app/bali")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ 페이지 정상 접근 (HTTP $HTTP_CODE)"
    echo "   리조트:"
    curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "      • \(.name_ko)"'
else
    echo "   ❌ 페이지 접근 실패 (HTTP $HTTP_CODE)"
fi
echo ""

# Test Lombok page
echo "3️⃣ 롬복 페이지 (lombok.html):"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/lombok"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://luxurious-honeymoon-website-design.vercel.app/lombok")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ 페이지 정상 접근 (HTTP $HTTP_CODE)"
    echo "   리조트:"
    curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "      • \(.name_ko)"'
else
    echo "   ❌ 페이지 접근 실패 (HTTP $HTTP_CODE)"
fi
echo ""

echo "============================================"
echo "✅ 테스트 완료!"
echo ""
echo "📝 페이지 구조:"
echo "   /indonesia      → 메인 페이지 (발리 & 롬복 지역 카드)"
echo "   /bali           → 발리 리조트 페이지"
echo "   /lombok         → 롬복 리조트 페이지"
echo ""
echo "   (태국 페이지와 동일한 구조)"
echo "============================================"
