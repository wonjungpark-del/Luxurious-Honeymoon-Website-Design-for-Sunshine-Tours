#!/bin/bash

echo "🌐 태국 페이지 확인 중..."
echo ""

PAGES=(
  "thailand-koh-samui:코사무이:region-thailand-koh-samui"
  "thailand-krabi:끄라비:region-thailand-krabi"
  "thailand-pattaya:파타야:region-thailand-pattaya"
  "thailand-hua-hin:후아힌:region-thailand-hua-hin"
)

for page in "${PAGES[@]}"; do
  IFS=':' read -r page_name region_name region_id <<< "$page"
  
  echo "🏖️  $region_name 페이지 테스트"
  echo "   URL: https://luxurious-honeymoon-website-design.vercel.app/$page_name"
  
  # Check API data
  response=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=$region_id&is_active=true")
  count=$(echo "$response" | jq -r '.data | length')
  
  if [ "$count" -gt 0 ]; then
    echo "   ✅ API: $count개 리조트"
    echo "$response" | jq -r '.data[] | "      - \(.name_ko)"'
  else
    echo "   ⚠️  API: 리조트 없음"
  fi
  
  echo ""
done

echo "✅ 모든 페이지 확인 완료!"
