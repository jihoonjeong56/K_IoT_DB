### c_select 폴더 >>> z_practice_question 파일 ###

use `korea_db`;
# members, purchases 테이블 사용
SELECT * FROM `members`;
SELECT * FROM `purchases`;


-- 1. 모든 회원의 이름, 연락처, 회원등급을 조회하시오.
select name, contact, grade
FROM `members`;
-- 2. 'SEOUL'에 거주하는 회원의 이름과 회원등급을 조회하시오.
select name, grade , area_code
from `members`E
where
	area_code IN( 'SEOUL');
-- 3. 회원등급이 'Gold' 이상인 회원의 이름과 가입일을 조회하시오.
select name, join_date, grade 
FROM `members`
WHERE grade IN('Diamond', 'Platinum','Gold');
-- 4. 2023년도에 가입한 회원의 이름과 가입일을 조회하시오.
Select name, join_date
from `members`
where
	year(join_date) = '2023';
-- 5. 100포인트 이상을 가진 회원의 이름과 포인트를 조회하시오.
select name, points
from `members`
where points >= 100;
-- 6. 'Male' 성별의 회원 중에서 'Gold' 등급 이상의 회원을 조회하시오.
SELECT name, gender, grade
FROM `members`
WHERE 
	grade IN('Diamond', 'Platinum','Gold')
and gender = 'Male'
;

-- 7. 최근에 구매한 회원과 구매일을 조회하시오. (가장 최근 구매일 기준 상위 3명)
-- group by, 집계함수, order by, limit
select 
	member_id, max(purchase_date) as last_purchase_date
from 
	purchases
group by member_id -- 회원별로 구매 데이터를 묶어 
order by last_purchase_date desc -- 그 데이터들 중 제일 최근 데이터만을 뽑아
limit 3; -- 상위 3명만을 반환

-- 8. 회원별로 구매한 총 금액(amount의 합)을 조회하시오.
-- group by, 집계함수
select 
	member_id, sum(amount) as total_spent
from
	purchases
group by 
	member_id;-- group by, 집계함수