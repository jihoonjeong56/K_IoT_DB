### DDL(Data Definition Language) 문법 정리###
# : create, alter, drop, truncate

-- DB(스키마) 생성
### create: 데이터베이스 생성, 데이터를 저장하고 관리하는 첫 단계
# 기본형태
# create database 데이터베이스명;
CREATE DATABASE example1; -- 문장과 문장 사이 ; 필수
CREATE DATABASE example2;
-- CREATE DATABASE example3 다음문장이 있는 경우 필수!
#create database example2; # Can't create database 'example2'; database exists
# 데이터베이스 이름은 중복될 수 없음
# >> 같은 이름의 DB 두번 생성 불가

# 테이블 생성 
## create : 테이블 생성, 테이블에 저장될 데이터으 ㅣ형태와 특성을 정의
# 데이터타입, 제약 조건, 기본값 등의 설정 가능
# 기본형태
# CREATE TABLE 데이터베이스.테일블 명(
#		컬럼 1 테이터타입[선택적 옵션],
#		컬럼 2 테이터타입[선택적 옵션],
#		컬럼 3 테이터타입[선택적 옵션],
#			....student_encoding
#		컬럼 n 테이터타입[선택적 옵션]
#);
CREATE DATABASE school;
CREATE TABLE `school`.`students`(
	student_id int,			-- 학생 고유번호(정수형)
    student_name char(8), 	-- 학생 이름(문자, 최대 8자리)
    student_gender char(8)	-- 학생 성별(문자, 최대 8자리)
);

-- cf) 문자 인코딩 추가 테이블
# : UTF-8  문자 인코딩을 사용하여 한글 등의 문자 정보를 올바르게 저장할 수 있도록 설정
CREATE TABLE `student_encoding` ( -- Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.

    student_id INT,
    student_name CHAR(8),
    student_gender CHAR(8)
    
)
default CHARACTER set = utf8mb4 -- utf8 : 문자 까지만 인코딩, utf8mb4 : 모든 유니코드 문자 저장 - 이모지 & 한자 포함
COLLATE = utf8mb4_unicode_ci; # 정렬방식(문자열끼리 비교하고 정렬할때 어떤 기준으로 할지정하는 설정)
# ci ( case-insensitive) : 대소문자 구분하지 않음('abc' = 'ABC')
# utf8mb4_general_ci: 속도 빠름 , 정확도 낮음
#No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.
#> DB 를 지정하지 않으면 테이블 생성불가
# 1) 테이블 명 앞에 `DB명` cjaqn
# 2) 위의 오류 설명처럼 SCHEMAS 내에서 원하는 DB 더블 클릭alter
# +) 테이블 명 또한 중복 안됨

-- DB Table 삭제
# drop: DB와 테이블의 구조와 데이터 전체를 삭제
# 기본형태
# drop database `데이터베이스명`;
# drop table `데이터베이스명`.`테이블명`;

drop table `school`.`students`;
drop database `school`;
drop database `example1`;
drop database `example2`;
# drop database `example3`; Error Code: 1008. Can't drop database 'example3'; database doesn't exist 존재하지 않는 데이터베이스




