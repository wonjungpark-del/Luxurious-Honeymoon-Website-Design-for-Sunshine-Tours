#!/bin/bash
# 신규 여행지 페이지 테스트

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "============================================"
echo "신규 여행지 페이지 테스트"
echo "============================================"
echo ""

# 테스트할 지역들
declare -A REGIONS=(
    ["danang"]="region-vietnam-danang"
    ["fiji"]="region-fiji"
    ["borabora"]="region-tahiti-borabora"
    ["santorini"]="region-greece-santorini"
    ["amalfi"]="region-italy-amalfi"
)

for page in "${!REGIONS[@]}"; do
    region_id="${REGIONS[$page]}"
    
    echo "테스트: $page 페이지"
    echo "─────────────────────────────────────────"
    
    # HTTP 상태 확인
    status=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$page")
    echo "HTTP 상태: $status"
    
    # API 데이터 확인
    api_response=$(curl -s "$BASE_URL/api/resorts?region_id=$region_id&is_active=true")
    resort_count=$(echo "$api_response" | jq -r '.data | length')
    echo "리조트 수: $resort_count"
    
    if [ "$resort_count" -gt 0 ]; then
        echo "리조트 목록:"
        echo "$api_response" | jq -r '.data[] | "  - \(.name_ko) (\(.category)) - 갤러리 \(.gallery_images | length)개"'
    fi
    
    # 페이지 렌더링 확인
    page_content=$(curl -s "$BASE_URL/$page")
    if echo "$page_content" | grep -q "resort-card"; then
        echo "렌더링: ✅ 성공"
    elif echo "$page_content" | grep -q "리조트 정보를 불러오는"; then
        echo "렌더링: ⚠️  로딩 중"
    elif echo "$page_content" | grep -q "실패했습니다"; then
        echo "렌더링: ❌ 실패"
    else
        echo "렌더링: ⚠️  알 수 없음"
    fi
    
    echo ""
done

echo "============================================"
echo "✅ 테스트 완료!"
echo "============================================"
