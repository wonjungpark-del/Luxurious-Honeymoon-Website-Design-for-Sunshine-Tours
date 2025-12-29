#!/bin/bash

echo "================================================================"
echo "관리자 페이지 DB 연동 상태 종합 체크"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "📍 1. 관리자 페이지 접근 확인"
echo "================================================================"

echo ""
echo "🔍 admin.html"
status=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin.html")
echo "   HTTP 상태: $status"
if [ "$status" -eq 200 ]; then
    echo "   ✅ 페이지 접근 가능"
else
    echo "   ❌ 페이지 접근 불가"
fi

echo ""
echo "🔍 admin-new.html"
status=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin-new.html")
echo "   HTTP 상태: $status"
if [ "$status" -eq 200 ]; then
    echo "   ✅ 페이지 접근 가능"
else
    echo "   ❌ 페이지 접근 불가"
fi

echo ""
echo ""
echo "📍 2. API 엔드포인트 확인"
echo "================================================================"

declare -A apis=(
    ["/api/regions"]="지역 목록"
    ["/api/resorts"]="리조트 목록"
    ["/api/reviews"]="리뷰 목록"
)

for endpoint in "${!apis[@]}"; do
    name="${apis[$endpoint]}"
    echo ""
    echo "🔍 $name ($endpoint)"
    status=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}${endpoint}")
    echo "   HTTP 상태: $status"
    
    if [ "$status" -eq 200 ]; then
        # 데이터 개수 확인
        response=$(curl -s "${BASE_URL}${endpoint}")
        count=$(echo "$response" | jq -r '.data | length' 2>/dev/null)
        if [ -n "$count" ] && [ "$count" != "null" ]; then
            echo "   데이터 개수: $count개"
            echo "   ✅ API 정상 작동"
        else
            echo "   ⚠️  데이터 형식 확인 필요"
        fi
    else
        echo "   ❌ API 오류"
    fi
done

echo ""
echo ""
echo "📍 3. CRUD 기능 테스트 (읽기)"
echo "================================================================"

echo ""
echo "🔍 전체 지역 조회"
regions_response=$(curl -s "${BASE_URL}/api/regions")
regions_count=$(echo "$regions_response" | jq -r '.data | length' 2>/dev/null)
echo "   총 지역 수: $regions_count개"

if [ "$regions_count" -gt 0 ]; then
    echo "   샘플 지역 (처음 3개):"
    echo "$regions_response" | jq -r '.data[0:3] | .[] | "     - \(.name_ko) (\(.code))"' 2>/dev/null
fi

echo ""
echo "🔍 전체 리조트 조회"
resorts_response=$(curl -s "${BASE_URL}/api/resorts")
resorts_count=$(echo "$resorts_response" | jq -r '.data | length' 2>/dev/null)
echo "   총 리조트 수: $resorts_count개"

if [ "$resorts_count" -gt 0 ]; then
    echo "   샘플 리조트 (처음 3개):"
    echo "$resorts_response" | jq -r '.data[0:3] | .[] | "     - \(.name_ko) - \(.region_id)"' 2>/dev/null
fi

echo ""
echo "🔍 전체 리뷰 조회"
reviews_response=$(curl -s "${BASE_URL}/api/reviews")
reviews_count=$(echo "$reviews_response" | jq -r '.data | length' 2>/dev/null)
echo "   총 리뷰 수: $reviews_count개"

if [ "$reviews_count" -gt 0 ]; then
    echo "   샘플 리뷰 (처음 3개):"
    echo "$reviews_response" | jq -r '.data[0:3] | .[] | "     - \(.author) - \(.destination)"' 2>/dev/null
fi

echo ""
echo ""
echo "📍 4. 특정 지역 리조트 조회 테스트"
echo "================================================================"

declare -A test_regions=(
    ["region-bali"]="발리"
    ["region-maldives"]="몰디브"
    ["region-fiji"]="피지"
)

for region_id in "${!test_regions[@]}"; do
    name="${test_regions[$region_id]}"
    echo ""
    echo "🔍 $name ($region_id)"
    
    response=$(curl -s "${BASE_URL}/api/resorts?region_id=$region_id")
    count=$(echo "$response" | jq -r '.data | length' 2>/dev/null)
    
    if [ -n "$count" ] && [ "$count" != "null" ]; then
        echo "   리조트 수: $count개"
        if [ "$count" -gt 0 ]; then
            echo "   리조트 목록:"
            echo "$response" | jq -r '.data[] | "     - \(.name_ko)"' 2>/dev/null
        fi
    else
        echo "   ⚠️  데이터 조회 실패"
    fi
done

echo ""
echo ""
echo "================================================================"
echo "✅ 종합 체크 완료"
echo "================================================================"
echo ""
echo "📊 요약"
echo "───────────────────────────────────────────────────────────────"
echo "총 지역: $regions_count개"
echo "총 리조트: $resorts_count개"
echo "총 리뷰: $reviews_count개"
echo ""

EOF

chmod +x /home/user/webapp/check-admin-db-connection.sh && /home/user/webapp/check-admin-db-connection.sh