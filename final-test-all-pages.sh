#!/bin/bash

echo "🎉 === 최종 테스트: 모든 새 페이지 === 🎉"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

declare -A REGIONS
REGIONS[cancun]="region-cancun"
REGIONS[boracay]="region-philippines-boracay"
REGIONS[cebu]="region-philippines-cebu"
REGIONS[palawan]="region-philippines-palawan"
REGIONS[maldives]="region-maldives"
REGIONS[mauritius]="region-mauritius"

for page in cancun boracay cebu palawan maldives mauritius; do
    echo "📍 Testing $page..."
    
    # 1. Page status
    status=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$page")
    echo "   페이지 상태: $status"
    
    # 2. API data
    region_id="${REGIONS[$page]}"
    resorts=$(curl -s "$BASE_URL/api/resorts?region_id=$region_id")
    count=$(echo $resorts | jq -r '.data | length')
    echo "   리조트 개수: $count개"
    
    if [ "$count" -gt 0 ]; then
        echo $resorts | jq -r '.data[] | "   - \(.name_ko) (카테고리: \(.category), 갤러리: \(.gallery_images | length)개)"'
    fi
    
    # 3. Page content check
    content=$(curl -s "$BASE_URL/$page")
    if echo "$content" | grep -q "resort-card"; then
        echo "   ✅ 리조트 카드 렌더링 성공"
    else
        echo "   ❌ 리조트 카드 렌더링 실패"
    fi
    
    echo ""
done

echo "✅ === 테스트 완료 === ✅"
