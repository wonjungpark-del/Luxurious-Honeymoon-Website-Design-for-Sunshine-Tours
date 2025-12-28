# 🚀 Vercel 배포 가이드

## 현재 상태
- ✅ Vercel용 API 코드 작성 완료
- ✅ Postgres 스키마 준비 완료
- ✅ Vercel Blob Storage 연동 완료
- ⏳ Vercel Postgres 데이터베이스 설정 필요
- ⏳ 환경 변수 설정 필요
- ⏳ 배포 실행 필요

---

## 📋 배포 단계

### 1️⃣ Vercel 프로젝트 준비

**Vercel 대시보드:**
```
https://vercel.com/dashboard
```

**프로젝트 연결:**
1. New Project 클릭
2. GitHub 저장소 선택: `Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours`
3. Framework Preset: Other (또는 Vite)
4. Root Directory: `./`
5. Build Command: `npm run build`
6. Output Directory: `dist`

---

### 2️⃣ Vercel Postgres 데이터베이스 설정

**스토리지 탭에서 Postgres 생성:**
1. 프로젝트 → Storage 탭 → Create Database
2. Database Type: Postgres
3. Database Name: `sunshinetour-db`
4. Region: 가장 가까운 지역 선택 (예: IAD - Washington D.C.)
5. Create 클릭

**데이터베이스 연결 확인:**
- 자동으로 환경 변수가 설정됩니다:
  - `POSTGRES_URL`
  - `POSTGRES_PRISMA_URL`
  - `POSTGRES_URL_NON_POOLING`
  - `POSTGRES_USER`
  - `POSTGRES_HOST`
  - `POSTGRES_PASSWORD`
  - `POSTGRES_DATABASE`

---

### 3️⃣ Vercel Blob Storage 설정

**스토리지 탭에서 Blob 생성:**
1. 프로젝트 → Storage 탭 → Create Database
2. Database Type: Blob
3. Store Name: `sunshinetour-images`
4. Create 클릭

**Blob 연결 확인:**
- 자동으로 환경 변수가 설정됩니다:
  - `BLOB_READ_WRITE_TOKEN`

---

### 4️⃣ 데이터베이스 스키마 적용

**로컬에서 Vercel Postgres에 마이그레이션:**

```bash
# Vercel CLI 설치 (없다면)
npm install -g vercel

# Vercel 로그인
vercel login

# 프로젝트 링크
vercel link

# 스키마 적용
vercel env pull .env.local
node scripts/migrate.js
```

**또는 Vercel 대시보드 사용:**
1. Storage → sunshinetour-db → Query
2. `scripts/schema.sql` 파일 내용 복사
3. SQL Query 창에 붙여넣기
4. Run Query 실행

---

### 5️⃣ 샘플 데이터 입력 (선택사항)

**기존 Cloudflare D1 데이터 내보내기:**

```bash
# Regions 데이터 내보내기
npx wrangler d1 execute sunshinetour-db --local --command="SELECT * FROM regions" --json > regions.json

# Resorts 데이터 내보내기
npx wrangler d1 execute sunshinetour-db --local --command="SELECT * FROM resorts" --json > resorts.json

# Reviews 데이터 내보내기
npx wrangler d1 execute sunshinetour-db --local --command="SELECT * FROM reviews WHERE status='approved'" --json > reviews.json
```

**Postgres로 데이터 가져오기:**
- Vercel 대시보드에서 SQL Query로 INSERT 문 실행
- 또는 마이그레이션 스크립트 작성

---

### 6️⃣ 환경 변수 확인

**Vercel 프로젝트 → Settings → Environment Variables:**

필수 환경 변수:
```
POSTGRES_URL (자동 설정)
POSTGRES_PRISMA_URL (자동 설정)
BLOB_READ_WRITE_TOKEN (자동 설정)
```

---

### 7️⃣ 배포 실행

**방법 1: GitHub 푸시로 자동 배포**
```bash
git add .
git commit -m "Migrate to Vercel with Postgres and Blob Storage"
git push origin main
```

**방법 2: Vercel CLI로 직접 배포**
```bash
vercel --prod
```

**배포 진행 확인:**
- Vercel 대시보드 → Deployments 탭
- 빌드 로그 확인
- 3-5분 대기

---

### 8️⃣ 배포 후 확인

**프로덕션 URL:**
```
https://luxurious-honeymoon-website-design.vercel.app/
```

**테스트:**
```bash
# 메인 페이지
curl https://luxurious-honeymoon-website-design.vercel.app/

# API 헬스체크
curl https://luxurious-honeymoon-website-design.vercel.app/api/health

# Regions API
curl https://luxurious-honeymoon-website-design.vercel.app/api/regions

# Resorts API
curl https://luxurious-honeymoon-website-design.vercel.app/api/resorts

# Reviews API
curl https://luxurious-honeymoon-website-design.vercel.app/api/reviews?status=approved
```

---

## 🎯 마이그레이션 체크리스트

### 완료된 항목
- [x] Vercel용 API 코드 작성 (Hono + @vercel/postgres)
- [x] Postgres 스키마 생성
- [x] Vercel Blob Storage 연동
- [x] vercel.json 설정
- [x] API 라우트 구조화

### 진행 필요
- [ ] Vercel 프로젝트 생성 및 GitHub 연결
- [ ] Vercel Postgres 데이터베이스 생성
- [ ] Vercel Blob Storage 생성
- [ ] 데이터베이스 스키마 적용
- [ ] 샘플 데이터 이전 (선택사항)
- [ ] 배포 실행 및 확인

---

## 📊 주요 변경사항

### 데이터베이스
- **이전**: Cloudflare D1 (SQLite)
- **이후**: Vercel Postgres (PostgreSQL)
- **변경점**: 
  - `INTEGER` → `INTEGER` (타임스탬프는 TIMESTAMP로 변경)
  - `BOOLEAN` 기본값: `1` → `TRUE`
  - `TEXT` JSON 필드 → `JSONB`

### 스토리지
- **이전**: Cloudflare R2
- **이후**: Vercel Blob Storage
- **변경점**:
  - R2 `put()` → Blob `put()`
  - Public URL 자동 생성

### API
- **이전**: Cloudflare Workers (Hono)
- **이후**: Vercel Serverless Functions (Hono + handle)
- **변경점**:
  - `c.env.DB` → `@vercel/postgres` import
  - `c.env.IMAGES` → `@vercel/blob` import

---

## 🔧 문제 해결

### API 404 오류
- vercel.json의 rewrites 설정 확인
- api/index.ts 파일 존재 확인

### 데이터베이스 연결 오류
- 환경 변수 POSTGRES_URL 확인
- 데이터베이스 스키마 적용 확인

### 이미지 업로드 오류
- BLOB_READ_WRITE_TOKEN 환경 변수 확인
- 파일 크기 제한 (10MB) 확인

---

## 📞 다음 단계

1. **Vercel 대시보드 접속**: https://vercel.com/dashboard
2. **프로젝트 생성**: GitHub 저장소 연결
3. **Postgres + Blob 생성**: Storage 탭에서 설정
4. **스키마 적용**: scripts/schema.sql 실행
5. **배포 실행**: git push 또는 vercel CLI
6. **확인**: API 엔드포인트 테스트

준비되면 알려주세요! 🚀
