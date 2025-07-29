/*
	1. PK(Primay Key) - 중복 안됨, 비워둘수 없음 null허용 안됨
    2. FK(Foreign Key) - 다른 테이블의 PK값을 참조하는 컬럼(테이블 간의 연결)
    3. Unique
    : 특정 열의 값이 중복되면 안됨
    - null허용 가능(비워둘 수 있음)
    - 한 테이블에 여러 개 지정 가능
    EX) 아이디, 이메일, 주민번호 등에 사용
*/
CREATE TABLE `users`(
	user_id BIGINT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    email vARCHAR(100) UNIQUE,
    resident_number VARCHAR(100) UNIQUE
);
INSERT INTO `users`
VALUES
(1,'qwe123','qwe123123','qwe123@example.com', '123456');
#insert into `users`
#values
#(2,'qwe124','qwe234234','qwe123@example.com', '654321'); Error Code: 1062. Duplicate entry 'qwe123@example.com' for key 'users.email'
INSERT INTO `users`
VALUES
(2,'qwe124','qwe234234',null, '654321'); -- unique는 null값 삽입가능
SELECT * FROM `users`;

/*
	 4. Check 제약 조건
     : 입력 값이 특정 조건을 만족해야만 삽입
*/
CREATE TABLE employees(
	employee_id BIGINT PRIMARY KEY,
    name VARCHAR(100),
    age INT(100), -- 정수의 최대값 제약
    # check 제약 조건 사용 방법
    # check(조건 작성 - 조건식은 다양한 연산자 사용)
    CHECK(age>= 20)
);

INSERT INTO `employees`
VALUES
(1, '이상은',30),
(2, '홍기수',20),
#(3, '배혜진',10),Error Code: 3819. Check constraint 'employees_chk_1' is violated.
(4, '김태양',30);

INSERT INTO `employees`
VALUES
(5, '안미향', NULL); -- check 제약 조건은 null값 여부 확인 안함

SELECT * FROM `employees`;
/*
	5. NOT NULL 제약 조건
    : 특정 열에 NULL값을 허용하지 않는것  - 비워질 수 없음
*/

CREATE TABLE `contacts`(
	contact_id BIGINT PRIMARY KEY, -- 자동 not null
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL
);
INSERT INTO `contacts`
VALUES
	(1, '권민현', '010-1111-2222'),
    (2, '김세훈', '010-2222-3333');
	#(2, '김세훈', null);Error Code: 1048. Column 'phone' cannot be null
SELECT * FROM `contacts`;

/*
	6. Default 제약조건
    : 테이블의 열에 값이 입력되지 않으면 자동으로 기본값을 넣어주는 제약 조건
    - 선택적 필드에 대한 입력을 단순화(데이터 무결성 유지)
*/
CREATE TABLE `carts`(
	cart_id BIGINT PRIMARY KEY,
    product_name VARCHAR(100),
    #default 제약 조건
    # 컬럼명 데이터 타입 default 기본값(테이터타입 지키기)
    quantity INT DEFAULT 1
);
INSERT INTO `carts`
VALUES
	(1, '노트북', 3),
	(2, '스마트폰', NULL),
	(3, '테블릿',2);
    -- default 설정 컬럼을 비울순 없음. null값 입력 시 null값이 지정 가능(기본값 설정 안됨)
SELECT * FROM `carts`;

# default 값 사용 방법
# 컬럼 자체에 값 대입이 일어나면 안됨
INSERT INTO `carts` 
VALUES
#carts의 컬럼을 정의 순서대로 데이터 전달
# : quantity 수량을 제외한 데이터를 전달할 경우 > 테이블 명 옆에 (삽입하고자 하는 컬럼명만 나열)
();
INSERT INTO `carts` (cart_id, product_name)
VALUES
(4,'이어폰'),
(5,'스마트폰');

SELECT * FROM `carts`;

#++++++++++++++++
# +) 제약 조건 사용시 여러 개 동시 지정 가능
# EX) NOT NULL + CHECK
CREATE TABLE `multiple`(
	multiple_col INT NOT NULL CHECK(multiple_col >10)
);
INSERT INTO `multiple`
VALUES
(11);


DROP DATABASE IF EXISTS `example`;












