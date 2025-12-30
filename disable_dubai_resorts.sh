#!/bin/bash

API_URL="https://luxurious-honeymoon-website-design.vercel.app/api/resorts"
RESORT_IDS=("resort-1010" "resort-1011" "resort-1012")

echo "=== 두바이 리조트 비활성화 시작 ==="

for resort_id in "${RESORT_IDS[@]}"; do
    echo "비활성화 중: $resort_id"
    
    response=$(curl -s -X PUT "$API_URL" \
        -H "Content-Type: application/json" \
        -d "{
            \"id\": \"$resort_id\",
            \"is_active\": false
        }")
    
    if echo "$response" | grep -q '"success":true'; then
        echo "✅ $resort_id 비활성화 성공"
    else
        echo "❌ $resort_id 비활성화 실패"
        echo "Response: $response"
    fi
    
    sleep 1
done

echo ""
echo "=== 작업 완료 ==="
