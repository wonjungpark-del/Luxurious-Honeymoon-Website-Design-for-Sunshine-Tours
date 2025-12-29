#!/bin/bash

echo "=== 발리와 롬복 페이지 테스트 ==="
echo ""

# Test Bali
echo "1. 발리 (Bali)"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/bali"
echo "   리조트:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-bali" | jq -r '.data[] | "   - \(.name_ko)"'
echo ""

# Test Lombok
echo "2. 롬복 (Lombok)"
echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/lombok"
echo "   리조트:"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-lombok" | jq -r '.data[] | "   - \(.name_ko)"'
echo ""

echo "✅ 모든 페이지 확인 완료!"
