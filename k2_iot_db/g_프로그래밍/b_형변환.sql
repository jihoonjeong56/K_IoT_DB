#형변환
# : 한 데이터 타입을 다른 데이터 타입으로 바꾸는 것
USE `market_db`;

# 1) 명시적 형변환
# cast(값 as 데이터형식)
# convert(값 as 데이터형식)
# >> 두 문법은 형식만 다르고 기능은 동일

SELECT * FROM `buy`;
SELECT 
	AVG(price) as '평균가격'
FROM 
	`buy`;
    
# cf) 형 변환시 정수형 데이터 타입
#		>> signde, unsigned만 사용 가능(tinyint, int 등 사용물가)
#		- signed: 부호가 있는 정수(양수/음수 모두 가능)
#		- unsigned : 부호가 없는 정수

SELECT * FROM `buy`;
SELECT 
	AVG(price) as '평균가격', 
    CAST(AVG(price) AS UNSIGNED) as '정수 평균 가격',
	CONVERT(AVG(price),  UNSIGNED)  '정수 평균 가격'
FROM 
	`buy`;

# 날짜 형 변환(포맷지정)
# date 타입 : YYYY-MM-DD
# >> MySQL은 문자 형식을 자동으로 분석하여 YYYY-MM-DD형식으로 변환
# cf) 형식이 너무 벗어나는 경우 오류 발생(변환 x) 

SELECT CAST('2025$07$31' as DATE);
SELECT CAST('2025^07@31' as DATE);
SELECT CAST('2025$07$31' as DATE);
SELECT CAST('2025$07$31' as DATE);

SELECT CONVERT('07/31/2035', DATE); -- NULL

#CAST : SQL 표준
# CONVERT :MySQL 고유 문법

# 2) 묵시적 형 변환
# : 자동으로 데이터를 변환하는 것
SELECT '100'+'200'; -- 300

# cf) 문자열을 이어서 작성
# CONCAT('a','b') 함수를 사용
SELECT CONCAT('100', '200'); -- 100200

