# K2 IoT Database 학습 자료

MySQL/MariaDB를 활용한 데이터베이스 학습 자료 모음입니다. 기초부터 고급 개념까지 체계적으로 구성되어 있습니다.

## 📚 프로젝트 구조

```
k2_iot_db/
├── a_개발환경/           # MySQL 개발 환경 설정
├── b_SQL기초/            # SQL 기본 개념 및 명령어
├── c_ddl/                # 데이터 정의어 (CREATE, ALTER, DROP)
├── d_dml/                # 데이터 조작어 (INSERT, UPDATE, DELETE)
├── e_select/             # 데이터 조회 및 서브쿼리
├── f_join/               # 테이블 조인 (INNER, OUTER, etc)
├── g_프로그래밍/         # 변수, 형변환, 스토어드 프로시저
├── h_트리거/             # 트리거 생성 및 활용
├── i_erd/                # ERD 설계 및 모델링
├── j_인덱스/             # 인덱스 생성 및 최적화
├── k_정규화/             # 데이터베이스 정규화 (1NF ~ BCNF)
├── l_트랜잭션/           # 트랜잭션 처리 및 격리 수준
├── m_뷰/                 # 뷰(View) 생성 및 관리
└── n_dcl/                # 데이터 제어어 (GRANT, REVOKE)
```

## 🗃️ 샘플 데이터베이스

### 1. baseball_league.sql
야구 리그 관리 데이터베이스
- **teams 테이블**: 팀 정보 (팀ID, 이름, 도시, 창단년도)
- **players 테이블**: 선수 정보 (선수ID, 이름, 포지션, 생년월일, 소속팀)
- 외래키 관계를 통한 팀-선수 연결

### 2. korea_db.sql
회원 및 구매 관리 시스템
- **members 테이블**: 회원 정보 (성별, 지역, 등급, 포인트, 가입일)
- **purchases 테이블**: 구매 내역 (상품코드, 구매일, 금액, 수량)
- 회원 등급 시스템 (Bronze ~ Diamond)

### 3. market_db.sql
인터넷 마켓 데이터베이스
- **member 테이블**: 아이돌 그룹 정보 (그룹명, 인원, 주소, 연락처, 평균키, 데뷔일)
- **buy 테이블**: 구매 내역 (제품명, 분류, 단가, 수량)
- 연예인 그룹 기반의 구매 패턴 분석 예제

## 📖 학습 순서

1. **개발환경 설정** (a_개발환경)
   - MySQL 설치 및 설정
   - 기본 명령어 익히기

2. **SQL 기초** (b_SQL기초)
   - SQL 명령어 종류 (DDL, DML, DCL, TCL)
   - 데이터베이스 생성 및 관리

3. **데이터 정의** (c_ddl)
   - 테이블 생성 및 수정
   - 데이터 타입 이해
   - SQL 명명 규칙

4. **데이터 조작** (d_dml)
   - 데이터 무결성 개념
   - 제약조건 설정 (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK 등)
   - INSERT, UPDATE, DELETE 문

5. **데이터 조회** (e_select)
   - SELECT 문 기초 및 고급
   - 서브쿼리 활용
   - 다양한 연습 문제

6. **조인** (f_join)
   - INNER JOIN
   - OUTER JOIN (LEFT, RIGHT, FULL)
   - 기타 조인 (CROSS, SELF)

7. **프로그래밍 요소** (g_프로그래밍)
   - 변수 선언 및 사용
   - 데이터 형변환
   - 스토어드 프로시저

8. **고급 기능**
   - 트리거 (h_트리거)
   - 뷰 (m_뷰)
   - 인덱스 최적화 (j_인덱스)

9. **데이터베이스 설계**
   - ERD 모델링 (i_erd)
   - 정규화 (k_정규화): 1NF, 2NF, 3NF, BCNF, 반정규화

10. **트랜잭션 및 보안**
    - 트랜잭션 처리 (l_트랜잭션)
    - 권한 관리 (n_dcl)

## 🚀 시작하기

### 사전 요구사항
- MySQL 8.0 이상 또는 MariaDB 10.5 이상
- MySQL Workbench 또는 다른 SQL 클라이언트

### 샘플 데이터베이스 설치

```sql
-- 1. baseball_league 데이터베이스
source baseball_league.sql;

-- 2. korea_db 데이터베이스
source korea_db.sql;

-- 3. market_db 데이터베이스
source market_db.sql;
```

### 실습 방법
1. 각 폴더의 파일을 순서대로 학습
2. SQL 파일을 MySQL Workbench에서 실행
3. 주석을 참고하여 코드 이해
4. 직접 쿼리를 수정하고 실행해보기

## 💡 주요 학습 내용

### DDL (Data Definition Language)
- CREATE, ALTER, DROP 문을 통한 데이터베이스 객체 관리
- 다양한 데이터 타입 이해 및 활용

### DML (Data Manipulation Language)
- INSERT, UPDATE, DELETE를 통한 데이터 조작
- 제약조건을 통한 데이터 무결성 보장

### DQL (Data Query Language)
- SELECT 문의 다양한 활용
- WHERE, GROUP BY, HAVING, ORDER BY 절
- 서브쿼리와 조인을 활용한 복잡한 쿼리

### 고급 기능
- 스토어드 프로시저로 복잡한 로직 캡슐화
- 트리거로 자동화된 데이터 처리
- 뷰를 통한 데이터 추상화
- 인덱스를 통한 쿼리 성능 최적화

### 데이터베이스 설계
- ERD를 통한 데이터베이스 모델링
- 정규화를 통한 데이터 중복 제거
- 트랜잭션을 통한 데이터 일관성 보장

## 📝 주요 실습 예제

- **회원 관리 시스템**: 회원 등급별 포인트 관리, 구매 패턴 분석
- **야구 리그**: 팀과 선수 간의 관계 관리
- **인터넷 마켓**: 아이돌 그룹의 상품 구매 내역 분석

## 🔧 SQL 실행 단축키

- **전체 SQL 실행**: `Ctrl + Shift + Enter`
- **선택 영역 실행**: `Ctrl + Enter`

## 📌 참고사항

- 각 SQL 파일에는 상세한 주석이 포함되어 있습니다
- 실습 전 샘플 데이터베이스를 먼저 생성하세요
- DROP 명령어 사용 시 주의하세요 (데이터 손실 가능)

## 🎯 학습 목표

이 자료를 통해 다음을 습득할 수 있습니다:
- SQL 기본 문법 및 활용
- 관계형 데이터베이스 설계 원리
- 데이터 무결성 및 정규화 개념
- 데이터베이스 성능 최적화 기법
- 트랜잭션 처리 및 동시성 제어

---

**학습에 도움이 필요하면 각 폴더의 파일을 순서대로 참고하세요!**
