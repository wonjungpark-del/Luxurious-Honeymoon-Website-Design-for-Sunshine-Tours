#!/bin/bash

cd /home/user/webapp/public

# Fiji
cat oahu.html | \
sed 's/오아후 리조트/피지 리조트/g' | \
sed 's/오아후/피지/g' | \
sed 's/Oahu/Fiji/g' | \
sed 's/OAHU/FIJI/g' | \
sed 's/region-oahu/region-fiji/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/남태평양의 낙원, 산호초와 럭셔리 리조트의 천국/g' | \
sed 's/destination-hawaii.html/destination-southpacific.html/g' | \
sed 's/Hawaii/South Pacific/g' | \
sed 's/WHY OAHU/WHY FIJI/g' > fiji.html

# Guam
cat oahu.html | \
sed 's/오아후 리조트/괌 리조트/g' | \
sed 's/오아후/괌/g' | \
sed 's/Oahu/Guam/g' | \
sed 's/OAHU/GUAM/g' | \
sed 's/region-oahu/region-guam/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/가까운 남태평양, 쇼핑과 해양스포츠의 천국/g' | \
sed 's/destination-hawaii.html/destination-southpacific.html/g' | \
sed 's/Hawaii/South Pacific/g' | \
sed 's/WHY OAHU/WHY GUAM/g' > guam.html

# Saipan
cat oahu.html | \
sed 's/오아후 리조트/사이판 리조트/g' | \
sed 's/오아후/사이판/g' | \
sed 's/Oahu/Saipan/g' | \
sed 's/OAHU/SAIPAN/g' | \
sed 's/region-oahu/region-saipan/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/조용한 휴양을 위한 마리아나 제도의 보석/g' | \
sed 's/destination-hawaii.html/destination-southpacific.html/g' | \
sed 's/Hawaii/South Pacific/g' | \
sed 's/WHY OAHU/WHY SAIPAN/g' > saipan.html

# Australia
cat oahu.html | \
sed 's/오아후 리조트/호주 리조트/g' | \
sed 's/오아후/호주/g' | \
sed 's/Oahu/Australia/g' | \
sed 's/OAHU/AUSTRALIA/g' | \
sed 's/region-oahu/region-australia/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/대보초와 시드니, 다양한 자연과 도시의 매력/g' | \
sed 's/destination-hawaii.html/destination-southpacific.html/g' | \
sed 's/Hawaii/South Pacific/g' | \
sed 's/WHY OAHU/WHY AUSTRALIA/g' > australia.html

echo "Created: fiji.html, guam.html, saipan.html, australia.html"
