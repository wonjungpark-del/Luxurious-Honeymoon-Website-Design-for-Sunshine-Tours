#!/bin/bash

echo "================================================================"
echo "발리, 롬복, 칸쿤 페이지 리조트 로딩 테스트"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

declare -A pages=(
    ["bali"]="발리"
    ["lombok"]="롬복"
    ["cancun"]="칸쿤"
)

for slug in "${!pages[@]}"; do
    name="${pages[$slug]}"
    url="${BASE_URL}/${slug}"
    
    echo "🔍 테스트: $name ($slug)"
    echo "   URL: $url"
    
    # HTTP 상태 확인
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "   HTTP: $status"
    
    # 리조트 카드 개수 확인
    content=$(curl -s "$url")
    resort_count=$(echo "$content" | grep -o "resort-card" | wc -l)
    echo "   리조트 카드: $resort_count개"
    
    # REGION_ID 확인
    region_id=$(echo "$content" | grep "const REGION_ID" | sed "s/.*REGION_ID = '\([^']*\)'.*/\1/")
    echo "   REGION_ID: $region_id"
    
    # API 직접 확인
    echo "   API 테스트: /api/resorts?region_id=$region_id"
    api_result=$(curl -s "${BASE_URL}/api/resorts?region_id=$region_id")
    api_count=$(echo "$api_result" | jq '.data | length' 2>/dev/null)
    echo "   API 응답: $api_count개 리조트"
    
    echo ""
done

echo "================================================================"
echo "✅ 테스트 완료"
echo "================================================================"

