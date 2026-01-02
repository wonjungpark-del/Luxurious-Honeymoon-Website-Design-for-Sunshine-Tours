# 🌟 AI Drive 백업 정보

**백업 일시**: 2026-01-01 14:51 UTC  
**프로젝트**: Luxurious Honeymoon Website Design for Sunshine Tours

---

## 📦 **AI Drive 백업 파일**

### 1️⃣ **전체 프로젝트 아카이브**
- **파일명**: `webapp_complete_backup_20260101.tar.gz`
- **위치**: `/mnt/aidrive/webapp_complete_backup_20260101.tar.gz`
- **크기**: 596MB
- **포함 내용**:
  - ✅ 소스 코드 (HTML, CSS, JavaScript, API)
  - ✅ Git 히스토리
  - ✅ 설정 파일 (package.json, wrangler.jsonc, 등)
  - ✅ 문서 파일 (README, 가이드 등)
  - ✅ 데이터베이스 백업 포함

### 2️⃣ **데이터베이스 백업**
- **디렉터리명**: `database_backups_20260101`
- **위치**: `/mnt/aidrive/database_backups_20260101/`
- **크기**: 256KB
- **포함 파일**:
  - ✅ `regions_20260101_144620.json` (22개 지역, 8.7KB)
  - ✅ `resorts_20260101_144620.json` (143개 리조트, 197KB)
  - ✅ `reviews_20260101_144620.json` (14개 리뷰, 34KB)
  - ✅ `backup_summary_20260101_144620.txt` (백업 요약)

---

## 📊 **백업 통계**

| 항목 | 개수/크기 |
|------|----------|
| **전체 아카이브** | 596MB |
| **DB 백업** | 256KB |
| **Regions** | 22개 |
| **Resorts** | 143개 |
| **Reviews** | 14개 |
| **소스 파일** | 4,346개 |

---

## 🔄 **복원 방법**

### **AI Drive에서 복원**:

#### **1. 전체 프로젝트 복원**:
```bash
# AI Drive에서 로컬로 복사
sudo cp /mnt/aidrive/webapp_complete_backup_20260101.tar.gz /home/user/

# 압축 해제
cd /home/user
tar -xzf webapp_complete_backup_20260101.tar.gz

# 의존성 설치
cd webapp
npm install

# 개발 서버 시작
npm run build
pm2 start ecosystem.config.cjs
```

#### **2. 데이터베이스만 복원**:
```bash
# AI Drive에서 DB 백업 복사
sudo cp -r /mnt/aidrive/database_backups_20260101 /home/user/

# API 엔드포인트로 복원 (예시)
cd /home/user/database_backups_20260101

# Regions 복원
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/regions \
  -H "Content-Type: application/json" \
  -d @regions_20260101_144620.json

# Resorts 복원
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/resorts \
  -H "Content-Type: application/json" \
  -d @resorts_20260101_144620.json

# Reviews 복원
curl -X POST https://luxurious-honeymoon-website-design.vercel.app/api/reviews \
  -H "Content-Type: application/json" \
  -d @reviews_20260101_144620.json
```

---

## ✅ **백업 확인**

### **AI Drive 백업 확인**:
```bash
# 파일 목록 확인
ls -lh /mnt/aidrive/

# 전체 아카이브 확인
ls -lh /mnt/aidrive/webapp_complete_backup_20260101.tar.gz

# DB 백업 확인
ls -lh /mnt/aidrive/database_backups_20260101/

# 크기 확인
du -sh /mnt/aidrive/webapp_complete_backup_20260101.tar.gz
du -sh /mnt/aidrive/database_backups_20260101/
```

---

## 🎯 **백업 위치 요약**

| 백업 유형 | 로컬 위치 | AI Drive 위치 |
|----------|----------|--------------|
| **전체 아카이브** | `/home/user/webapp_complete_backup_20260101.tar.gz` | `/mnt/aidrive/webapp_complete_backup_20260101.tar.gz` |
| **DB 백업** | `/home/user/webapp/backups/` | `/mnt/aidrive/database_backups_20260101/` |

---

## 📝 **주의사항**

1. **AI Drive는 영구 스토리지**입니다
   - 샌드박스가 재시작되어도 AI Drive의 파일은 유지됩니다
   - 로컬 백업(`/home/user/`)은 샌드박스 재시작 시 사라질 수 있습니다

2. **백업 복원 시**:
   - 전체 프로젝트 복원 시 `npm install` 필수
   - DB 복원 시 API 엔드포인트 접근 권한 확인
   - 복원 전 기존 데이터 백업 권장

3. **백업 파일 관리**:
   - 정기적으로 새 백업 생성 권장
   - 오래된 백업은 정리하여 공간 확보
   - 중요 변경 후에는 즉시 백업

---

## 📌 **프로젝트 정보**

- **프로젝트명**: Luxurious Honeymoon Website Design for Sunshine Tours
- **현재 URL**: https://luxurious-honeymoon-website-design.vercel.app
- **도메인**: sunshinetour.co.kr (연결 대기 중)
- **GitHub**: https://github.com/wonjungpark-del/Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours
- **마지막 업데이트**: 2026-01-01

---

**생성일**: 2026-01-01 14:51 UTC  
**작성자**: Claude AI Assistant  
**버전**: 1.0
