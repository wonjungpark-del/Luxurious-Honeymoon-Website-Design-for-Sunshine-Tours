#!/bin/bash

echo "================================================================"
echo "관리자 페이지 비교 및 연동 테스트"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "📍 1. 페이지 접근 테스트"
echo "================================================================"

for page in "admin.html" "admin-new.html"; do
    echo ""
    echo "🔍 $page"
    echo "   URL: ${BASE_URL}/$page"
    
    # HTTP 상태 확인
    status=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/$page")
    echo "   HTTP: $status"
    
    if [ "$status" -eq 200 ]; then
        # 파일 크기 확인
        size=$(curl -s "${BASE_URL}/$page" | wc -c)
        echo "   크기: $size bytes"
        
        # API 호출 여부 확인
        content=$(curl -s "${BASE_URL}/$page")
        
        regions_api=$(echo "$content" | grep -c "/api/regions")
        resorts_api=$(echo "$content" | grep -c "/api/resorts")
        reviews_api=$(echo "$content" | grep -c "/api/reviews")
        
        echo "   API 호출:"
        echo "     - /api/regions: ${regions_api}번"
        echo "     - /api/resorts: ${resorts_api}번"
        echo "     - /api/reviews: ${reviews_api}번"
        
        # 기능 확인
        if echo "$content" | grep -q "loadRegions"; then
            echo "   ✅ 데이터 로드 함수 존재"
        else
            echo "   ⚠️  데이터 로드 함수 미확인"
        fi
    else
        echo "   ❌ 페이지 접근 불가"
    fi
done

echo ""
echo ""
echo "📍 2. 메인 페이지 링크 확인"
echo "================================================================"

echo ""
echo "🔍 index.html에서 관리자 페이지 링크"
index_content=$(curl -s "${BASE_URL}/index.html")
if echo "$index_content" | grep -q "href=\"admin.html\""; then
    echo "   ✅ admin.html로 링크됨 (메인 관리자 페이지)"
elif echo "$index_content" | grep -q "href=\"admin-new.html\""; then
    echo "   ✅ admin-new.html로 링크됨"
else
    echo "   ⚠️  관리자 페이지 링크 없음"
fi

echo ""
echo ""
echo "================================================================"
echo "✅ 테스트 완료"
echo "================================================================"

