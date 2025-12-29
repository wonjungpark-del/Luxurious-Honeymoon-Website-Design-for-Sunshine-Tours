#!/bin/bash

echo "=== Testing Bali & Lombok Pages ==="
echo ""

# Test Bali
echo "1. Bali (https://luxurious-honeymoon-website-design.vercel.app/bali)"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-indonesia-bali" | jq -r '.data[] | "\(.name_ko)"' | head -5
echo ""

# Test Lombok
echo "2. Lombok (https://luxurious-honeymoon-website-design.vercel.app/lombok)"
curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=region-indonesia-lombok" | jq -r '.data[] | "\(.name_ko)"' | head -5
echo ""

echo "✅ All pages checked!"
