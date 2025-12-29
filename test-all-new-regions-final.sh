#!/bin/bash

echo "=== 새 지역 페이지 최종 테스트 ==="
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

# Test each new region
for region in cancun boracay cebu palawan maldives mauritius; do
    echo "📍 $region..."
    
    # Check page exists
    status=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$region")
    echo "   Status: $status"
    
    # Get region ID from API
    case $region in
        cancun) region_id="region-cancun" ;;
        boracay) region_id="region-philippines-boracay" ;;
        cebu) region_id="region-philippines-cebu" ;;
        palawan) region_id="region-philippines-palawan" ;;
        maldives) region_id="region-maldives" ;;
        mauritius) region_id="region-mauritius" ;;
    esac
    
    # Check resorts API
    resorts=$(curl -s "$BASE_URL/api/resorts?region_id=$region_id")
    count=$(echo $resorts | jq -r '.data | length')
    
    if [ "$count" -gt 0 ]; then
        echo "   리조트: $count개"
        echo $resorts | jq -r '.data[] | "   - \(.name_ko) (갤러리: \(.gallery_images | length)개)"'
    else
        echo "   ⚠️  리조트 없음"
    fi
    
    echo ""
done

echo "✅ 테스트 완료!"
