#!/bin/bash

echo "=== 새 지역 페이지 테스트 ==="
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

# Test each new region
for region in cancun boracay cebu palawan maldives mauritius; do
    echo "📍 Testing $region page..."
    
    # Check page exists
    status=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$region")
    echo "   Page status: $status"
    
    # Get region ID from API
    case $region in
        cancun) region_id="region-cancun" ;;
        boracay) region_id="region-boracay" ;;
        cebu) region_id="region-cebu" ;;
        palawan) region_id="region-palawan" ;;
        maldives) region_id="region-maldives" ;;
        mauritius) region_id="region-mauritius" ;;
    esac
    
    # Check resorts API
    resorts=$(curl -s "$BASE_URL/api/resorts?region_id=$region_id")
    count=$(echo $resorts | jq -r '.data | length')
    echo "   Resorts: $count"
    
    if [ "$count" -gt 0 ]; then
        echo $resorts | jq -r '.data[] | "   - \(.name_ko)"'
    fi
    
    echo ""
done

echo "✅ 모든 지역 테스트 완료!"
