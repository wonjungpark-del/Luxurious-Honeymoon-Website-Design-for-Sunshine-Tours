# SUNSHINE TOUR - 프리미엄 허니문 및 해외 여행 전문 웹사이트

## 📋 프로젝트 개요

- **프로젝트명**: Sunshine Tour
- **목적**: 프리미엄 허니문 및 해외 여행 전문 웹사이트
- **주요 기능**: 
  - 지역별 리조트 안내
  - 데이터베이스 기반 컨텐츠 관리 (Admin)
  - 이미지 업로드 및 저장
  - 고객 후기 및 문의 관리

## 🔗 URL

- **Production**: https://luxurious-honeymoon-website-design.vercel.app/
- **GitHub**: https://github.com/wonjungpark-del/Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours

## 🏗️ 기술 스택

### Frontend
- HTML5, CSS3 (TailwindCSS via CDN)
- Vanilla JavaScript
- Responsive Design

### Backend
- **Vercel Serverless Functions** (TypeScript)
- **Neon Postgres** (Serverless PostgreSQL)
- **Vercel Blob Storage** (이미지 저장소)

### Deployment
- **Platform**: Vercel
- **Auto Deploy**: GitHub 연동 자동 배포

## 📁 프로젝트 구조

```
webapp/
├── api/                      # Vercel Serverless Functions
│   ├── _db.ts               # Database helper functions
│   ├── health.ts            # Health check endpoint
│   ├── regions.ts           # Regions CRUD API
│   ├── resorts.ts           # Resorts CRUD API
│   ├── reviews.ts           # Reviews CRUD API
│   ├── inquiries.ts         # Inquiries CRUD API
│   └── upload.ts            # Image upload to Vercel Blob
├── public/                  # Static files (auto-served by Vercel)
│   ├── index.html          # Main page
│   ├── admin.html          # Admin dashboard
│   ├── reviews.html        # Reviews page
│   ├── inquiry.html        # Inquiry form
│   └── static/             # CSS, JS, Images
│       ├── css/
│       ├── js/
│       └── images/
├── scripts/
│   └── schema.sql          # PostgreSQL schema
├── package.json            # Dependencies
└── tsconfig.json           # TypeScript config
```

## 🗄️ 데이터 아키텍처

### 데이터 모델

1. **Regions** (지역)
   - 12개 지역 (태국, 인도네시아, 몰디브, 멕시코, 하와이 등)
   - 필드: code, country, name_ko, name_en, description, image_url

2. **Resorts** (리조트)
   - 지역별 고급 리조트 정보
   - 필드: region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features

3. **Reviews** (후기)
   - 고객 여행 후기
   - 필드: destination, title, content, rating, author_name, travel_date, image_url, status, is_featured

4. **Inquiries** (문의)
   - 온라인 상담 문의
   - 필드: name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status

### 스토리지 서비스

- **Neon Postgres**: 모든 데이터 저장 (regions, resorts, reviews, inquiries)
- **Vercel Blob Storage**: 이미지 파일 저장 (리조트 사진, 후기 사진 등)

## 🔌 API 엔드포인트

### Health Check
- `GET /api/health` - API 상태 확인

### Regions
- `GET /api/regions` - 전체 지역 목록
- `GET /api/regions?id={id}` - 특정 지역 조회
- `POST /api/regions` - 지역 생성
- `PUT /api/regions?id={id}` - 지역 수정
- `DELETE /api/regions?id={id}` - 지역 삭제

### Resorts
- `GET /api/resorts` - 전체 리조트 목록
- `GET /api/resorts?region_id={id}` - 지역별 리조트 조회
- `GET /api/resorts?id={id}` - 특정 리조트 조회
- `POST /api/resorts` - 리조트 생성
- `PUT /api/resorts?id={id}` - 리조트 수정
- `DELETE /api/resorts?id={id}` - 리조트 삭제

### Reviews
- `GET /api/reviews` - 전체 후기 목록
- `GET /api/reviews?status=approved` - 승인된 후기
- `GET /api/reviews?id={id}` - 특정 후기 조회
- `POST /api/reviews` - 후기 작성
- `PATCH /api/reviews?id={id}` - 후기 상태 변경 (승인/거절)
- `DELETE /api/reviews?id={id}` - 후기 삭제

### Inquiries
- `GET /api/inquiries` - 전체 문의 목록
- `GET /api/inquiries?status=pending` - 대기 중인 문의
- `GET /api/inquiries?id={id}` - 특정 문의 조회
- `POST /api/inquiries` - 문의 작성
- `PATCH /api/inquiries?id={id}` - 문의 상태 변경
- `DELETE /api/inquiries?id={id}` - 문의 삭제

### Upload
- `POST /api/upload` - 이미지 업로드 (multipart/form-data)
  - Form field: `type` (reviews, resorts, regions)
  - Form field: `files` (최대 10장, 각 10MB)

## 🚀 배포 상태

- **Platform**: Vercel
- **Status**: ✅ Active
- **Last Updated**: 2025-12-28

### 배포 방법

1. **GitHub Push 자동 배포**
   ```bash
   git add .
   git commit -m "Update"
   git push origin main
   ```
   - Vercel이 자동으로 감지하고 배포

2. **수동 배포 (Optional)**
   ```bash
   npm run deploy
   ```

## ⚙️ 환경 변수 설정

Vercel 대시보드에서 설정 필요:

### Neon Postgres (자동 설정됨)
- `DATABASE_URL`
- `POSTGRES_URL`
- `POSTGRES_PRISMA_URL`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_HOST`
- `POSTGRES_DATABASE`

### Vercel Blob Storage (자동 설정됨)
- `BLOB_READ_WRITE_TOKEN`

## 📊 데이터베이스 스키마 적용

Neon Postgres 대시보드에서 실행:

1. Neon Console 접속: https://console.neon.tech/
2. SQL Editor 선택
3. `scripts/schema.sql` 내용 복사 및 실행

## ✨ 주요 기능

### 완료된 기능

1. **메인 페이지**
   - 프리미엄 디자인
   - 커스텀 로고
   - 영어 네비게이션
   - 한국인 모델 허니문 히어로 이미지
   - 지역별 드롭다운 메뉴
   - 고객 후기 섹션 (승인된 후기 표시)

2. **지역 페이지 (Region Pages)**
   - 12개 지역 자동 생성
   - 각 지역별 히어로 섹션
   - 지역 내 리조트 리스트
   - 리조트별 상세 정보

3. **리조트 정보**
   - 메인 이미지 (500px)
   - 카테고리 뱃지 (luxury/premium/standard)
   - 설명 (4줄)
   - 특징 (4-6개)
   - 사진 갤러리 (썸네일 클릭 시 모달)
   - 상담 신청 버튼

4. **DB 기반 관리 시스템**
   - Neon Postgres 연동
   - 관리자 로그인 (비밀번호: admin1234)
   - 지역 관리 (CRUD)
   - 리조트 관리 (CRUD)
   - 후기 관리 (승인/거절/삭제)
   - 문의 관리 (상태 변경/삭제)
   - 이미지 업로드 (Vercel Blob Storage)

5. **이미지 업로드**
   - 드래그 앤 드롭
   - 최대 10장 (후기는 5장)
   - 각 파일 최대 10MB
   - 자동 최적화 (클라이언트 측)

### 구현 예정 기능

1. 관리자 페이지 UI 개선
2. 지역 페이지 동적 렌더링
3. 이미지 썸네일 자동 생성
4. 후기/문의 관리 기능 강화
5. SEO 최적화

## 📝 사용 방법

### 관리자 페이지

1. `/admin.html` 접속
2. 비밀번호 입력: `admin1234`
3. 탭 선택:
   - **지역 관리**: 지역 추가/수정/삭제
   - **리조트 관리**: 리조트 추가/수정/삭제
   - **후기 관리**: 후기 승인/거절/삭제
   - **문의 관리**: 문의 상태 변경/삭제

### 이미지 업로드

1. 관리자 페이지에서 이미지 업로드 영역으로 드래그
2. 파일 선택 또는 드롭
3. 자동으로 Vercel Blob Storage에 업로드
4. URL 자동 입력

## 🔧 로컬 개발

```bash
# 의존성 설치
npm install

# 로컬 개발 서버 시작 (Vercel CLI)
npm run dev

# 브라우저에서 http://localhost:3000 접속
```

## 📦 샘플 데이터

- **12개 지역**: 태국, 인도네시아, 몰디브, 멕시코, 하와이 등
- **리조트**: 각 지역별 고급 리조트 정보
- **후기**: 승인된 고객 후기
- **문의**: 온라인 상담 문의

## 🎯 다음 단계 (추천)

1. Neon Postgres 스키마 적용
2. Vercel Blob Storage에 기존 이미지 마이그레이션
3. 관리자 UI 개선
4. SEO 최적화
5. 성능 모니터링

## 📄 라이선스

Private - Sunshine Tour

---

**Last Updated**: 2025-12-28  
**Version**: 2.0 (Vercel Migration)
