#!/bin/bash

API_BASE="https://luxurious-honeymoon-website-design.vercel.app/api"
JSON_FILE="resort_data_thailand.json"

echo "=== 태국 리조트 추가 시작 ==="
echo ""

# 카오락 리조트 추가 (3개)
echo "📍 카오락 (Khao Lak) 리조트 추가 중... (3개)"
jq -r '.khao_lak[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  RESPONSE=$(curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort")
  SUCCESS=$(echo "$RESPONSE" | jq -r '.success')
  if [ "$SUCCESS" = "true" ]; then
    echo "    ✅ 성공"
  else
    echo "    ❌ 실패: $(echo "$RESPONSE" | jq -r '.error')"
  fi
done
echo "✅ 카오락 완료"
echo ""

# 코사무이 리조트 추가 (5개)
echo "📍 코사무이 (Koh Samui) 리조트 추가 중... (5개)"
jq -r '.koh_samui[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  RESPONSE=$(curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort")
  SUCCESS=$(echo "$RESPONSE" | jq -r '.success')
  if [ "$SUCCESS" = "true" ]; then
    echo "    ✅ 성공"
  else
    echo "    ❌ 실패: $(echo "$RESPONSE" | jq -r '.error')"
  fi
done
echo "✅ 코사무이 완료"
echo ""

# 파타야 리조트 추가 (8개)
echo "📍 파타야 (Pattaya) 리조트 추가 중... (8개)"
jq -r '.pattaya[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  RESPONSE=$(curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort")
  SUCCESS=$(echo "$RESPONSE" | jq -r '.success')
  if [ "$SUCCESS" = "true" ]; then
    echo "    ✅ 성공"
  else
    echo "    ❌ 실패: $(echo "$RESPONSE" | jq -r '.error')"
  fi
done
echo "✅ 파타야 완료"
echo ""

# 푸켓 리조트 추가 (4개)
echo "📍 푸켓 (Phuket) 리조트 추가 중... (4개)"
jq -r '.phuket[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  RESPONSE=$(curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort")
  SUCCESS=$(echo "$RESPONSE" | jq -r '.success')
  if [ "$SUCCESS" = "true" ]; then
    echo "    ✅ 성공"
  else
    echo "    ❌ 실패: $(echo "$RESPONSE" | jq -r '.error')"
  fi
done
echo "✅ 푸켓 완료"
echo ""

echo "=== 완료: 태국 4개 지역 총 20개 리조트 추가 ==="
