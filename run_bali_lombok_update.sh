#!/bin/bash

JSON_FILE="update_bali_lombok_flat.json"
API_URL="https://luxurious-honeymoon-website-design.vercel.app/api/resorts"

SUCCESS_COUNT=0
FAIL_COUNT=0
FAILED_RESORTS=""

echo "=== 발리 & 롬복 리조트 업데이트 시작 ==="

jq -c '.[]' "$JSON_FILE" | while read resort; do
  RESORT_ID=$(echo "$resort" | jq -r '.id')
  NAME_KO=$(echo "$resort" | jq -r '.name_ko')
  DESCRIPTION=$(echo "$resort" | jq -r '.description')
  FEATURES=$(echo "$resort" | jq -r '.features')
  
  echo ""
  echo "리조트: $NAME_KO (ID: $RESORT_ID)"
  
  PAYLOAD=$(jq -n \
    --arg desc "$DESCRIPTION" \
    --argjson feat "$FEATURES" \
    '{description: $desc, features: $feat}')
  
  HTTP_CODE=$(curl -s -w "%{http_code}" -o /tmp/response_$RESORT_ID.json \
    -X PUT \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD" \
    "$API_URL?id=$RESORT_ID")
  
  if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ 업데이트 성공"
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
  else
    echo "❌ 업데이트 실패 (HTTP $HTTP_CODE)"
    cat /tmp/response_$RESORT_ID.json
    FAIL_COUNT=$((FAIL_COUNT + 1))
    FAILED_RESORTS="$FAILED_RESORTS $NAME_KO($RESORT_ID)"
  fi
done

echo ""
echo "=== 업데이트 완료 ===" 
echo "성공: $SUCCESS_COUNT개"
echo "실패: $FAIL_COUNT개"
if [ -n "$FAILED_RESORTS" ]; then
  echo "실패 리조트:$FAILED_RESORTS"
fi
