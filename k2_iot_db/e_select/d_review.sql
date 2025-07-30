# korea_db 사용 members, purchases 테이블 기반
# > select ~ from~ where 구문 전체 복습
USE `korea_db`;
# 1) 이름을 기준으로 정렬
SELECT * FROM `members`
ORDER BY name ;

# 2) 3번째 레코드부터 2개의 행 조회
SELECT * FROM `members` LIMIT 2 OFFSET 2;
SELECT * FROM `members` LIMIT 2, 2; -- offset 대신 , 콤마로 나열 가능

# 3) 포인트가 가장 높은 상위 3명의 회원 조회
SELECT * FROM `members` ORDER BY points DESC LIMIT 3;

# 4) 서로 다른 등급 목록 조회 (중복되는 등급 생략)
SELECT DISTINCT grade FROM `members`;

# 5) 지역별 최대 포인트 조회
SELECT area_code, MAX(points) as max_points
FROM `members`
GROUP BY area_code;

# 6) 성별(gender)에 따른 평균 포인트 조회 
# 집계함수:  avg, sum, max, min, count
SELECT gender, AVG(points) avg_points
FROM `members`
GROUP BY gender;

# 7) 평균 포인트가 250 이상이 ㄴ등급만 조회
SELECT grade , AVG(points) avg_points
FROM `members`
GROUP BY grade
HAVING AVG(points) >= 250;

# 8) 등급별 최소 포인트가 100 이상인 그룹 조회
SELECT grade, min(points)  min_points
FROM `members`
GROUP BY grade
HAVING min(points) >= 100;



















