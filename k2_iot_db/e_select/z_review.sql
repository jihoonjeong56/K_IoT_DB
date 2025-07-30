# 1. DDL VS DML
# 1) DDL(Data Definition Language)
# : 데이터베이스의 주조 정의
# - CREATE ALTER DROP TRUNCATE

# 2) DML( Data Manipulation Language)
# : 데이터 조작어 
# - INSERT SELECT UPDATE  DELETE 

# 2. SELECT문 기본 구조(작성 순서) 
/*
	SELECT 
		컬럼명(나열시, 콤마로 구분)
		1) 여러개 나열 시 ,(콤마)로 구분
        2) 모든 컬럼 조회  * (테이블 정의시 작성되는 컬럼 순으로 표시)
        3) 죄회 시의 컬럼 별칭 : as 키워드로 작성(생략가능)
	from
		테이블명
	where
		조건(cf. update delete  조건 권장)
	group by
		그룹 기준(그룹화를 하기 위해서는 묶일 수 있는 데이터만 조회 가능)
	having
		그룹조건(반드시 그룹화 된 이후)
	order by
		1) 기본값 (생략시) asc : 오름차순
        2) desc : 내림차순  (desc -> describe 와 혼동 가능)
	limit
		개수 제한;
        +) offset으로 시작 열 지정 가능(0부터 시작)
*/
/*
	Select 문 실행 순서
    1) FROM : 조회할 테이블 선택
    2) WHERE : 조건에 맞는 행 필터링
    3) GROUP BY : 그룹 기준 설정
    4) HAVING : 그룹 조건 필터링
    5) SELECT : 필요한 컬럼 선택
    6) ORDER BY : 정렬
    7) LIMIT : 출력할 행 제한
    
    cf) distinct :해당 중복되는 데이터를 제거하고 딱 하나만 남김
*/
/*
	WHERE 절 연산자 정리
    
    1) 비교 연산자 : 부등호, = , !=
		-> 값의 비교 
	2) 논리 연산자 : 조건 연결
		>> AND OR NOT
	3) NULL 체크: NULL여부 확인
		>> IS NULL, IS NOT NULL (true, false 반환)
	4) 범위 연산자 : A이상 B 이하 범위
		>> BETWEEN A AND B(숫자형 혹은 날짜형 데이터)
	5) 목록 연산자 : 여러 값들 중 포함 여부
		>> IN (값1, 값2, ...)
	6) 패턴 연산자: 와일드 카드(_, %)로 문자열 검색
		>> LIKE '_a%'
	7) 집합 연산자: 결과 집합 병합 / 비교
		>> UNION, INTERSECT, EXCEPT
			(MySQL은 UNION만 지원)
*/
USE `korea_db`;

-- 2024년 회원 중에 이름에 'JI'이 들어간 회원조회(name, area_code  조회)
-- +) name과 area_code 컬럼은 각각  '회원이름', '지역코드'로 컬럼명 조회
Select 
	name as '회원이름', area_code as'지역코드'
from
	`members`
where
	year(join_date) = 2024
    And name like  '%JI%';