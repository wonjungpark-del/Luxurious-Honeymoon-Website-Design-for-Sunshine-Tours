#!/bin/bash

# 전체 페이지 메인 이미지 처리 상태 체크 스크립트

echo "================================================================"
echo "전체 페이지 메인 이미지 처리 상태 종합 체크"
echo "================================================================"

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

# 지역별 페이지 분류
echo ""
echo "📍 1. 태국 지역 페이지 (6개)"
echo "================================================================"
THAILAND_PAGES=("thailand-phuket" "thailand-krabi" "thailand-koh-samui" "thailand-khao-lak" "thailand-pattaya" "thailand-hua-hin")
THAILAND_REGIONS=("region-thailand-phuket" "region-thailand-krabi" "region-thailand-koh-samui" "region-thailand-khao-lak" "region-thailand-pattaya" "region-thailand-hua-hin")

for i in "${!THAILAND_PAGES[@]}"; do
    PAGE="${THAILAND_PAGES[$i]}"
    REGION="${THAILAND_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    # 페이지 존재 확인
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    # 메인 이미지 처리 방식 확인
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    # 리조트 개수 확인
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "📍 2. 하와이 지역 페이지 (3개)"
echo "================================================================"
HAWAII_PAGES=("oahu" "maui" "bigisland")
HAWAII_REGIONS=("region-hawaii-oahu" "region-hawaii-maui" "region-hawaii-bigisland")

for i in "${!HAWAII_PAGES[@]}"; do
    PAGE="${HAWAII_PAGES[$i]}"
    REGION="${HAWAII_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "📍 3. 인도네시아 지역 페이지 (2개)"
echo "================================================================"
INDONESIA_PAGES=("bali" "lombok")
INDONESIA_REGIONS=("region-indonesia-bali" "region-indonesia-lombok")

for i in "${!INDONESIA_PAGES[@]}"; do
    PAGE="${INDONESIA_PAGES[$i]}"
    REGION="${INDONESIA_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "📍 4. 몰디브 지역 페이지 (1개)"
echo "================================================================"
echo ""
echo "🔍 maldives"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/maldives")
echo "   ├─ HTTP: $STATUS"

MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/maldives" | grep -o "mainImage.*gallery" | head -1)
if [ ! -z "$MAIN_IMAGE_CODE" ]; then
    echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
else
    echo "   ├─ 메인이미지: ❓ 확인 필요"
fi

RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=region-maldives&is_active=true" | grep -o '"id"' | wc -l)
echo "   └─ 리조트: $RESORT_COUNT개"

echo ""
echo ""
echo "📍 5. 필리핀 지역 페이지 (3개)"
echo "================================================================"
PHILIPPINES_PAGES=("boracay" "cebu" "palawan")
PHILIPPINES_REGIONS=("region-philippines-boracay" "region-philippines-cebu" "region-philippines-palawan")

for i in "${!PHILIPPINES_PAGES[@]}"; do
    PAGE="${PHILIPPINES_PAGES[$i]}"
    REGION="${PHILIPPINES_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "📍 6. 멕시코 지역 페이지 (1개)"
echo "================================================================"
echo ""
echo "🔍 cancun"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/cancun")
echo "   ├─ HTTP: $STATUS"

MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/cancun" | grep -o "mainImage.*gallery" | head -1)
if [ ! -z "$MAIN_IMAGE_CODE" ]; then
    echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
else
    echo "   ├─ 메인이미지: ❓ 확인 필요"
fi

RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=region-mexico-cancun&is_active=true" | grep -o '"id"' | wc -l)
echo "   └─ 리조트: $RESORT_COUNT개"

echo ""
echo ""
echo "📍 7. 베트남 지역 페이지 (1개)"
echo "================================================================"
echo ""
echo "🔍 danang"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/danang")
echo "   ├─ HTTP: $STATUS"

MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/danang" | grep -o "mainImage.*gallery" | head -1)
if [ ! -z "$MAIN_IMAGE_CODE" ]; then
    echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
else
    echo "   ├─ 메인이미지: ❓ 확인 필요"
fi

RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=region-vietnam-danang&is_active=true" | grep -o '"id"' | wc -l)
echo "   └─ 리조트: $RESORT_COUNT개"

echo ""
echo ""
echo "📍 8. 남태평양 지역 페이지 (4개)"
echo "================================================================"
SOUTHPACIFIC_PAGES=("fiji" "guam" "saipan" "australia")
SOUTHPACIFIC_REGIONS=("region-fiji" "region-southpacific-guam" "region-southpacific-saipan" "region-southpacific-australia")

for i in "${!SOUTHPACIFIC_PAGES[@]}"; do
    PAGE="${SOUTHPACIFIC_PAGES[$i]}"
    REGION="${SOUTHPACIFIC_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "📍 9. 유럽 지역 페이지 (8개)"
echo "================================================================"
EUROPE_PAGES=("paris" "rome" "spain" "switzerland" "prague" "vienna" "croatia" "turkey")
EUROPE_REGIONS=("region-europe-paris" "region-europe-rome" "region-europe-spain" "region-europe-switzerland" "region-europe-prague" "region-europe-vienna" "region-europe-croatia" "region-europe-turkey")

for i in "${!EUROPE_PAGES[@]}"; do
    PAGE="${EUROPE_PAGES[$i]}"
    REGION="${EUROPE_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE"
    
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   ├─ HTTP: $STATUS"
    
    MAIN_IMAGE_CODE=$(curl -s "$BASE_URL/$PAGE" | grep -o "mainImage.*gallery" | head -1)
    if [ ! -z "$MAIN_IMAGE_CODE" ]; then
        echo "   ├─ 메인이미지: ✅ 갤러리 첫번째 사용"
    else
        echo "   ├─ 메인이미지: ❓ 확인 필요"
    fi
    
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   └─ 리조트: $RESORT_COUNT개"
done

echo ""
echo ""
echo "================================================================"
echo "✅ 종합 체크 완료"
echo "================================================================"
echo ""
echo "📊 요약"
echo "───────────────────────────────────────────────────────────────"
echo "총 지역 페이지: 29개"
echo "  - 태국: 6개"
echo "  - 하와이: 3개"
echo "  - 인도네시아: 2개"
echo "  - 몰디브: 1개"
echo "  - 필리핀: 3개"
echo "  - 멕시코: 1개"
echo "  - 베트남: 1개"
echo "  - 남태평양: 4개"
echo "  - 유럽: 8개"
echo ""
