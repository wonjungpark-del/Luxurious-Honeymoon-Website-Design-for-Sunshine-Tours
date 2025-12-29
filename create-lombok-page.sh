#!/bin/bash

# Copy template
cp /home/user/webapp/public/thailand-khao-lak.html /home/user/webapp/public/lombok.html

FILE="/home/user/webapp/public/lombok.html"

# Update title and meta
sed -i 's/태국 카오락 리조트 추천 | 프라이빗 비치 허니문/롬복 리조트 추천 | 숨은 보석 럭셔리 허니문/g' "$FILE"
sed -i 's/태국 카오락 프라이빗 비치 리조트 전문/롬복 최고급 리조트 전문/g' "$FILE"
sed -i 's/카오락/롬복/g' "$FILE"
sed -i 's/Khao Lak/Lombok/g' "$FILE"
sed -i 's/region-thailand-khao-lak/region-lombok/g' "$FILE"
sed -i 's/태국/인도네시아/g' "$FILE"
sed -i 's/안다만해의 맑은 바다와 울창한 정글/맑고 투명한 바다와 린자니 화산/g' "$FILE"
sed -i 's/한적하고 평화로운/자연이 잘 보존된/g' "$FILE"
sed -i 's/남부의 숨겨진 보석/옆의 숨은 보석/g' "$FILE"
sed -i 's/프라이빗 비치와 럭셔리 리조트/길리 섬과 럭셔리 리조트/g' "$FILE"

echo "✅ 롬복 페이지 생성 완료"
