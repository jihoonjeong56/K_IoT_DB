##ERD 다이어그램
# : Entity Relationship Diagram
# > Entity(개체, 존재하는 것)들의 Relationship(관계) 를 나타낸 Diagram(표)
# > 데이터(엔티티)와 데이터 간의 관계를 시각적으로 표현한 도표

# 1. 사용 목적
-- 실무에서 DB설계 전, 정보 분석과 설계 방향을 명확하게 정리
-- 팀원 간 효율적인 의사소통 도구

# 2. ERD 구성 요소
# 1) Entity
-- 존재하는 실체(데이터베이스에서 관리 되어야 하는 대상)
-- 고유하게 식별 가능해야 한다. 
-- 사각형 (엔티티명은 사각형 안에 명시)

# 2) 속성
-- 엔티티의 세부정보, 설명 항목
-- 일반 속성(이름, 주소, 전화번호 등), 기본키(PK: 회원 id,  학번 등), 외래키(FK: 주문테이블의 고객 id)
-- 타원형으로 표기(속성명은 원 안에 명시)

# 3) 관계
-- 엔티티 간의 연결과 연관성
-- 마름모 또는 선으로 표현

# cf) 관계 유형
# 1:1 - 한 엔티티가 다른 하나와의 관계(사람
# 1:N - 한 엔티티가 여러개와 관계(교수- 강의, 학생 - 수강 내역, 게시글 -댓글)
# N:N - 여러 엔티티가 서로 다수와 관계(학생들 - 과목들: 중간 테이블이 필요하다.)

# ERD 표현 규칙
# 1) 부모 PK를 자식이 FK로 가짐
#	> 실선 관계 : 자식이 부모의 존재에 종속됨(부모가 있어야만 자식이 존재 - PK + FK)
#	> 점선 관계 : 자식이 독립적인 존재 가능(부모 없이도 자식 생성 가능 - FK)

# 2) 예시1
# 학생과 수강 내역
# 학생 테이블) 부모 테이블 - 학번 PK, 학생명 ...
# 수강 내역 테이블) 자식 테이블 - 수강 ID PK, 학번 FK, 강의명....

#	>> 관계: 1명의 학생은 여러 개의 수강 내열을 가질 수 있음 (1:N 실선 관계)

# 3) 예시 2
# 주문과 주문 상세 내역
# 주문 테이블) 부모 - 주문ID PK, 주문 일시 ...
# 주문 상세 내역 테이블) 자식 - 주문 ID PK, 주문 상품....
#	>> 관계 : 자식 테이블의 기본키가 부모의 기본키를 포함하거나 그대로 사용 (1:1 실선 관계)

# 4) 예시 4
# 회원과 즐겨찾기 프로그램
# 회원테이블) 부모 - 회원ID PK, 이름..
# 즐겨찾기 프로그램 테이블) 자식 - 고유번호 ID PK, 회원번호(FK), 프로그램 명...
#	>> 비회원 또는 임시 사용자도 '즐겨 찾기 기능'에 대해 허용
#		- 회원 없이도 자식 테이블이 존재 가능한 구조로 설계 가능(1:N 점선 관계)

# cf) N:M 관계 처리방법
# : 관계형 데이터베이스(RDBMS)는 직접적인  N:M관계를 허용하지 않음
# - 중간 테이블을 사요하여 분해 
# EX) 학생 - 과목
# 		1명의 학생은 여러 과목을 수강
# 		1개의 과목은 여러 학생이 수강

# 	>> 중간테이블: 수강(student_subject)
#		- 학생 ID (FK)
#		- 과목 ID (FK)
#		>> 연결되는 두 개의 참조값을 복합키 설정
# 		cf) 복합키 : 두 개 이상의 컬럼으로 구성된 기본키

# 		- 수강 날짜 등 추가 속성 정의 가능

CREATE DATABASE IF NOT EXISTS `composite`;
create table student(
	student_id bigint primary key auto_increment
);
create table course(
	course_id bigint primary key auto_increment
);
create table course_enrollment( # 강의 등록 테이블
	student_id bigint,
    course_id bigint,
    enrollment_date date, -- 등록날짜
    primary key(student_id, course_id),
    #>> student_id와 course_id의 조합이 비워질 수 없으며, 둘 다 합쳐저 유일한 값이 되어야 함
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

# MySQL Workbench 에서 ERD 다이어 그램 생성 방법
# 1. 테이블 생성
# 2. 상단 텍스트메뉴바 [Database] 클릭
# 		> Reverse Engineer 클릭
# 3. 연결하고자 하는  Connection 선택 > next
# 4. 생서하고자 하는 스키마(Database) 선택 > next
# 5. execute 실행 - 생성

##ERD 개체-관계 다이어그램의 관계 표시
# | : 정확히 1개
# < : 여러개 (1이상)
# o : 0개 (없어도 됨)

# 예시
# 회원(Member) 1명이 주면(Order)을 여러 개 할 수 있음 (Member |< Order) - 1:N
# 주문(Order) 은 0개 이상의 리뷰(Review)를 가질 수 잇음 (Order o< Review) - 0:N
# 사원 (Employee)은 정확히 하나의 부서(Department)에 소속됨(Employee | Department) - 1:1
