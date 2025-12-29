#!/bin/bash

echo "================================================================"
echo "16개 페이지 메인 이미지 폴백 로직 테스트"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

# 테스트할 페이지 목록
declare -A pages=(
    ["thailand-phuket"]="태국 푸켓"
    ["thailand-krabi"]="태국 끄라비"
    ["thailand-koh-samui"]="태국 코사무이"
    ["thailand-khao-lak"]="태국 카오락"
    ["thailand-pattaya"]="태국 파타야"
    ["thailand-hua-hin"]="태국 후아힌"
    ["oahu"]="하와이 오아후"
    ["maui"]="하와이 마우이"
    ["bigisland"]="하와이 빅아일랜드"
    ["bali"]="인도네시아 발리"
    ["lombok"]="인도네시아 롬복"
    ["maldives"]="몰디브"
    ["boracay"]="필리핀 보라카이"
    ["cebu"]="필리핀 세부"
    ["palawan"]="필리핀 팔라완"
    ["cancun"]="멕시코 칸쿤"
)

success_count=0
fail_count=0

for slug in "${!pages[@]}"; do
    name="${pages[$slug]}"
    url="${BASE_URL}/${slug}"
    
    echo "🔍 테스트: $name ($slug)"
    
    # HTTP 상태 코드 확인
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    
    if [ "$status" -eq 200 ]; then
        echo "   ✅ HTTP: $status"
        
        # 페이지 내용 가져오기
        content=$(curl -s "$url")
        
        # gallery_images 사용 여부 확인
        if echo "$content" | grep -q "resort.gallery_images"; then
            echo "   ✅ 갤러리 이미지 폴백 로직 적용됨"
        else
            echo "   ⚠️  갤러리 이미지 폴백 로직 미확인"
        fi
        
        success_count=$((success_count + 1))
    else
        echo "   ❌ HTTP: $status (오류)"
        fail_count=$((fail_count + 1))
    fi
    
    echo ""
done

echo "================================================================"
echo "✅ 테스트 완료"
echo "================================================================"
echo "성공: $success_count개"
echo "실패: $fail_count개"
echo "총: $((success_count + fail_count))개"
echo ""
