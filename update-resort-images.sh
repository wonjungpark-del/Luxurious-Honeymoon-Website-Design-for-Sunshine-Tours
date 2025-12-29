#!/bin/bash
# 다낭과 피지 리조트 메인 이미지를 실제 존재하는 이미지로 업데이트

API_BASE="https://luxurious-honeymoon-website-design.vercel.app/api"

echo "============================================"
echo "리조트 메인 이미지 업데이트"
echo "============================================"
echo ""

# 다낭 리조트 업데이트 (크라비 이미지 사용)
echo "다낭 리조트 이미지 업데이트 중..."

curl -s -X PUT "$API_BASE/resorts/resort-danang-intercontinental" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/krabi/krabi-resort01-01.webp"
  }' | jq -r '.message'

curl -s -X PUT "$API_BASE/resorts/resort-danang-pullman" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/krabi/krabi-resort02-01.webp"
  }' | jq -r '.message'

curl -s -X PUT "$API_BASE/resorts/resort-danang-furama" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/krabi/krabi-resort03-01.webp"
  }' | jq -r '.message'

echo "✅ 다낭 리조트 3개 업데이트 완료"
echo ""

# 피지 리조트 업데이트 (몰디브 이미지 사용)
echo "피지 리조트 이미지 업데이트 중..."

curl -s -X PUT "$API_BASE/resorts/resort-fiji-likuliku" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/maldives/maldives-resort01-01.webp"
  }' | jq -r '.message'

curl -s -X PUT "$API_BASE/resorts/resort-fiji-tokoriki" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/maldives/maldives-resort02-01.webp"
  }' | jq -r '.message'

curl -s -X PUT "$API_BASE/resorts/resort-fiji-yasawa" \
  -H "Content-Type: application/json" \
  -d '{
    "main_image_url": "/static/images/resorts/maldives/maldives-resort03-01.webp"
  }' | jq -r '.message'

echo "✅ 피지 리조트 3개 업데이트 완료"
echo ""

echo "============================================"
echo "✅ 모든 리조트 이미지 업데이트 완료!"
echo "============================================"
