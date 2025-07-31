USE `market_db`;

# 테이블명의 단수, 복수 지정은 일관성이 중요
SELECT * FROM `member`;
SELECT * FROM `buy`;

# 1. 변수
# : 데이터를 저장할 수 있는 임시 저장 공간
# - SQL에서는 간단한 데이터 연산, 조건 비교, 동적 쿼리 등에 사용

# 1) 변수 선언 규칙
# : =(등호)를 기준으로 우항의 데이터를 좌항의 변수에 저장
# >> SET @ 변수명 지정 = 데이터;

# 2) 변수 값 출력(사용)
# select @변수명;

# cf) SQL 변수 특징
# 1) MySQL 워크벤치 시작 시 유지, 종료할 경우 사라짐(임시 저장 공간)
# 2) SQL 비 절차적 언어: 원하는 구문을 따로 실행(변수 선언문 실행 >> 변수 출력문 실행)

# SQL 변수 사용 예제
#변수 선언
SET @myVar1 = 5;
SET @myVar2 = 3.14; -- @ + lowerCamelCase

SELECT @myVar1;
SELECT @myVar2; # 변수 초기화문을 실행하지 않으면 null 값 출력

SELECT * FROM `member`;

# 166 이상인 그룹명 출력
SET @txt = '가수이름';
SET @height = 166;
SET @limitNumber = 1;

SELECT
	@txt, mem_name, height
FROM
	`member`
WHERE
	height > @height;
#LIMIT @limitNumber;
-- limit 키워드에는 제한 수의 값을 변수로 사용할 수 없음

# 동적 프로그래밍을 사용한 변수 사용
# prepare(준비하다), excute(실행하다)

# cf) prepare : sql문을 실행하지 않고 준비
# 	>> ? 키워드를 사용하여 코드 작성 시 값이 채워지지 않지만, 실행 시에는 채워지는 코드 작성 가능

# cf) excute: prepare 코드 실행

# prepare 실행시킬 문장명(코드블럭명)
#	from '실제 SQL문';
PREPARE mySQL
	FROM 'SELECT * FROM `member` ORDER BY height limit ?';

# execute 실행시킬 문장명 using 변수명;
# >> using 뒤의 변수값이 ? 키워드에 대입
SET @count = 3;
execute mySQL using @count;

# set 변수선언 (+ 변수명 앞에 @ 기호)
# SELECT 변수명 : 변수 값 출력
# prepare :쿼리 준비(실행안함)
# execute : 준비된 쿼리 실행
# ? : 실행히 채워질 자리( 플레이스 홀더)
# using : 플레이스 홀더에 넣을 값 지정




















