# cf) ddl(definition 정의) - DB 정의 언어
# : CREATE , ALTER , DROP, TRUNCATE

#  DML (Data Manipulation Language)
# : 데이터 조작(관리)언어
# - 데이터를 삽입, 조회, 수정 , 삭제

CREATE DATABASE IF NOT EXISTS `company`;
USE `company`;
CREATE TABLE `example01` (
	name VARCHAR(100),
    age INT,
    major VARCHAR(100)
);
/*
	1. 데이터 삽입(INSERT)
    : 테이블에 행 데이터(레코드)를 입력
    # 기본 형식 #
    insert into 테이블명(열 1,열2....)
    values (값1, 값2...)
    cf) 테이블 명 뒤 열 이름의 나열을 생략할 경우
		values 뒤의 값 순서는 테이블 정의 시 작성한 열의 순서 & 개수와 동일
        >> name , age, major
	cf) 전체 테이블의 컬럼 순서 & 개수와 차이가 나는 경우 반드시 원하고자 하는 열 이름 나열
*/
INSERT INTO `example01`
VALUES
	('오신혁', 20,'IT');
 # 2) 컬럼명 지정
 INSERT INTO `example01`(major,name)
 values('HEALTH','손태경');
 #데이터 삽입 시 NULL 허용 컬럼에 값 입력이 이루어지지 않은 경우 자동으로 NULL값 지정
 #CF) "auto_increment"
 # : 열을 정의할 때 1부터 1씩 증가하는 값을 입력
 # - insert 에서는 해당 열이 없다고 가정하고 입력
 # - 해당 옵션이 지정된 컬럼은 반드시 PK 값으로 지정
 CREATE TAble `example02`(
	 # 컬럼명 데이터 타입[primary key] [auto_increament] / 옵션 순서 상관 없음
     id bigint auto_increment primary key,
     name varchar(50)
 );
 INSERT INTO `example02` (name)
 values
	('최광섭'),
	('정은혜'),
	('정지훈');
SELECT * FROM `example02`;

INSERT INTO `example02`
values(null,'김승민');
SELECT * FROM `example02`;

# cf) auto_increament 최대값 확인
# select max(auto_increment 컬럼명) from '테이블명';

select max(id) from `example02`;

# cf) 시작값 변경
alter table `example02` auto_increment = 100;
insert into `example02`
values (null, '박현우');

SELECT * FROM `example02`;

# cf) 다른 테이블의 데이터를 한 번에 삽입하는 구문

# insert into `삽입받을 테이블`
# select ~~~~~~
create table `example03`(
	id int,
    name varchar(100)
);
insert into `example03`
select * from `example02` ;# 컬럼의 순서, 개수, 자료형이 반드시 일치(옵션은 상관 없
select * from `example03` ;

/*
	2. 데이터 수정(update)
    : 테이블의 내용을 수정
    # 기본형식
    update `테이블명`
    set 열1=값1, 열2=값2
    (where 조건);
    
    cf) where 조건이 없는 경우 : 해당 열(컬럼)의 데이터가 해당 값으로 모두 변경
*/
USE `company`;
update `example02`
set name = '권지애';
#Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences 
#-> SQL Editor and reconnect.
#5 row(s) affected Rows matched: 5  Changed: 5  Warnings: 0 - safe 모두 헤제 후 실행 결과

select * from `example02` ;
# cf) 실행중인 세션에서 일시적으로 Safe모드 해제
 SET SQL_SAFE_UPDATES =1; # 모드 사용
 SET SQL_SAFE_UPDATES =0; # 모드 사용 해제
 
 update `example02`
 set name  = "김동후"
 where id = 1;
 
 /*
	3. 데이터 삭제(delete)
    : 테이블의 데이터를 삭제하기 위한 키워드
    
    #기본형태 
    delete from `테이블명`
    where 조건;
 */
 select * from `example02`;
# delete from `example02`;Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
SET SQL_SAFE_UPDATES =0;
delete from `example02`;
select * from `example02`;
SET SQL_SAFE_UPDATES =1;

delete from`example02`
where id = 1;
 
 
 
 
 
 
 
 
 
 
 
 
 


 
 
 
 
 
 
 
 