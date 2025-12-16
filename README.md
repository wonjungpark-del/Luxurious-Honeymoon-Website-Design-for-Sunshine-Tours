# SUNSHINE TOUR - 프리미엄 허니문 & 해외 여행 전문

## 프로젝트 개요
- **프로젝트명**: Sunshine Tour (선샤인투어)
- **목적**: 프리미엄 허니문 및 해외 여행 전문 웹사이트
- **주요 기능**: 지역별 리조트 안내, 관리자 페이지를 통한 DB 기반 컨텐츠 관리, 이미지 업로드

## 🌐 URL
- **샌드박스**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai
- **프로덕션**: https://1f696e70.sunshinetour.pages.dev (배포 예정)
- **GitHub**: https://github.com/사용자명/webapp (예정)

## ✨ 완료된 기능

### 1. 메인 페이지
- ✅ 프리미엄 디자인 (골드 색상 + Montserrat 폰트)
- ✅ 커스텀 로고 (태양 떠오르는 디자인 + SUNSHINE TOUR)
- ✅ 영어 네비게이션 (Destinations, Reviews, Contact, Admin)
- ✅ 한국인 모델 허니문 히어로 이미지 (얼굴 선명하게 보임)
- ✅ 지역별 드롭다운 메뉴

### 2. 지역 페이지 (Region Pages)
- ✅ 12개 지역 페이지 자동 생성
  - 태국: 카오락, 코사무이, 푸켓, 끄라비, 파타야
  - 인도네시아: 발리, 롬복
  - 몰디브
  - 멕시코: 칸쿤
  - 미국(하와이): 마우이, 오아후, 빅아일랜드
- ✅ 각 지역별 히어로 섹션 + 지역 설명
- ✅ 지역 내 모든 리조트 리스트 표시 (개별 리조트 페이지 삭제됨)
- ✅ 각 리조트마다:
  - 메인 이미지 (500px)
  - 카테고리 뱃지 (럭셔리/프리미엄/스탠다드)
  - 리조트 설명 (4줄 제한)
  - 4-6개 주요 특징
  - 사진 갤러리 (썸네일 클릭시 모달로 확대)
  - 상담 신청 버튼

### 3. DB 기반 관리 시스템 ⭐ NEW
- ✅ Cloudflare D1 Database 연동
- ✅ 관리자 로그인 (비밀번호: admin1234)
- ✅ **지역 관리**
  - 지역 목록 조회 (12개 지역)
  - 지역 추가/수정/삭제 API
  - 지역 정보: 코드, 국가, 한글명, 영문명, 설명, 이미지 URL
- ✅ **리조트 관리**
  - 리조트 목록 조회 (8개 리조트)
  - 리조트 추가/수정/삭제 API
  - 리조트 정보: 지역ID, 한글명, 영문명, 카테고리, 설명, 메인 이미지, 갤러리 이미지, 특징
- ✅ **후기 관리** ⭐ NEW
  - 후기 목록 조회 (상태별/여행지별 필터)
  - 후기 상세보기 (제목, 내용, 평점, 이미지)
  - 후기 승인/거절 (pending → approved/rejected)
  - 추천 후기 등록/해제 (is_featured)
  - 후기 삭제
- ✅ **온라인 상담(문의) 관리** ⭐ NEW
  - 문의 목록 조회 (상태별 필터)
  - 문의 상세보기 (고객 정보, 여행 정보, 문의 내용)
  - 문의 상태 변경 (미처리 → 처리중 → 완료)
  - 문의 삭제
- ✅ **이미지 업로드 API** (R2 Storage 연동)
  - 드래그 앤 드롭 지원
  - 최대 10장 업로드 (각 10MB 제한)
  - 자동 이미지 최적화 (클라이언트 사이드)
  - 업로드 타입: regions, resorts, reviews

### 4. 기타 페이지
- ✅ 후기 페이지 (reviews.html)
- ✅ 문의 페이지 (inquiry.html)
- ✅ 모든 페이지 통일된 로고 + 영어 네비게이션

## 📊 데이터 구조

### Database Schema

#### regions (지역)
```sql
- id: TEXT PRIMARY KEY
- code: TEXT (khao-lak, koh-samui, bali, maldives 등)
- country: TEXT (태국, 인도네시아, 몰디브 등)
- name_ko: TEXT (한글 지역명)
- name_en: TEXT (영문 지역명)
- description: TEXT (지역 설명)
- image_url: TEXT (지역 대표 이미지)
- display_order: INTEGER (표시 순서)
- is_active: INTEGER (활성화 여부)
- created_at: INTEGER (생성 시간)
- updated_at: INTEGER (수정 시간)
```

#### resorts (리조트)
```sql
- id: TEXT PRIMARY KEY
- region_id: TEXT (지역 ID - FK)
- name_ko: TEXT (한글 리조트명)
- name_en: TEXT (영문 리조트명)
- category: TEXT (luxury/premium/standard)
- description: TEXT (리조트 설명)
- main_image_url: TEXT (메인 이미지)
- gallery_images: TEXT (JSON 배열)
- features: TEXT (JSON 배열 - 특징)
- display_order: INTEGER (표시 순서)
- is_active: INTEGER (활성화 여부)
- created_at: INTEGER (생성 시간)
- updated_at: INTEGER (수정 시간)
```

#### reviews (후기)
```sql
- id, destination, title, content, rating, author_name, travel_date, image_url, status, is_featured
```

#### inquiries (문의)
```sql
- id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status
```

### Storage Services
- **D1 Database**: SQLite 기반 지역/리조트/후기/문의 데이터
- **R2 Storage**: 이미지 파일 저장 (sunshinetour-images 버킷)

## 📋 API 엔드포인트

### Regions API
- `GET /api/regions` - 지역 목록 조회 (쿼리: country, is_active)
- `GET /api/regions/:id` - 지역 상세 조회
- `POST /api/regions` - 지역 추가
- `PUT /api/regions/:id` - 지역 수정
- `DELETE /api/regions/:id` - 지역 삭제

### Resorts API
- `GET /api/resorts` - 리조트 목록 조회 (쿼리: region_id, is_active)
- `GET /api/resorts/:id` - 리조트 상세 조회
- `POST /api/resorts` - 리조트 추가
- `PUT /api/resorts/:id` - 리조트 수정
- `DELETE /api/resorts/:id` - 리조트 삭제

### Reviews API
- `GET /api/reviews` - 후기 목록 조회
- `GET /api/reviews/:id` - 후기 상세 조회
- `POST /api/reviews` - 후기 작성
- `PATCH /api/reviews/:id` - 후기 상태 변경
- `DELETE /api/reviews/:id` - 후기 삭제

### Inquiries API
- `GET /api/inquiries` - 문의 목록 조회
- `GET /api/inquiries/:id` - 문의 상세 조회
- `POST /api/inquiries` - 문의 작성
- `PATCH /api/inquiries/:id` - 문의 상태 변경
- `DELETE /api/inquiries/:id` - 문의 삭제

### Upload API
- `POST /api/upload` - 이미지 업로드 (FormData, 최대 10장, 각 10MB)

## 🚀 사용 방법

### 관리자 페이지 접속
1. `/admin` 페이지 접속
2. 비밀번호 입력: `admin1234`
3. 대시보드에서 지역/리조트 관리

### 지역 추가
1. "지역 관리" 탭 선택
2. "새 지역 추가" 버튼 클릭
3. 지역 정보 입력 (코드, 국가, 한글명, 영문명, 설명)
4. 이미지 업로드 (드래그 앤 드롭)
5. 저장 버튼 클릭

### 리조트 추가
1. "리조트 관리" 탭 선택
2. "새 리조트 추가" 버튼 클릭
3. 리조트 정보 입력 (지역 선택, 한글명, 영문명, 카테고리, 설명)
4. 메인 이미지 업로드
5. 갤러리 이미지 업로드 (최대 10장)
6. 특징 추가 (4-7개 권장)
7. 저장 버튼 클릭

### 이미지 업로드
- 드래그 앤 드롭으로 간편 업로드
- 자동으로 최적화 (800KB 이하로 압축)
- R2 Storage에 자동 저장
- Public URL 자동 생성

## 🛠️ 배포 상태
- **플랫폼**: Cloudflare Pages
- **상태**: ✅ 샌드박스 테스트 완료 / ❌ 프로덕션 배포 대기
- **기술 스택**: 
  - Frontend: HTML + TailwindCSS + Vanilla JS
  - Backend: Hono + TypeScript
  - Database: Cloudflare D1 (SQLite)
  - Storage: Cloudflare R2
  - Deployment: Cloudflare Pages + Wrangler
- **마지막 업데이트**: 2024-12-16

## 🔧 개발 환경 실행

### 로컬 개발
```bash
# DB 마이그레이션 (최초 1회)
npm run db:migrate:local

# 샘플 데이터 로드
npx wrangler d1 execute sunshinetour-db --local --file=./seed-data.sql

# 빌드
npm run build

# 개발 서버 시작 (PM2)
pm2 start ecosystem.config.cjs

# 서비스 URL 확인
curl http://localhost:3000
```

### 프로덕션 배포
```bash
# DB 마이그레이션 (프로덕션)
npm run db:migrate:prod

# 샘플 데이터 로드 (프로덕션 - 선택사항)
npx wrangler d1 execute sunshinetour-db --file=./seed-data.sql

# 프로덕션 배포
npm run deploy
```

## 📝 아직 구현되지 않은 기능
- ❌ 관리자 페이지에서 지역별 리조트 미리보기
- ❌ 이미지 썸네일 자동 생성
- ❌ 대시보드 통계 (방문자, 인기 리조트, 최근 문의 등)
- ❌ 이메일 알림 시스템 (문의 접수 시 관리자에게 알림)
- ❌ 프로덕션 배포 및 커스텀 도메인 설정
- ❌ 후기 작성 페이지 (고객용)
- ❌ 문의 작성 페이지 개선

## 📌 다음 단계 추천
1. **관리자 UI 개선**: 현재 admin 페이지 디자인을 프리미엄 스타일로 업그레이드
2. **지역 페이지 동적 생성**: DB 데이터를 기반으로 지역 페이지 자동 렌더링
3. **이미지 최적화**: R2에서 이미지 썸네일 자동 생성 기능 추가
4. **후기/문의 관리**: 관리자 페이지에서 후기 승인 및 문의 답변 기능
5. **프로덕션 배포**: Cloudflare Pages에 배포 및 커스텀 도메인 연결
6. **SEO 최적화**: 메타 태그 및 구조화된 데이터 추가

## 📄 파일 구조
```
webapp/
├── src/
│   └── index.tsx           # Hono 백엔드 (API 엔드포인트)
├── public/
│   ├── index.html          # 메인 페이지
│   ├── admin.html          # 관리자 페이지 (DB 기반)
│   ├── reviews.html        # 후기 페이지
│   ├── inquiry.html        # 문의 페이지
│   ├── thailand-khao-lak.html  # 지역 페이지들...
│   └── static/
│       ├── css/style.css
│       └── images/
│           ├── logo-sunrise.png
│           ├── hero-honeymoon-korean.jpg
│           └── resorts/      # 지역별 리조트 이미지
├── migrations/
│   └── 0001_initial_schema.sql  # DB 스키마
├── seed-data.sql           # 샘플 데이터 (12 지역 + 8 리조트)
├── wrangler.jsonc          # Cloudflare 설정
├── package.json            # Dependencies
└── ecosystem.config.cjs    # PM2 설정
```

---

**💡 프로젝트 특징**: 정적 HTML 파일 기반에서 DB 기반 CMS로 전환하여 관리자가 웹 브라우저에서 직접 지역과 리조트를 추가/수정/삭제할 수 있는 시스템으로 업그레이드되었습니다.
