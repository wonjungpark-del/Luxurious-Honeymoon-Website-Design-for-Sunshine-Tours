#!/bin/bash

echo "🌺 하와이 페이지 확인 중..."
echo ""

PAGES=(
  "maui:마우이:region-hawaii-maui"
  "bigisland:빅아일랜드:region-hawaii-bigisland"
  "oahu:오아후:region-hawaii-oahu"
)

for page in "${PAGES[@]}"; do
  IFS=':' read -r page_name region_name region_id <<< "$page"
  
  echo "🏝️  $region_name 페이지 테스트"
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
