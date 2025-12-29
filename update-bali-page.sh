#!/bin/bash

# Update Bali page content
FILE="/home/user/webapp/public/bali.html"

# Replace region names
sed -i 's/카오락/발리/g' "$FILE"
sed -i 's/Khao Lak/Bali/g' "$FILE"
sed -i 's/태국 남부의 숨겨진 보석/신들의 섬, 세계적인 관광지/g' "$FILE"
sed -i 's/한적하고 평화로운/영적이고 아름다운/g' "$FILE"
sed -i 's/안다만해의 맑은 바다와 울창한 정글/사원과 해변, 계단식 논이 어우러진 천국/g' "$FILE"
sed -i 's/프라이빗 비치와 럭셔리 리조트/발리 문화와 럭셔리 리조트/g' "$FILE"

# Update breadcrumb
sed -i 's/>태국</>인도네시아</g' "$FILE"

# Update section titles
sed -i 's/카오락을 선택해야 하는 이유/발리를 선택해야 하는 이유/g' "$FILE"
sed -i 's/카오락에서 특별한 허니문/발리에서 특별한 허니문/g' "$FILE"

echo "✅ 발리 페이지 업데이트 완료"
