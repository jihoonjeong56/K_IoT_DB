/*
	문제 1
	모든 회원의 이름, 등급, 구매한 상품 코드, 구매일, 구매 금액(amount)을 조회하세요.
	구매 기록이 없는 회원도 모두 포함되도록 하세요.
	단, 구매일이 오래된 순으로 정렬하세요.

	문제 2
	2023년 이후 가입한 회원 중 구매 총액이 30000원 이상인 
    회원의 이름, 지역코드, 총 구매금액을 조회하세요.

	문제 3
	회원 등급별로 구매 총액 평균을 구하고,
	회원 등급(grade), 구매건수(COUNT), 구매총액합계(SUM), 구매평균(AVG)을 모두 출력하세요.
	단, 구매가 한 건도 없는 등급은 제외하세요.
*/
USE `korea_db`;
# 문제 1
SELECT M.name, M.grade, P.product_code, P.purchase_date, P.amount
FROM
`members` M
	join `purchases` P
    ON M.member_id = P.member_id
order by
	P.purchase_date asc;
 # 문제 2
 SELECT
	M.name, M.area_code, Sum(P.amount)
 From 
	`members` M
	JOIN `purchases` P
		ON M.member_id = P.member_id
where
	year(M.join_date) >= '2023-01-01'
group by
	M.member_id, M.name, M.area_code
having
	SUM(P.amount) >= 30000;
;
 select * from `members`;
 select * from `purchases`;
 
 # 문제 3
 /*
 문제 3
	회원 등급별로 구매 총액 평균을 구하고,
	회원 등급(grade), 구매건수(COUNT), 구매총액합계(SUM), 구매평균(AVG)을 모두 출력하세요.
	단, 구매가 한 건도 없는 등급은 제외하세요.*/
Select 
	M.grade , SUM(P.amount), count(P.purchase_id), avg(P.amount) # Round : 반올림하는것  -> ROUND(avg(P.amount), 2) : 소수점 2째 자리까지만 보겠다.
FROM
	`members` M
    JOin
		`purchases` P
        ON M.member_id = P.member_id
        
group by
M.grade
;


 
 
 
