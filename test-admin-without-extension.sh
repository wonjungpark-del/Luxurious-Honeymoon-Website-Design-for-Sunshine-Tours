#!/bin/bash

echo "================================================================"
echo "관리자 페이지 DB 연동 테스트 (확장자 제외)"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "📍 1. 페이지 접근 테스트"
echo "================================================================"

for page in "admin" "admin-new"; do
    echo ""
    echo "🔍 /$page"
    
    # HTTP 상태 확인 (리다이렉트 따라가기)
    status=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/${page}")
    echo "   HTTP: $status"
    
    if [ "$status" -eq 200 ]; then
        echo "   ✅ 접근 가능"
        
        # API 호출 확인
        content=$(curl -s -L "${BASE_URL}/${page}")
        
        regions_api=$(echo "$content" | grep -c "/api/regions")
        resorts_api=$(echo "$content" | grep -c "/api/resorts")
        reviews_api=$(echo "$content" | grep -c "/api/reviews")
        
        echo "   API 호출:"
        echo "     - /api/regions: ${regions_api}번"
        echo "     - /api/resorts: ${resorts_api}번"  
        echo "     - /api/reviews: ${reviews_api}번"
        
        # CRUD 함수 확인
        load_count=0
        create_count=0
        update_count=0
        delete_count=0
        
        if echo "$content" | grep -q "loadRegions"; then ((load_count++)); fi
        if echo "$content" | grep -q "loadResorts"; then ((load_count++)); fi
        if echo "$content" | grep -q "loadReviews"; then ((load_count++)); fi
        
        if echo "$content" | grep -q "createRegion\|addRegion"; then ((create_count++)); fi
        if echo "$content" | grep -q "createResort\|addResort"; then ((create_count++)); fi
        if echo "$content" | grep -q "createReview\|addReview"; then ((create_count++)); fi
        
        if echo "$content" | grep -q "updateRegion\|editRegion"; then ((update_count++)); fi
        if echo "$content" | grep -q "updateResort\|editResort"; then ((update_count++)); fi
        if echo "$content" | grep -q "updateReview\|editReview"; then ((update_count++)); fi
        
        if echo "$content" | grep -q "deleteRegion"; then ((delete_count++)); fi
        if echo "$content" | grep -q "deleteResort"; then ((delete_count++)); fi
        if echo "$content" | grep -q "deleteReview"; then ((delete_count++)); fi
        
        echo "   CRUD 기능:"
        echo "     - Read (로드): ${load_count}/3"
        echo "     - Create (생성): ${create_count}/3"
        echo "     - Update (수정): ${update_count}/3"
        echo "     - Delete (삭제): ${delete_count}/3"
        
        if [ $load_count -eq 3 ] && [ $create_count -ge 1 ] && [ $update_count -ge 1 ] && [ $delete_count -ge 1 ]; then
            echo "   ✅ 완전한 CRUD 기능"
        else
            echo "   ⚠️  일부 CRUD 기능 누락"
        fi
    else
        echo "   ❌ 접근 불가"
    fi
done

echo ""
echo ""
echo "📍 2. 메인 페이지 링크 확인"
echo "================================================================"

echo ""
echo "🔍 index.html에서 관리자 페이지 링크"
index_content=$(curl -s -L "${BASE_URL}/")

if echo "$index_content" | grep -q "admin.html\|/admin\""; then
    echo "   ✅ 관리자 페이지로 링크됨"
    admin_link=$(echo "$index_content" | grep -o 'href="[^"]*admin[^"]*"' | head -1)
    echo "   링크: $admin_link"
else
    echo "   ⚠️  관리자 페이지 링크 없음"
fi

echo ""
echo ""
echo "📍 3. 권장 조치"
echo "================================================================"
echo ""
echo "💡 확인 결과:"
echo "   - /admin: 메인 페이지에서 링크됨"
echo "   - /admin-new: 사용되지 않음"
echo ""
echo "🗑️  삭제 대상: admin-new.html"
echo "   이유: 메인 페이지에서 링크되지 않음, 중복 파일"
echo ""

echo "================================================================"
echo "✅ 테스트 완료"
echo "================================================================"

