#!/bin/bash

API_BASE="https://luxurious-honeymoon-website-design.vercel.app/api"
JSON_FILE="resort_data_hawaii.json"

echo "=== 하와이 리조트 추가 시작 ==="
echo ""

# Big Island 리조트 추가
echo "📍 Big Island 리조트 추가 중..."
jq -r '.hawaii_bigisland[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort" > /dev/null
done
echo "✅ Big Island 완료 (10개)"
echo ""

# Maui 리조트 추가
echo "📍 Maui 리조트 추가 중..."
jq -r '.maui[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort" > /dev/null
done
echo "✅ Maui 완료 (10개)"
echo ""

# Oahu 리조트 추가
echo "📍 Oahu 리조트 추가 중..."
jq -r '.oahu[] | @json' "$JSON_FILE" | while read resort; do
  NAME=$(echo "$resort" | jq -r '.name_ko')
  echo "  - $NAME 추가 중..."
  curl -s -X POST "$API_BASE/resorts" \
    -H "Content-Type: application/json" \
    -d "$resort" > /dev/null
done
echo "✅ Oahu 완료 (10개)"
echo ""

echo "=== 완료: 하와이 3개 지역 총 30개 리조트 추가 ==="
