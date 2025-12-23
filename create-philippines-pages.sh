#!/bin/bash

cd /home/user/webapp/public

# Boracay
cat oahu.html | \
sed 's/오아후 리조트/보라카이 리조트/g' | \
sed 's/오아후/보라카이/g' | \
sed 's/Oahu/Boracay/g' | \
sed 's/OAHU/BORACAY/g' | \
sed 's/region-oahu/region-boracay/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/필리핀 최고의 해변, 화이트 비치의 낙원/g' | \
sed 's/destination-hawaii.html/destination-philippines.html/g' | \
sed 's/Hawaii/Philippines/g' | \
sed 's/WHY OAHU/WHY BORACAY/g' > boracay.html

# Cebu-Bohol
cat oahu.html | \
sed 's/오아후 리조트/세부\/보홀 리조트/g' | \
sed 's/오아후/세부\/보홀/g' | \
sed 's/Oahu/Cebu\/Bohol/g' | \
sed 's/OAHU/CEBU BOHOL/g' | \
sed 's/region-oahu/region-cebu-bohol/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/필리핀 중부의 보물, 다이빙과 초콜릿 힐스의 명소/g' | \
sed 's/destination-hawaii.html/destination-philippines.html/g' | \
sed 's/Hawaii/Philippines/g' | \
sed 's/WHY OAHU/WHY CEBU BOHOL/g' > cebu-bohol.html

# Palawan
cat oahu.html | \
sed 's/오아후 리조트/팔라완 리조트/g' | \
sed 's/오아후/팔라완/g' | \
sed 's/Oahu/Palawan/g' | \
sed 's/OAHU/PALAWAN/g' | \
sed 's/region-oahu/region-palawan/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/필리핀 최후의 낙원, 엘니도와 코론의 절경/g' | \
sed 's/destination-hawaii.html/destination-philippines.html/g' | \
sed 's/Hawaii/Philippines/g' | \
sed 's/WHY OAHU/WHY PALAWAN/g' > palawan.html

echo "Created: boracay.html, cebu-bohol.html, palawan.html"
