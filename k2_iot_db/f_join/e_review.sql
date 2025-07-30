#korea_db 스키마의 members, purchases 테이블 사용
# 작성 순서:  select /from/ where/ group by/ having/ order by/ limit  구문
# 실행 순서 : from/ where/ group by/ having/ select/ order by/ limit
# +) join
/*
	지역별로 여성 회원들의 총 구매 금액을 구하되, 총액이 30,000원 이상인 지역만 추출하고
    총액 기준으로 내림차순 정렬해서 상위 3개 지역 조회
*/
USE `korea_db`;
# from +join
# : 회원 + 구매 내역이 합쳐진 하나의 가상 테이블 생성(구매 정보가 있는 회원만 조회)
SELECT *
FROM
	`members` M
    JOIN
		`purchases` P
        ON M.member_id = P.member_id;
        
# from + join + where
# : 조인된 결과에서 여성 회원들만 필터링
# -  where은 그룹핑 전에 작동, 개별 행에대한 조건 적용
SELECT *
FROM
	`members` M
    JOIN
		`purchases` P
        ON M.member_id = P.member_id
WHERE
	M.gender = 'Female' ;
# from + join + where + group by
SELECT
	M.area_code '지역', SUM(P.amount)  ' 총구매 금액', COUNT(DISTINCT M.member_id) '회원수'
FROM
	`members` M
    JOIN
		`purchases` P
        ON M.member_id = P.member_id
WHERE
	M.gender = 'Female'
group by
	M.area_code;
#Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'korea_db.M.member_id' which is not functionally dependent on columns in GROUP BY clause; 
#this is incompatible with sql_mode=only_full_group_by >> 그룹화를 사용한 테이블의 모든 컬럼이 조회 >> 그룹화 되지 않는 컬럼들에 대한 데이터 결합 오류
# from + join + where + group by + order by
# 남은 데이터에 having 조건부여
SELECT
	M.area_code '지역', SUM(P.amount)  ' 총구매 금액', COUNT(DISTINCT M.member_id) '회원수'
FROM
	`members` M
    JOIN
		`purchases` P
        ON M.member_id = P.member_id
WHERE
	M.gender = 'Male'
group by
	M.area_code
having
	SUM(P.amount) >=30000    
Order By
	SUM(P.amount) >=30000 Desc
LIMIT 
	3;


