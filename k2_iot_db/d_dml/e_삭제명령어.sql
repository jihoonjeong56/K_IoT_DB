# DELETE VS DROP VS TRUNCATE

# 1) 공통점: 삭제를 담당하는 키워드
# 2) 차이점
# - DELETE(DML)
# 	: 테이블의 틀은 남기면서 테이터를 삭제 - 주로 적은 용량의 데이터 | 조건이 필요한 데이터(where)
# - DROP(DDL)
# 	: 테이블 자체를 삭제(틀 + 데이터) 
# - TRUNCATE(DDL)
#	: 테이블의 틀은 남기면서 데이터를 삭제 - 대용량의 데이터 처리에 용이

-- 대용량 테이블 생성
USE `company`;
CREATE TABLE `big1` (select * from `world`.`city`, `sakila`.`actor`);
CREATE TABLE `big2` (select * from `world`.`city`, `sakila`.`actor`);
CREATE TABLE `big3` (select * from `world`.`city`, `sakila`.`actor`);

-- 삭제명령어 비교
DELETE FROM `big1`; #5.125 sec

SET SQL_SAFE_UPDATES =1;
drop table`big2`; #0.031 sec

truncate table `big3`; #0.016 sec
