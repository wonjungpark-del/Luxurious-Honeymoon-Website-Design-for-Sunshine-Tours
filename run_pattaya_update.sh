#!/bin/bash
API_URL="https://luxurious-honeymoon-website-design.vercel.app/api/resorts"
RESORTS=$(cat update_pattaya_resorts.json | jq -c '.resorts[]')
echo "파타야 리조트 업데이트 시작..."
echo "================================"
SUCCESS_COUNT=0
FAIL_COUNT=0
while IFS= read -r resort; do
    RESORT_ID=$(echo "$resort" | jq -r '.id')
    NAME=$(echo "$resort" | jq -r '.name_ko')
    DESCRIPTION=$(echo "$resort" | jq -r '.description')
    FEATURES=$(echo "$resort" | jq -c '.features')
    echo "업데이트 중: $NAME ($RESORT_ID)"
    RESPONSE=$(curl -s -X PUT "${API_URL}?id=${RESORT_ID}" \
        -H "Content-Type: application/json" \
        -d "$(jq -n --arg desc "$DESCRIPTION" --argjson features "$FEATURES" '{description: $desc, features: $features}')")
    if echo "$RESPONSE" | jq -e '.success' > /dev/null 2>&1; then
        echo "✅ 성공: $NAME"
        ((SUCCESS_COUNT++))
    else
        echo "❌ 실패: $NAME"
        echo "   응답: $RESPONSE"
        ((FAIL_COUNT++))
    fi
    echo ""
    sleep 0.5
done <<< "$RESORTS"
echo "================================"
echo "업데이트 완료!"
echo "성공: $SUCCESS_COUNT개"
echo "실패: $FAIL_COUNT개"
