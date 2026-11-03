-- 다음 단계에서 Supabase 프로젝트에 적용할 기본 데이터 구조 초안
create table if not exists public.students (
 id uuid primary key default gen_random_uuid(), name text not null, goal text, created_at timestamptz default now()
);
create table if not exists public.training_records (
 id uuid primary key default gen_random_uuid(), student_id uuid references public.students(id) on delete cascade,
 training_date date not null, categories text[] not null default '{}', content text, created_at timestamptz default now()
);
create table if not exists public.attendance (
 id uuid primary key default gen_random_uuid(), student_id uuid references public.students(id) on delete cascade,
 attendance_date date not null, status text not null check(status in ('출석','결석','지각','조퇴')), created_at timestamptz default now()
);
create table if not exists public.consultations (
 id uuid primary key default gen_random_uuid(), student_id uuid references public.students(id) on delete cascade,
 consultation_date date not null, audience text, content text, follow_up text, created_at timestamptz default now()
);
create table if not exists public.weekly_reports (
 id uuid primary key default gen_random_uuid(), period text not null, author text, facility_notes text, issues_and_solutions text, weekly_summary text, created_at timestamptz default now()
);
create table if not exists public.tasks (
 id uuid primary key default gen_random_uuid(), title text not null, cadence text not null check(cadence in ('매일','매주','매월')),
 completed boolean not null default false, completed_at timestamptz
);
create table if not exists public.partners (
 id uuid primary key default gen_random_uuid(), name text not null, contact text, notes text, created_at timestamptz default now()
);
create table if not exists public.marketing_posts (
 id uuid primary key default gen_random_uuid(), channel text not null, title text, posted_on date, url text, notes text, created_at timestamptz default now()
);
-- 운영 배포 전: Supabase Auth 기반 사용자 권한 및 RLS 정책을 반드시 설정할 것.
