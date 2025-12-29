#!/bin/bash

echo "================================================================"
echo "리조트 API 데이터 확인: 발리, 롬복, 칸쿤"
echo "================================================================"
echo ""

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "📍 1. 발리 (region-bali) 리조트 API 확인"
echo "-----------------------------------------------------------"
curl -s "${BASE_URL}/api/resorts?region_id=region-bali" | jq '.' 2>/dev/null || curl -s "${BASE_URL}/api/resorts?region_id=region-bali"
echo ""
echo ""

echo "📍 2. 롬복 (region-lombok) 리조트 API 확인"
echo "-----------------------------------------------------------"
curl -s "${BASE_URL}/api/resorts?region_id=region-lombok" | jq '.' 2>/dev/null || curl -s "${BASE_URL}/api/resorts?region_id=region-lombok"
echo ""
echo ""

echo "📍 3. 칸쿤 (region-cancun) 리조트 API 확인"
echo "-----------------------------------------------------------"
curl -s "${BASE_URL}/api/resorts?region_id=region-cancun" | jq '.' 2>/dev/null || curl -s "${BASE_URL}/api/resorts?region_id=region-cancun"
echo ""

