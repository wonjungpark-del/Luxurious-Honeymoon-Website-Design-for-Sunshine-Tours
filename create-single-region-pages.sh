#!/bin/bash

cd /home/user/webapp/public

# Cancun
cat oahu.html | \
sed 's/오아후 리조트/칸쿤 리조트/g' | \
sed 's/오아후/칸쿤/g' | \
sed 's/Oahu/Cancun/g' | \
sed 's/OAHU/CANCUN/g' | \
sed 's/region-oahu/region-cancun/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/카리브해의 휴양지, 마야 문명과 백사장의 천국/g' | \
sed 's/destination-hawaii.html/destination-cancun.html/g' | \
sed 's/Hawaii/Cancun/g' | \
sed 's/WHY OAHU/WHY CANCUN/g' > cancun.html

# Mauritius
cat oahu.html | \
sed 's/오아후 리조트/모리셔스 리조트/g' | \
sed 's/오아후/모리셔스/g' | \
sed 's/Oahu/Mauritius/g' | \
sed 's/OAHU/MAURITIUS/g' | \
sed 's/region-oahu/region-mauritius/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/인도양의 보석, 럭셔리 리조트와 열대 자연의 조화/g' | \
sed 's/destination-hawaii.html/destination-mauritius.html/g' | \
sed 's/Hawaii/Mauritius/g' | \
sed 's/WHY OAHU/WHY MAURITIUS/g' > mauritius.html

# Da Nang
cat oahu.html | \
sed 's/오아후 리조트/다낭 리조트/g' | \
sed 's/오아후/다낭/g' | \
sed 's/Oahu/Da Nang/g' | \
sed 's/OAHU/DA NANG/g' | \
sed 's/region-oahu/region-danang/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/베트남 중부의 해변 도시, 미케 비치와 오행산의 매력/g' | \
sed 's/destination-hawaii.html/destination-danang.html/g' | \
sed 's/Hawaii/Vietnam/g' | \
sed 's/WHY OAHU/WHY DA NANG/g' > danang.html

echo "Created: cancun.html, mauritius.html, danang.html"
