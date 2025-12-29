#!/bin/bash

REGIONS=(
  "region-thailand-phuket:푸켓"
  "region-thailand-koh-samui:코사무이"
  "region-thailand-krabi:끄라비"
  "region-thailand-pattaya:파타야"
  "region-thailand-hua-hin:후아힌"
)

echo "📊 태국 5개 지역 리조트 데이터 확인"
echo "====================================="
echo ""

for region in "${REGIONS[@]}"; do
  IFS=':' read -r region_id region_name <<< "$region"
  
  echo "🏝️  $region_name ($region_id)"
  echo "-----------------------------------"
  
  response=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?region_id=$region_id&is_active=true")
  
  # Count resorts
  count=$(echo "$response" | jq -r '.data | length')
  
  if [ "$count" -gt 0 ]; then
    echo "✅ 리조트 개수: $count개"
    echo "$response" | jq -r '.data[] | "   - \(.name_ko) (\(.name_en))"'
  else
    echo "⚠️  리조트 없음"
  fi
  
  echo ""
done

echo "====================================="
echo "✅ 확인 완료"
