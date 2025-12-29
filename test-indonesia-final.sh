#!/bin/bash

echo "============================================"
echo "🇮🇩 인도네시아 페이지 최종 테스트"
echo "============================================"
echo ""
echo "📍 새 URL: https://luxurious-honeymoon-website-design.vercel.app/indonesia"
echo ""

# Test page accessibility
echo "1️⃣ 페이지 접근 테스트..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://luxurious-honeymoon-website-design.vercel.app/indonesia")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ 페이지 정상 접근 (HTTP $HTTP_CODE)"
else
    echo "   ❌ 페이지 접근 실패 (HTTP $HTTP_CODE)"
fi
echo ""

# Test Bali section
echo "2️⃣ 발리 리조트 섹션:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "   ✓ \(.name_ko) - 갤러리 \(.gallery_images | length)개, 특징 \(.features | length)개"'
echo ""

# Test Lombok section  
echo "3️⃣ 롬복 리조트 섹션:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "   ✓ \(.name_ko) - 갤러리 \(.gallery_images | length)개, 특징 \(.features | length)개"'
echo ""

echo "============================================"
echo "✅ 모든 테스트 완료!"
echo ""
echo "📝 확인 사항:"
echo "   • 홈페이지에서 '인도네시아 (발리 & 롬복)' 링크 확인"
echo "   • /indonesia 페이지에서 발리와 롬복 섹션 분리"
echo "   • 각 리조트의 갤러리 6개 이미지 표시"
echo "   • 각 리조트의 특징 4개 표시"
echo "============================================"
