# 태권크리 본관 통합 운영관리 PWA

Next.js 기반 모바일·PC 반응형 PWA 초기 프로젝트입니다.

## 현재 포함된 것
- 7개 메인 메뉴 및 반응형 대시보드
- 업무 관리 일일/주간/월간 체크리스트 (브라우저 로컬 저장)
- 학생 등록/삭제 (브라우저 로컬 저장)
- 훈련 일지 작성 및 분야 선택 (브라우저 로컬 저장)
- 간략 주간 보고서 작성 (브라우저 로컬 저장)
- PWA manifest, 서비스 워커, 설치 유도
- Supabase 데이터베이스 구조 초안 (`supabase/schema.sql`)

## 중요: 현재 단계의 제한
현재 버전은 화면과 기본 입력 흐름을 확인하는 초기 빌드입니다. 데이터는 해당 브라우저/기기에만 저장되며, 아직 로그인·공유 DB·파일 업로드·역할 권한·실제 클라우드 백업은 연결되지 않았습니다. 다른 기기와 데이터가 자동 공유되는 운영 서비스로 사용하면 안 됩니다. 이 기능들은 Supabase 프로젝트 연결 후 다음 단계에서 구현해야 합니다.

## 로컬 실행
Node.js 20 이상 권장.

```bash
npm install
npm run dev
```
브라우저에서 http://localhost:3000 접속.

## Vercel 무료 배포
1. GitHub 계정으로 로그인하고 새 private repository 생성
2. 이 프로젝트 폴더 내용을 repository에 업로드
3. Vercel에서 GitHub 연결 후 해당 repository Import
4. Framework Preset은 Next.js, Build Command는 `npm run build`로 설정하고 Deploy
5. 배포가 끝나면 Vercel이 실제 `*.vercel.app` 주소를 발급

현재 폴더는 Supabase 연결 전 초기 빌드입니다. Supabase 환경변수는 `.env.example`을 참고하되, 실제 URL과 키는 Supabase 프로젝트 생성 후 입력합니다. 서비스 키(service_role)는 브라우저 환경변수에 절대 넣지 마세요.

## 저장 공간 관리 화면
메인 화면에 관리자용 저장 공간 관리 영역을 추가했습니다. 현재는 실제 사용량을 임의로 표시하지 않고 '연동 예정'으로 안내합니다. Supabase Storage 연결 후 실제 총용량·사용량·잔여용량, 파일 종류별 사용량, 80% 경고 및 파일 관리 기능을 연결해야 합니다.
