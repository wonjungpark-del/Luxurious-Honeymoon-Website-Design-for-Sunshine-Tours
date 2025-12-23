#!/bin/bash

cd /home/user/webapp/public

# Paris
cat oahu.html | \
sed 's/오아후 리조트/파리 리조트/g' | \
sed 's/오아후/파리/g' | \
sed 's/Oahu/Paris/g' | \
sed 's/OAHU/PARIS/g' | \
sed 's/region-oahu/region-paris/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/낭만의 도시, 에펠탑과 센강의 아름다움/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY PARIS/g' > paris.html

# Rome
cat oahu.html | \
sed 's/오아후 리조트/로마 리조트/g' | \
sed 's/오아후/로마/g' | \
sed 's/Oahu/Rome/g' | \
sed 's/OAHU/ROME/g' | \
sed 's/region-oahu/region-rome/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/영원의 도시, 고대 로마의 역사와 문화/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY ROME/g' > rome.html

# Spain
cat oahu.html | \
sed 's/오아후 리조트/스페인 리조트/g' | \
sed 's/오아후/스페인/g' | \
sed 's/Oahu/Spain/g' | \
sed 's/OAHU/SPAIN/g' | \
sed 's/region-oahu/region-spain/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/정열의 나라, 가우디와 플라멩코의 열정/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY SPAIN/g' > spain.html

# Switzerland
cat oahu.html | \
sed 's/오아후 리조트/스위스 리조트/g' | \
sed 's/오아후/스위스/g' | \
sed 's/Oahu/Switzerland/g' | \
sed 's/OAHU/SWITZERLAND/g' | \
sed 's/region-oahu/region-switzerland/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/알프스의 보석, 융프라우와 마테호른의 장엄함/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY SWITZERLAND/g' > switzerland.html

# Prague
cat oahu.html | \
sed 's/오아후 리조트/프라하 리조트/g' | \
sed 's/오아후/프라하/g' | \
sed 's/Oahu/Prague/g' | \
sed 's/OAHU/PRAGUE/g' | \
sed 's/region-oahu/region-prague/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/동화 같은 도시, 중세 건축과 블타바 강의 낭만/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY PRAGUE/g' > prague.html

# Vienna
cat oahu.html | \
sed 's/오아후 리조트/빈 리조트/g' | \
sed 's/오아후/빈/g' | \
sed 's/Oahu/Vienna/g' | \
sed 's/OAHU/VIENNA/g' | \
sed 's/region-oahu/region-vienna/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/음악의 도시, 모차르트와 합스부르크의 유산/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY VIENNA/g' > vienna.html

# Croatia
cat oahu.html | \
sed 's/오아후 리조트/크로아티아 리조트/g' | \
sed 's/오아후/크로아티아/g' | \
sed 's/Oahu/Croatia/g' | \
sed 's/OAHU/CROATIA/g' | \
sed 's/region-oahu/region-croatia/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/아드리아해의 진주, 두브로브니크와 플리트비체의 절경/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY CROATIA/g' > croatia.html

# Turkey
cat oahu.html | \
sed 's/오아후 리조트/터키 리조트/g' | \
sed 's/오아후/터키/g' | \
sed 's/Oahu/Turkey/g' | \
sed 's/OAHU/TURKEY/g' | \
sed 's/region-oahu/region-turkey/g' | \
sed 's/와이키키 비치와 서핑의 성지, 하와이의 심장부/동서양의 만남, 이스탄불과 카파도키아의 신비/g' | \
sed 's/destination-hawaii.html/destination-europe.html/g' | \
sed 's/Hawaii/Europe/g' | \
sed 's/WHY OAHU/WHY TURKEY/g' > turkey.html

echo "Created: paris.html, rome.html, spain.html, switzerland.html, prague.html, vienna.html, croatia.html, turkey.html"
