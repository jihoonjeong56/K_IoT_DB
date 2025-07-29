### 제약 조건(Constraint) ###
# : 데이터의 정확성, 일관성, 신뢰성, 무결성을 유지하기 위해, DB 시스템을 활용하여 강제하는 규칙

# 1. 제약 조건 사용 목적
# 무결성 유지 : 잘못된 데이터 삽입 방지
# 오류 방지 : 잘못된 입력, 삭제, 변경 등을 방지
# 관계 유지 : 테이블 간의 연결을 확실하게 유지

# 2. 제약 조건의 종류
# 1) Primary Key(기본키)
# 2) Foriegn Key(외래키, 참조키)
# 3) Unique
# 4) Check
# 5) NOT NULL
# 6) Default
/*
	1. Primary Key(PK)
    : 기본키, 각 행을 고유하게 구분하는 역할(레코드 구분의 식별자)
    - 중복될수 없음(고유성), null 허용 안됨(반드시 유효한 데이터를 포함)
    
    cf) 유일성 제약
		- 하나의 테이블 당 하나의 기본 키만 지정 가능
        > 테이블의 특성을 반영한 열 선택 권장 || PK 컬럼 따로 생성 권장
         EX) members(member_id), books(book_id | isbn)   
*/
DROP DATABASE IF EXISTS `example`;
CREATE DATABASE `example`;
USE `example`;
# 기본 키 지정 방법
# 1) 테이블 생성 시 PK 컬럽에 명시 : 컬럼명 데이터타입 PRIMARY KEY,
CREATE TABLE `students`(
	#student_id BIGINT PRIMARY KEY,
    student_id BIGINT,
    name VARCHAR(100),
    PRIMARY KEY(student_id)
);
# 2) 테이블 생성 시 마지막 열에 제약 조건 명시 : PRIMARY KEY(설정할 컬럼명)
DESCRIBE `students`;  #테이블 구조 확인(데이터 확인 안됨)

INSERT INTO `students`
VALUES
(1, '이승아'),
(2, '이도경'),
(3, '조승범');

SELECT * FROM `students`;
#insert into `students`
#values
#(1, '김명진'); > PRIMARY KEY는 값의 중목이 불가

# cf) DDL의 수정 ALTER
# : 테이블 구조의 제약 조건 수정
ALTER TABLE `students`
DROP PRIMARY KEY;
# 기본 테이블의 기본키 제약 조건 삭제시  not null에 대한 조건은 사라지지 않음
DESCRIBE `students`;

ALTER TABLE `students`
MODIFY `student_id` BIGINT NULL; -- not null 을 null로 수정
DESCRIBE `students`;

# '기본 테이블'에 제약 조건 추가
ALTER TABLE `students`
ADD PRIMARY KEY (student_id);
DESCRIBE `students`;

/*
	2. Foreign Key(FK)
    : 외래, 참조 키
    - 두 테이블 사이의 관계를 연결, 데이터의 무결성 유지
    - 다른 테이블의 기본 키를 참조하여 관계를 표현함
    - 두 테이블 간 연결(RDBMS)
    
    +) 기본 테이블(기본키가 있는 테이블)
    +) 참조 테이블(외대키가 있는 테이블)
    
    회원(member) - 주문(orders)
    > 고객이 실제로 존재한느지 확인, 고객과 주문 간의 관계 명시
*/

CREATE TABLE `members`(
	member_id BIGINT PRIMARY KEY,
    name VARCHAR(100)
);
DROP TABLE if exists `members`;
CREATE TABLE `orders`(
	order_id BIGINT PRIMARY KEY,
    order_date DATE,
    member_id BIGINT,
    #외래키 지정 방법 
    #foreign key (참조컬럼, 현 테이블의 컬럼명) references 기본 테이블(기본 컬럼, pk컬럼)
    foreign key (member_id) references `members` (member_id)
);
DROP TABLE IF EXISTS `orders`;

INSERT INTO `members`
VALUES
(123,'김보민');

INSERT INTO `orders`
VALUES
(1, '2025-07-29', 123);

### 외래키 제약 조건 수정(삭제 &추가)
# cf) 외래 키 제약 조건 삭제 시 - 해당 데이터를 참조하는 데이터가 있을 경우 삭제 불가
ALTER TABLE `orders`
DROP FOREIGN KEY `member_id`;

TRUNCATE TABLE `orders`;
SELECT * FROM `orders`;

# 1) 제약 조검 이름 검색 필수
# where 조건 내에서 테이블 명과 컬럼명을 테이터러럼 사용: 따옴표 지정
# > 문법 그 자체로 인식
SELECT CONSTRAINT_name
FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'orders' AND COLUMN_NAME = 'member_id'; 

# 2) 참조 테이블의 외래 키 삭제
ALTER TABLE `orders`
DROP FOREIGN KEY orders_ibfk_1;

DESCRIBE `orders`;
# > MUL : 외래키 지정시 MySQL이 자동으로 인덱스(index) 생성
#	- 외래키 삭제 후에도 존재
SELECT CONSTRAINT_name
from information_schema.key_column_usage
where table_name = 'orders' and column_name = 'member_id'; 

# 기존 테이블의 외래키 제약 조건 추가
ALTER TABLE `orders`
ADD CONSTRAINT
FOREIGN KEY(member_id)
REFERENCES `members` (member_id);

DESC `orders`;
# : foreign key 설정은 desc 에서 MUL로 표시
DESC `members`;