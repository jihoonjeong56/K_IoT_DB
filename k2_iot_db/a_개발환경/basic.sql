-- MySql Workbench 환경설정


-- 1. 주석
-- 1) 단축기: ctrl + / 
-- 2) 한줄 주석: 하이픈(-) 두개 혹은 # 1개
-- 3) 여러줄 주석 /**/
/*
	줄 수에 상관없이 주석 처리 가능
*/
-- 이 쿼리는 모든 데이터베이스를 보여줌
SHOW DATABASES;

-- 2. 글자 크기변경 
-- 1) ctrl + 마우스 휠
-- 2) Edit > Preferences > Fonts & Colors


-- ===명령어 대소문자 설정===
-- : 문법의 대소문자 구분 안함
-- 	>> 일관성 있는 작성을 권함
--     1) 명령어(문법)는 대문자
--     2) 테이블 & 컬럼명은 소문자
show databases; -- MySQL Workbench는 소문자 자동완성이 기본
SHOW DATABASES;
-- 대문자 변환 단축키 ctrl + shift + u

-- === 4. 단축키
-- ctrl s 저장
-- ctrl d 한줄 복사
-- ctrl l 한줄 삭제
-- 새로운 SQL 탭 생성 : ctrl t
-- 실행 단축키  
-- ctrl enter : 마우스 커서가 위치한 쿼리문 하나만 실행
#		> 세미콜론(;) 기준으로 분리된 문장 중, 커서가 있는 한 문장만 실행
-- ctrl shift enter : 마우스로 드래그 해서 선택한 쿼리 영역만 실행
#		> 여러줄 드래그 해서 한 번에 실행할때 사용 > ctrl a를 통해 전체 선택 후 사용
-- ===5. 다크모드 설정(선택사항)
# Edit > Preferences > Font & Colors > Color Shems > Window 8 선택