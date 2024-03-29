16/12/01============================================================


오라클 사용방법

1.www.oracle.com

2.buie4532@naver.com
  Kim05******

3.oracle database 11g expresions 다운

4.셋업후 실행.(안되면 재부팅) 비번 알기쉽게 1111

5.Application express 클릭

6.sys로 로그인 비번은 설정했던것. 1111

7.아이디 생성 dev 비번 1111


si는 새로운것 찾는것
-----------------------------------------------------------------

1강 접속

- HomeSQL > Workshop > Object Browser > tables > EMP

(데이터 베이스 일하는사람은 보통 테이블에 있는 애들을 꺼내와서 쓴다.)


- HomeSQL > Workshop > SQL Commands > desc emp > Run 클릭
 (위와 동일)


- 커맨드 입력 방식(SQL plus)

 시작 > SQL Command line > connect > dev > 1111(안보임) > desc emp; 
 (위와 동일)

-----------------------------------------------------------------
2강 SELECT 파트

보통 쿼리의 작업은 Insert , Delete , Update , Select 4가지 작업을 한다.
이 작업들을 Crud 라고 한다.

EMP과 DEPT 애들은 서로 연결되어있다.  내가할꺼랑 연결지어서 프로젝트를 진행하는게 좋음

DEPTNO 는 써있는 숫자들로 제약이 걸림 그 숫자로 사용되야어야됨
Ex(10/20/30/40)

----------오늘 어떤걸 만들고 싶다.----------
생각하고 오기

-----------summery--------

SELECT 컬럼명
FROM   테이블명
WHERE  조건식명(연산자)
       (<=>)
       (and,BETWEEN,OR,IN)
ORDER BY (DESC,ASC)
--------------------------


-EMP > insert
Insert INTO 테이블명 (컬럼명,...)
            Values(값1,...)

-----HR 계정------

데이터 조회 Select 문

1)기본 구문: select 컬럼명 From  테이블 명

2)전체 컬럼 조회: Select *(*는 모든걸 불러온다) from employees

3)특정 컬럼 조회: Select 컬럼1,컬럼2,... From employees

4)컬럼에 별명 사용: SELECT 컬럼명 AS 별명
                  FROM 테이블명

5)컬럼에 별명 사용2: SELECT 컬럼명 AS "별 명"
                  FROM 테이블명

-----------------------------


6)컬럼에 별명 사용3: 
                    Select 컬럼명 "별명"
                    From 테이블명

7)중복 값을 제거하고 출력: 

select DISTINCT(department_id) From employees


8)정렬하여 출력하기: SELECT department_id FROM employees ORDER BY department_id DESC

	SELECT 컬럼명
	FROM 테이블명
	ORDER BY 컬럼명 ASC(오름차순) 또는 DESC(내림차순)

9)조건조회

	SELECT 컬럼명
	FROM 테이블명
	WHERE Salary >= 조건문 
	'날짜'(mm/dd/yyyy) 와 '문자' (실제 값들은 영문의 대소문자 구분하니 조심)
                  특정 문자열 포함 비교: LIKE '%조건문%'
	    1) %(와일드카드): 갯수를 모를때
	    2)  _: 나열될 갯수를 알때
---------------------------------------------------------------------------------
연산자의 분류

	1.산술연산자
	  -양수, 음수 부호표시 : +,-
	  -사칙연산: +, - ,* ,/

	2. 결합연산자
	  -두개의 문자열을 연결:||

	3.집합 연산자
	  -합집합: UNION
	  -합집합에 대한 교집합: Union all
	  -교집합: Intersect
	  -차집합: Minus

 	4. 산술 비교 연산자: >,<,>=,<=

	5. 논리 연산자
	   부정: NOT
	   동시 만조: AND
	   부분 만족: OR

	6. SQR 비교 연산자
	  특정 문자열 포함 비교: LIKE 
				%(와일드카드): 갯수를 모를때
				_: 나열될 갯수를 알때
	  List 비교: IN

연산자의 우선 순위 : 모든 비교연산자  > AND > OR
		     같은 순위의 경우 좌에서 우로 적용 괄호가 항상 우선
---------------------------------------------------------------------------------

	연습1. Job_id가 'it_prog'인 사람들의 first_name, salary, 부서번호 출력
	(이름을 오름차순으로 정렬)

SELECT job_id, first_name, salary, department_id "부서번호"
FROM employees
WHERE job_id = 'IT_PROG' 
Order by first_name

	연습2. 2005년 이후에 입사한 사람들의
	       first_name, salary, 부서번호 출력
	       (입사일을 기준으로 정렬)	*01/01/2005

SELECT hire_date, first_name, salary, department_id "부서번호"
FROM employees
WHERE hire_date >= '01/01/2005'
Order by hire_date;

	연습3. employee_id와 first_name을 공백으로 연결하고 
		'사원정보'라는 별명으로 출력

SELECT employee_id || ' ' || first_name "사원정보"
FROM employees


	연습4. 2005년도에 입사한 사람들의
	[LIKE]	first_name, salary, 입사일, 부서번호 출력
	[WHERE]	(입사일을 기준으로 정렬) 
		
SELECT hire_date "입사일", first_name, salary, department_id "부서번호"
FROM employees
WHERE  hire_date >= '01/01/2005' 
AND hire_date < '01/01/2006'
Order by hire_date;
	
	연습5. salary가 10000에서 20000사이의
		first_name, job_id,salary 검색
		(salary로 정렬) AND 연산자, BETWEEN연산자
	
SELECT job_id, first_name, salary
FROM employees
WHERE salary >= 10000 
AND salary <= 20000
Order by salary;
		(이것도 됨 WHERE salary BETWEEN 10000 AND 20000)

	연습6. department_id가 30, 60, 90인 사람들의 
		department_id, first_name 출력 (OR 연산자, IN 연산자)

SELECT     department_id, first_name
FROM       employees
WHERE      department_id = 30 
OR         department_id = 60
OR         department_id = 90;
		(이것도 됨 WHERE department_id IN(30,60,90)
		
	연습7. last_name이 K로 시작하는 사람들의
		last_name, first_name, salary 출력

SELECT     last_name, first_name, salary
FROM       employees
WHERE      last_name LIKE 'K%'

	연습8. last_name이 K로 시작하고 , g로 끝나는 4글자인 사람들의
		last_name, first_name, salary 출력

SELECT     last_name, first_name, salary
FROM       employees
WHERE      last_name LIKE 'K__g'

	연습9. phone_number가 가운데 번호가 500번대로 시작하는 사람들의
		first_name, phone_number 출력

SELECT first_name, phone_number
FROM employees
WHERE phone_number LIKE '%.5%.%';

	연습10. phone_number가 가운데 번호가 500번대이 아닌 사람들의
		first_name, phone_number 출력


--------------------------------16/12/02---------------------------------------


	IS NULL
	IS NOT NULL	: NULL 값 조회

	연습1. salary에 commission_pct를 곱해서	
		보너스를 계산하여
		first_name, job_id, salary, 보너스 출력 
		(단, commission_pct가 있는 자료들만 사용)			

SELECT   First_name, job_id, salary ,salary * commission_PCT as 보너스
From     employees
WHERE    Commission_pct IS NOT NULL


	연습2. CEO의 employee_id,last_name, manager_id, salary 출력


SELECT   employee_id,last_name, manager_id, salary
From     employees
WHERE    manager_id IS NULL



	연습3. department_id가 100이나 50에 속하는
		사람들 중에서 salary가 5000 이상인 자료
		last_name, salary, job_id, department_id 출력
		단, department_idf를 오름차순으로 정렬하고, 
		같은 department_id인 경우 Salary를 내림차순으로 정렬

SELECT   last_name, salary, job_id, department_id
From     employees
WHERE    (department_id = 50 OR department_id = 100)
AND      Salary >= 5000
ORDER BY department_id, Salary DESC

	연습4. salary가 10000이상이
		department_id가 80,90인 사람들의
		first_name, salary, department_id 출력

SELECT   first_name, salary, department_id
From     employees
WHERE    Salary >= 10000
And      department_id = 80

UNION al
SELECT   first_name, salary, department_id
From     employees
WHERE    Salary >= 10000
And      department_id = 90


	연습5. department_id가 70 이상인 자료와
		70미만인 자료의 salary가 같은 자료 출력

SELECT   salary
From     employees
WHERE    department_id >= 70

intersect

SELECT   salary
From     employees
WHERE    department_id < 70


	연습6. department_id가 100번인 자료의 salary를 
		제외한 모든 salary 출력


SELECT   salary
From     employees

Minus

SELECT   salary
From     employees
WHERE    department_id =100

-------------------------------------------------------------------------------
3.문자형 함수

1. 모든 문자를 대문자로 전환: UPPER

2. 모든 문자를 소문자로 전환: LOWER

3. 문자를 단어별로 첫문자는 대문자
   나머지는 소문자로 전환 : INITCAP

4. 문자열 결합: CONCAT

5. 문자열의 특정부분 선택:  SUBSTR (컬럼명, 시작숫자, 추출숫자)

6. 문자열의 길이 계산: LENGTH(컬럼명)

7. 특정 문자열의 시작 위치를 지정 : INSTR(컬럼명,찾는문자,방향,번째)

8. 왼쪽 문자 자리 채움 : LPAD

9. 오른쪽 문자 자리 채움 : RPAD

10. 왼쪽 문자 지움 :  LTRIM

11. 오른쪽 문자 지움 : RTRIM

12. 왼쪽, 오른쪽 문자 선택적으로 지움 : TRIM

------------

연습1. UPPER 활용
                  last_name은 모두 대문자로 전환
	job_id는 모두 소문자로 전환,
	email은 첫문자를 대문자로 전환

SELECT   UPPER(last_name), LOWER(job_id), INITCAP(email)
From     employees


연습2.  CONCAT 활용
	last_name, salary를 출력
           사원의 연봉을 ' ~~~의 연봉: ~~~~원'으로 출력

SELECT     last_name , salary,
CONCAT  (CONCAT (last_name, '의 연봉 : '),CONCAT (salary*12, '달러')) "사원의 연봉"
From         employees


연습3.  SUbSTR 활용1
	hire_date가 12월인 사람들의
	last_name, hire_date 출력

SELECT    last_name, hire_date
From       employees
WHERE   SUBSTR(hire_date,1,2) = 12

연습4.  SUbSTR 활용2
	hire_date가 2005인 사람들의
	last_name, hire_date 출력

SELECT  last_name, hire_date
From    employees
WHERE   SUBSTR(hire_date,7) = 2005


연습4-1 INSTR을 활용
	hire_date가 2005인 사람들의
	last_name, hire_date 출력


연습 5. http://127.0.0.1:8080/index.jsp에서 
           ip만 추출

SELECT  SUBSTR('http://127.0.0.1:8080/index.jsp',
        INSTR('http://127.0.0.1:8080/index.jsp','/',1,2)+1,
        INSTR('http://127.0.0.1:8080/index.jsp','/',1,3)-INSTR('http://127.0.0.1:8080/index.jsp','/',1,2)-1)
From    dual

연습6. salary가 10000 이하인 사람들의
           salary가 7자리로 출력
          (단, 부족한 자릿수는 *표시)

SELECT  first_name,salary,
        LPAD(salary,7,'*'),
        RPAD(salary,7,'*')
From    employees
WHERE salary <= 10000


연습7. employee_id 의 왼쪽에 1을 제거, 오른쪽의 1을 제거

SELECT  employee_id ,
        LTRIM(employee_id,1),
        RTRIM(employee_id,1)
From    employees

연습8. job_id 컬럼의 IT_PROG를 모두 IT_ENGINEER로 바꿈

SELECT  job_id,
        Replace(job_id,'IT_PROG','IT_ENGINEER')
From    employees
WHERE job_id = 'IT_PROG'

연습8-1 last_name 을 At***son으로 표시
replace 사용
---------------------------------------------------------------------

숫자관련 함수
1.반올림 : ROUND
2.버림: TRUNC
3.CEIL  숫자를 올림하고 소수점 버림
4.FLOOR 숫자를 내림하고 소수점 버림
5.MOD 나머지 구하는 함수

연습1.   Salary의 보너스를 0.33333을 곱하여 반올림

SELECT first_name, salary,
       salary*0.333333,
       Round(salary*0.33333,-1),
       Round(salary*0.33333,2),
       Round(salary*0.33333,1),
       Round(salary*0.33333)
From    employees

연습2. Salary의 보너스를 0.33333을 곱하여 반올림
         (단, 1000부터 9999까지 나타내자)


SELECT first_name, salary,RPAD(round(salary*0.33333,2),7,'0')
      
From    employees
WHERE ROUND(salary*0.33333,2) BETWEEN 1000 AND 9999



연습3.
SELECT first_name, salary,
       salary*0.333333 Bonus,
      salary/3 DIV,
      MOD(salary,3)MOD,
      ceil(salary*0.33333)ceil,
      Floor(salary*0.33333)Floor

From    employees

4
연습3-1. last_name과 직원들의 직무년수 표시

SELECT first_name, salary, concat(Trunc((sysdate-hire_date)/365),' 년차') AS "근속 년수"
      
From    employees



-----------------------------

 날짜 관련 함수

1. Months_BETWEEN 특정 두날짜사이의 개월수
2.ADD_MONTHS  지정된 날짜의 몇개월 후의 날짜
3.NEXT_DAY 특정 날짜에서 다음 요일ㅇ
4. LAST_Day  지정한 달의 마지막 날짜


연습1. last_name과 직원들의 근무 개월 수 표시
비교.1-1
SELECT sysdate, Hire_date,
       trunc(MONTHS_between(sysdate, Hire_date)) Months1,
       Trunc((sysdate-HIre_date)/30) Months2,
       Trunc((sysdate-HIre_date)/31) Months2,
       Trunc((sysdate-HIre_date)/365*12) Months2
From employees

연습2. hire_date와 입사 후 6개월 되는 날짜 출력

SELECT hire_date,
       ADD_MONTHs(hire_date,6)
From employees

연습3. 이번 주 토요일의 날짜 출력

SELECT SYSDATE, NEXT_DAY(sysdate,'saturday')
From employees

 연습4.이번달의 마지막 날짜

SELECT SYSDATE, LAST_Day (sysdate)
From employees

연습5. 근속 개월 수가 120개월 이상인 사람들의
          last_Name, job_id, 근속 개월수 표시

SELECT last_name,job_id,
 trunc(MONTHs_BETWEEN(sysdate,Hire_date)) "근속 개월수"
From employees
WHERE trunc(MONTHs_BETWEEN(sysdate,Hire_date)) >= 120

---------------------------------
형 변환 관련 함수
1. To_char         숫자/날짜를 문자로 바꾸는것
	19981231  => 19,981,231
	12/31/1998  => 1998년 12월 31일

	숫자를 문자로 변환 시에 사용되는 형식 요소
	9      : 일반적인 숫자 표시
	0      : 앞의 빈자리를 0으로 채움
	$      : dollar를 표시
	L      : 지역 통화 단위
	.       : 소숫점 표시
	,       : 천 단위 표시

       날짜를 문자로 변환 시에 사용되는 형식 요소
       YYYY: 4자리 연도 표시
       MM: 2자리 월로 표시
       DD: 2자리 일로 표시
       HH, HH24  : 1~12, 0~23 시간 표시
       MI   :  분 표시
       SS   :  초 표시

2. To_number   문자를 숫자로 바꾸는 것


3. To_date         문자를 날짜로 바꾸는 것


연습1. Salary를 세 자리마다 콤마로 구분하여 표시

SELECT last_name, salary,
       To_char(salary*12*10,'999,999,999.99$') "10년치 연봉",
       To_char(salary*12*10,'000,000,000.00$') "10년치 연봉"
FROM employees

연습 2. hire_date를 연/월/일의 형태로 출력
           ex) 2003/12/31

SELECT last_name,hire_date,
       To_char(hire_date,'yyyy/mm/dd')
FROM employees

연습3. '20161231'을 숫자로 변환하여 출력

SELECT TO_number('20161202','YYYY/mm/dd')
From dual

연습4. '20161231'을 날짜로 변환하여  2016/31/31의 형태로 출력

SELECT TO_DATE('20161202','YYYY/mm/dd')
From dual


16/12/05=======================================================================================

다양한 일반 함수들

1.NULL 값을 특정 값으로 변환: 

NVL(컬럼명,'문자')
없는 데이터(null)를 문자 or 컬럼 으로 출력

NVL2(컬럼명,'문자나 숫자a1', '문자나 숫자b2')
데이터(not null)를 대신해 나타낼 문자 a1 or 컬럼
없는 데이터(null)를  대신해 나타낼 문자 b2 or 컬럼
각각 출력 함

NULLIF(컬럼1,컬럼2)
컬럼1 과 컬럼2를 비교하여 값이 서로 다를때  [컬럼1]을 나타냄 
                            값이 같을 때  [null]값을 나타냄
 (IF,ELSE와 유사)


2.DECODE  : equal 비교, 조건문이 비교적 간단


3.case         : Range 비교,조건문이 길어짐


 

연습1. commission_pct가 없는 사람의 경우 3%를 적용하여
           last_name, salary, bonus를 출력

연습2. commission_pct가 없는 사람의 경우 3%,
            기존에 있었던 경우에는 5%를 적용하여
            Last_name, salary, bonus를 출력

SELECT last_name, salary,
       salary*NVL2(commission_pct,0.05,0.03) BOUNUS
FROM employees


연습3. first_name과 last_name의 문자열 길이를 출력
            두 문자열의 길이를 비교하여
            같지않으면 first_name을 출력, 같으면 NULL로 처리

SELECT first_name,last_name, length(first_name),length(last_name), 
NULLIF(length(first_name),length(last_name))
FROM employees




연습4. department_id가 10이면 'team1',
             20이면 'team2', 30이면  'team3',
            나머지는  'team0'로 처리

4-1. DECODE
SELECT first_name, department_id,
       DECODE(department_id,
       '10', 'team1',
       '20', 'team2',
       '30', 'team3',
       'team0') TEAMS
FROM employees
WHERE department_id <= 40

4-2. CASE
SELECT first_name, department_id,
       CASE department_id WHEN 10 THEN 'team11'
                          WHEN 20 THEN 'team22'
                          WHEN 30 THEN 'team33'
                          ELSE         'team00'
       END TEAMS
FROM employees
WHERE department_id <= 40

연습5. departmen_id가 10~50이면 'teamA',
            60~100이면 'teamB', 110~150이면 'teamC',
           나머지는 'teamX'로 처리

연습6. salary가 10000미만이며 50%, 
                           20000 미만이면 30%,
                           20000 이상이면 10%의 보너스를
            계산하여 last_name, salary, bounus 출력

6-1.CASE
SELECT first_name, salary, 
       CASE  WHEN salary<10000   THEN salary*0.5
             WHEN salary<20000   THEN salary*0.3
       ELSE        salary*0.3
       END BONUS
FROM employees

6-2.DECODE
SELECT first_name, salary, 
       DECODE(TRUNC(salary/10000),
              '0', salary*0.5,
              '1', salary*0.3,
               salary*0.3) BONUS
FROM employees



16/12/06===================================

그룹 함수: 여러 건의 데이터를 한꺼번에 처리

1. COUNT (컬럼명) :
	행이 몇개인지 카운팅 수

2. AVG       :
	평균
3. SUM      :
	합계
4. MIN       :
  	최소값
5. MAX      :
	최대값




연습1. job_id에 'IT'가 포함된 직원들의 수 출력.

SELECT  Count(job_id)
From    employees
WHERE job_id Like '%IT%'



연습2. job_id에 'IT'가 포함된 직원들 중에서 
           commission_pct가 있는 직원들의 수 출력

SELECT  Count(commission_pct)
From    employees
WHERE job_id Like '%IT%'



연습3. job_id에 'IT'가 포함된 직원들의
           급여 평균과 합계 계산

SELECT  AVG(salary) 평균, SUM(salary) 합계
From    employees
WHERE job_id Like '%IT%'
 
   3-1.) 단 , 평균 계산시,NULL 값이 있는 경우 0으로 간주하여 적용

SELECT AVG(NVL(salary,0)) 평균, SUM(salary) 합계
From    employees
WHERE job_id Like '%IT%'



연습4. 가장 큰 salary와 가장 작은 salary 출력

SELECT MAX(salary) 최대값, MIN(salary) 최소값,
       MAX(hire_date), MIN(hire_date)
From    employees
WHERE job_id Like '%IT%'

---------------------------------------------------------------------
그룹 함수에 특정 조건 지정

1. GROUP BY : count, avg, sum 등이 포함된 select를 하고싶을때
                         count, avg, sum이 아닌 컬럼명을 단위 별로 그룹화하여 나타낸다.
2. HAVING  : 그룹함수를 쓰고  count, avg, sum 등에 조건을 걸때  HAVING을 씀

연습1. 각 department_id 별로 평균 급여 출력, department_id 별로 job_id의 갯수 출력

SELECT department_id, avg(salary)
From    employees
GROUP BY department_id
ORDER BY department_id


연습2. salary의 합계가 20000 이상인 부서의
           department_id, 인원수 , salary 합계 출력

SELECT department_id, COUNT(*), sum(salary)
From    employees
Having sum(salary) >= 20000
GROUP BY department_id
ORDER BY department_id


연습3. salary의 평균이 10000 이상인 
            departmen_id, 평균 salary 출력

SELECT department_id, COUNT(*), avg(salary)
From    employees
Having avg(salary) >= 10000
GROUP BY department_id
ORDER BY department_id


연습4.  각 department_id 별로 job_id가 2명이상의 데이터들의 
             department_id, job_id, 인원수 출력

SELECT department_id, COUNT(*) 인원수, job_id
From    employees
Having  count(job_id) >= 2
GROUP BY department_id,job_id
ORDER BY department_id


연습5. 각 department _id 별로 job_id가 'IT_PROG'인
           사람들의 평균 급여출력
            단, department_id, 평균 급여만 출력

SELECT department_id, AVG(salary)
From    employees
WHERE  job_id Like 'IT_PROG'
GROUP BY department_id,job_id
ORDER BY department_id



연습 6. 각 department _id가 60 이상인 레코드의
              department_id, job_id, 인원수, salary의 합계 출력
             
SELECT department_id, COUNT(*),job_id, SUM(salary) "급여 합계"
From    employees
where  department_id >= 60
GROUP BY department_id, job_id
ORDER BY department_id


-----------------------------------------------------------------------------

데이터 집계 함수들
\\GROUP BY 에서 써야됨
1. ROLLUP    :
	엑셀의 부분합과 같이 각부분 별로  합계가 나옴
2. CUBE         :
	ROLLUP을 포함하고 총계만 따로 밑에 정렬되어 나옴

3.GROUPING SETS:
	 각 컬럼별로 그룹화(인원수)하여 출력함.
4.LISTAGG 
                각



연습1. 각 department _id가 60 이상인 레코드의
              department_id, job_id, 인원수, salary의 합계 출력
	단, 각 데이터들의 소계도 출력

SELECT department_id, job_id, COUNT(*), SUM(salary) "급여 합계"
From    employees
where  department_id >= 60
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id


연습2. 각 department _id가 60 이상인 레코드의
              department_id, job_id, 인원수, salary의 합계 출력
	단, 각 데이터들의 소계 및 전체 총계 출력

SELECT department_id, job_id, COUNT(*), SUM(salary) "급여 합계"
From    employees
where  department_id >= 60
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id

연습3.  각department _id가 100 이상인 레코드의
              department_id,manager_id, manager_id 별 인원수 출력

SELECT department_id, manager_id, COUNT(*) 인원수
From    employees
where  department_id >= 100
GROUP BY GROUPING SETS(department_id, manager_id)
ORDER BY department_id

======================================================


3강. DDL ; Data Definition Language
        데이터 정의 언어

CREATE, DROP, ALTER, TRUNCATE, RENAME, COMMENT

1.CRATE TABLE: 새로운 테이블 생성

2.DROP TABLE: 기본 테이블의 구조 및 모든 행 삭제

3.ALTER TABLE: 기본 테이블 변경
	          컬럼의 추가, 수정, 삭제
	          제약 조건의 추가, 삭제, 활성화/비활성화

4.TRUNCATE  : 기존 테이블의 구조는 남기고 모든 행 삭제

5.RENAME     : 테이블 이름 변경

6. COMMENT  : 테이블이나 컬럼에 주석문 달기



명명 규칙
 * 객체를 의미할 수 있는 적절한 이름 사용
 * 테이블명과 컬럼명은 반드시 문자로 시작
    (최대 30자까지 허용)
    A~Z, a~z, 0~9, _, $, #만 사용 가능
    동일명 중복 불가
    오라클의 예약어 사용 불가

  ex)테이블 명 
        10_DEPT   숫자로 시작하면 x
        S-SALES   - 는 쓸수 x
        ORDER     오라클 예악어 x




테이블 생성

CREATE TABLE [스키마.]테이블명(
	컬럼명1 데이터타입[기본형식],
	컬럼명2 데이터타입[기본형식],
	...
)


   스키마          :  객체의 집합으로 테이블의 소유자 의미
   데이터 타입 :  컬럼이 가질 데이터의 종류와 크기
   기본 형식     :  데이터 입력(INSERT) 시에 사용될 기본 값
   	          특정 값을 입력하지 않았을 경우
	          NULL 값 대신에 기본 값이 자동 입력 됨
ㅁ.주의!! 테이블명에 큰 쌍따움표가 붙여지면 
컬럼을 추가할때, 삭제, 수정, 조회 등 모든 테이블에 "테이블명" 으로 써야됨 주의          

데이터 타입--------------------------------------------------
CHAR(size)                :   고정 길이 문자 데이터
		    입력된 자료의 길이와 상관 없이
		    정해진 길이만큼 저장 영역 차지
		    최소 크기는 1

VARCHAR(size)      :   가변 길이 문자 데이터
		    실제 입력된 문자열의 길이만큼
		    저장 영역 차지
   		    최소 크기는 1 최대 4000ByteS

NUMBER                   :    최고 40자리까지 숫자 저장
		    소수점이나 부호는 길이에 포함 X

NUMBER(W)             :   최대 38자리까지 숫자 저장

NUMBER(w, d)          :    d는 소수점 이하 자릿 수

DATE                          :    날짜



연습1. T_MEMO 라는 메모 테이블 생성
            메모번호          : 숫자 9자리                     : memo_no
            사용자 아이디 : 가변문자열 8자리         : user_id
            메모  제목        : 가변문자열 40자           : title
            메모  내용        : 가변 문자열 1000자리  : memo
            이모티콘          : 가변 문자열 20자          : emoticon
            가입일자          : 날짜                                 : reg_date
            
CREATE TABLE "T_MEMO"(
        memo_no   NUMBER(9),
        user_id      VARCHAR(8),
        title           VARCHAR(40),
        memo        VARCHAR(1000),
        emoticon  VARCHAR(20),
        reg_date  DATE DEFAULT SYSDATE
)

-------------------------------------------------------
테이블 복사하기(CTAS)

1. 모든 컬럼을 복사
 CREATE TABLE 테이블명
as 
SELECT * FROM 원본 테이블명
DEFAULT 값은 복사가 안되므로 다시 넣어줘야됨

2. 특정 컬럼을 복사
CREATE TABLE 테이블명
as 
SELECT  컬럼1, 컬럼2, 컬럼3,.....
FROM 원본 테이블명

3.데이터 구조만 복사해서 테이블 생성
CREATE TABLE 테이블명
as 
SELECT *
FROM 원본 테이블명
WHERE 1 = 0 (물리적으로불가능한 조건을 써주면 테이블만 생성)

4. 가상 컬럼 테이블 생성
CREATE TABLE t_virtual(
    no1 NUMBER,
    no2 NUMBER,
    no3 NUMBER GENERATED 
               ALWAYS AS  (no1 + no2) VIRTUAL
)

5.테이블을 수정할때
ALTER TABLE t_virtual
ADD   (no4 GENERATED ALWAYS AS((no1*12) + no2))



연습1.  employees 테이블의 모든 칼럼과 데이터를 복사하여 emp테이블 생성

CREATE TABLE emp2
as
SELECT *
FROM employees


연습2. employees  테이블의 employee_id, first_name, department_id, job_id 칼럼과
           데이터들만 복사하여 emp2 테이블 생성

CREATE TABLE emp2
as
SELECT employee_id, first_name, department_id, job_id 
FROM employees



연습3. employees  테이블의 구조만 복사하여 emp3 테이블 생성


---------------------------------------------------------------------------

ALTER 명령

1. 테이블에 새로운 컬럼 추가하기
   ALTER TABLE 테이블명
  ADD(컬럼명 데이터 타입(자리수) DEFAULT(컬럼의 기본값 설정))

2.테이블의 컬럼 이름 변경하기****************
  ALTER TABEL 테이블명
  RENAME COLUMN 원본컬럼명 TO 변경 컬럼명

3.테이블 이름 변경하기
 RENAME  원본컬럼명 TO 변경 컬럼명

4. 컬럼의 데이터 타입/크기 변경
 ALTER TABEL 테이블명
 ALTER TABEL 테이블명
 MODIFY(컬럼명 크기)

5.컬럼 삭제
  ALTER TABEL 테이블명
 DROP COLUMN 컬럼명

5.1 참조키가 설정된 컬럼 삭제
  ALTER TABLE 테이블명
 DROP COLUMN 컬럼명 CASCADE CONSTRAINTS


6. 테이블을 읽기 전용으로 변경
ALTER TABLE 테이블명
READ ONLY / READ WRITE(읽고쓰기)




연습1. t_virtual 테이블에 가변문자열의 10자리를 갖는 no6 컬럼 추가
            단, 기본값은 '6th' 으로 지정

ALTER TABLE t_virtual
ADD   (no6 char(10) default '6th')



연습2. t_virtual 테이블에 no6 컬럼명을 no 6th로 변경
ALTER TABLE t_virtual
RENAME COLUMN no6 TO no6th



연습3.  t_virtual 테이블의 이름을 t_nums로 변경

RENAME t_virtual To  t_nums


연습4. t_nums 테이블의 no5 컬럼의 크기를 5로 변경하고
            컬럼 타입을 가변문자열로 수정
ALTER TABLE t_virtual
MODIFY(NO5 Varchar(5))


연습5. t_nums 테이블의 no7 컬럼을 삭제
ALTER TABLE t_nums
DROP COLUMN NO7

연습6. t_nums 테이블의 모든 컬럼과 데이터를
           t_virtual 테이블을 생성하여 복사


연습 7. 숫자를 저장하는 num 컬럼을 갖는 t_read 테이블 생성하고,
             num 컬럼에 100을 저장한 후,
             테이블을 읽기 전용으로 변경한 다음,
             num 컬럼에 200을 저장하고 표시되는 메시지 확인

---------------------------------------------------------------------------

DROP 명령

DROP TABLE 테이블명
테이블 삭제
            
연습1.  t_read테이블을 삭제

DROP TABLE t_read

--------------------------------------------------------------------------

TRUNCATE  명령

TRUNCATE TABLE 테이블명
테이블의 데이터와 인덱스 삭제하고 구조만 남김


연습1. T_VIRTUAL 테이블의 모든데이터 삭제
TRUNCATE TABLE t_virtual

------------------
연습. t_memo 테이블의 reg _date의 데이터 타입을
          time stamp 


과제2. 테이블 만들기


16/12/07==================================================

 DML; Data Manipulation Language
데이터 베이서에 입력된 데이터를 조회하거나 
추가, 수정 , 삭제
INSERT, DELETE, UPDATE, SELECT


1.INSERT(데이터 추가)

INSERT  INTO  테이블명[(컬럼명1, 컬럼명2, ...)]
VALUES(데이터1, 데이터2,....)

INSERT all (다중 데이터 입력)
INTO 테이블명 VALUES(데이터1, 데이터2,....)
INTO 테이블명 VALUES(데이터1, 데이터2,....)
SELECT   컬럼명1,컬럼명2,.......
FROM    DUAL;



복사 붙여넣기
서브 쿼리로 원본 테이블의 데이터를 한꺼번에 복사하여 추가
INSERT
INTO  테이블명
SELECT   컬러명
FROM    원본테이블명
WHERE 조건식



2. UPDATE
UPDATE    테이블명
SET            컬럼명1 = 변경할 값1
                  컬럼명2 = 변경할 값2
                  .........
WHERE     조건식

3.DELETE
열삭제
DELTE FROM EMP4
WHERE           조건식

4.MERGE
구조가 같은 두 개의 테이블을 하나의 테이블로 병합
수행하는 테이블에 기존에 존재하는 행이 있다면
새로운 값으로 갱신(UPDATE)되고,
존재하지 않으면 새로운 행으로 추가(INSERT)

MERGE INTO  병합테이블 명     병합테이블별명
USING       원본테이블명 1   원본테이블1 별명
ON          (조건식) --괄호 무조건 쳐야됨 조건식은 한가지만 같으면됨
WHEN MATCHED THEN      조건이 일치할 경우의 처리
WHEN NOT MATCHED THEN  조건이 불일치할 경우의 처리


서브쿼리 수행






연습1. employees 테이블의 구조를 복사하여 
            firtst_name, department_id, salary, hire_date	
            emp4 테이블 생성

CREATE TABLE emp4
as
select first_name, department_id, salary, hire_date
from employees 


연습2. emp4 테이블에 first_name은 'MIN', 부서번호는 30
            급여는 10000, 입사일자는 2016년 6월 6일의 레코드 추가
INSERT INTO emp4
VALUES('MIN',30,10000,'06/06/2016')


연습3. emp4 테이블에 firtst_name은 'Yun', 부서번호는 20,
            입사일자는 2016년 10월 10일의 코드 추가
INSERT INTO emp4(first_name, department_id, hire_date)
VALUES('Yun',20,'10/10/2016')


연습4. empolyees 테이블에서 department_id가 100 이상인
           데이터들만 복사하여 emp4 테이블에 추가 (서브쿼리 형태로 인설트한다.)
INSERT INTO EMP4
FROM   employees
SELECT first_name, department_id, salary, hire_date
WHERE  DEPARTMENT_ID >= 100


연습5. emp4 테이블의 first_name이 Yun인 사람을 
            salary 10000이상을 업데이트
UPDATE emp4
SET    salary=1000
WHERE  first_name = 'Yun'


연습6. emp4 테이블의 department_id가 30인 사람의
           department_id를 10으로 salary를 1000으로 변경
UPDATE emp4
SET    department_id=10,
       salary      =1000
WHERE  department_id=30


연습7. emp4 테이블에 employee_id 컬럼을 추가하고 
            모든 employee_id를 99로 지정
ALTER TABLE  emp4
ADD(employee_id number(2))

update emp4
set employee_id=99

연습8. EMP4 테이블 DEPARTMENT_ID가 100인 사람들의
           레코드를 모두 삭제

DELETE EMP4
WHERE DEPARTMENT_ID =100

연습9. EMP4 테이블의 DEPARTMENT_ID가 10이거나 20인
          레코드를 모두 삭제


DELETE EMP4
WHERE DEPARTMENT_ID =20
OR DEPARTMENT_ID = 10

연습 10. t_datas 테이블에 t_data01 과 t_data02를 병합(merge)하시오.

MERGE INTO t_datas total
USING      t_data01 d1
on         ( total.data_no = d1.data_no)
WHEN MATCHED THEN   
UPDATE
SET total.product_no = d1.product_no,
total.quantity = d1.quantity,
total.amount  =  d1. amount
WHEN NOT MATCHED THEN
INSERT VALUES(d1.data_no,d1.product_no, d1.quantity,d1.amount)

MERGE INTO          t_datas total
USING               t_data02 d2
on                  ( total.data_no = d2.data_no)
WHEN MATCHED THEN   
                    UPDATE
                    SET total.product_no = d2.product_no,
                        total.quantity = d2.quantity,
                        total.amount  =  d2. amount
WHEN NOT MATCHED THEN
                    INSERT VALUES(d2.data_no,d2.product_no,
                                   d2.quantity,d2.amount)


연습 11. employees 테이블의 데이터 중
               employee_id가 100, 110인 레코드들의
               emplotee_id, last_name, job_id,
               salary, hire_date를 복사하여 temp01 테이블 생성

CREATE TABLE temp01
as
select employee_id, last_name, job_id,salary, hire_date
from employees
WHERE employee_id in(100,110)


연습 12. employees 테이블의 데이터 중
                job_id가 'IT_PROG'인 레코드들의
               employee_id, last_name, job_id,
               salary, hire_date를 복사하여 temp02테이블 생성

CREATE TABLE temp02
as
select employee_id, last_name, job_id,salary, hire_date
from employees
WHERE job_id like 'IT_PROG'


연습13. temp02 테이블의 job_id를 모두 TEST로 변경

UPDATE temp02
SET JOB_ID = 'TEST'
WHERE job_id IS NOT NULL


연습14. temp02 테이블에 123, Han, JOB_ID, 20000, 오늘날짜 값을
              갖는 레코드 추가
INSERT INTO temp02(employee_id, last_name, job_id,salary, hire_date)
VALUES('123','HAN','JOB_ID',20000, SYSDATE) 

 
연습15. temp01에 temp02 테이블을 병합
              병합 기준은 employee_id의 일치 여부
              일치한다면 기존 데이터 업데이트
              일치하지 않으면 신규 데이터 추가

MERGE INTO          TEMP01
USING               TEMP02
on                  ( TEMP01.EMPLOYEE_ID = TEMP02.EMPLOYEE_ID)
WHEN MATCHED THEN   
                    UPDATE
                    SET  TEMP01.last_name =  TEMP02.last_name, 
                        TEMP01.job_id = TEMP02.job_id,
                         TEMP01.salary = TEMP02.salary,
                        TEMP01.hire_date = TEMP02.hire_date
WHEN NOT MATCHED THEN
                    INSERT VALUES( TEMP02.EMPLOYEE_ID,TEMP02.last_name,
                                       TEMP02.job_id,TEMP02.salary,TEMP02.hire_date)


연습 16. emp4 테이블의 Min의 department_id를 
               Shelley의 department_id로 변경. 데이터 없을 경우 추가

update emp4
set department_id=
(select department_id
from employees
WHERE first_name like 'Shelley')
WHERE first_name like 'MIN'


연습17. emp4 테이블의 데이터 중에서 departments 테이블의 
department_name이 Accounting인 레코드 와 같은 데이터를 모두 삭제

delete emp4
WHERE department_id =
(select department_id
FROM departments
WHERE department_name ='Accounting')

============================================


TCL ; Transaction Contrl Language
트랜잭션 제어 언어
DML 작업후 반드시 실시해야 데이터베이스에 반영 됨

1.COMMIT
2.ROLLBACK


DCL; Data Control Language
데이터 제어 언어 - 권한 부여 및 취소
1.GRANT
2.REVOKE


==============================================
제약 조건

1. PRIMARY KEY(기본키)
    NOT NULL과 UNIQUE를 결합한 형태
    중복되지 않는 값으로 설정
   (다른 레코드들과 구분)
[아이디, 두개 문자 결합]

2. FOREIGN KEY(외래키, 참조키)
    참조되는 테이블의 컬럼의 값이 존재하면 허용

3. UNIQUE
   중복된 값을 허용 X
   항상 유일한 값을 갖도록 설정

4. CHECK
    저장 가능한 데이터 값으 범위나 조건을 설정하여
    지정된 값만 허용

5. NOT NULL
    NULL을 허용 X




연습1. 회원 테이블 T_MEMBER 생성
         
        항목                       데이터 타입(자릿수)    제약조건
        -----------------------------------------------------
        아이디                  VARCHAR2   8                PRIMARY KEY 
        비밀번호             VARCHAR2   10               NOT NULL
        이메일                 VARCHAR2   30               UNIQUE  
        성별                     CHAR             1                 CHECK
        전화번호             VARCHAR2  13                 
        이름                    VARCHAR2   10                 
        생년월일            DATE                                  




2016/12/08===================================================

5. JOIN
두개이상의 데이터를 이용해서 필요한 데이터를 가져온다.
두개 이상의 테이블이 [같은 컬럼을 포함]했을때
별칭을 붙인다. [From 컬럼명1 별칭, 컬럼명2 별칭, ...]
또한 컬럼명은 [별칭.컬럼명]으로 다 바꿔줘야됨

1) Catesian Product(    CROSS JOIN)

    특별한 키워드 없이 SELECT문의 FROM 절에
    테이블명을 콤마로 구분하여 연속 기술
    얻어지는 컬럼의 수는 두 테이블을 더한 것이 되고,
    레코드 수는 두 테이블의 행을 곱한 결과
 =   두 테이블을 곱하여 합치는 타입 누락된 정보들을 불러올때 사용 

2) EQUI Join
   WHERE 절에 기술되는 조인 조건을 검사해서
   양쪽 테이블에 같은 값이 있으면 가져옴
=  공통의 항목이 있는 두 테이블을 합칠 때
     별칭이 꼭 필요함

3) Non-equi join
    한 컬럼의 값이 다른 컬럼의 값과 정확히 일치하지 않는 경우에 사용

4) outer join
    join 조건을 만족하지 않은 경우에도
    모든 행 출력
    LEFT [OUTER] JOIN     : 왼쪽테이블 기준으로
                                           (왼쪽테이블엔 없지만 오른쪽테이블에 있는애들은 다출력)
    RIGHT [OUTER] JOIN  : 오른쪽테이블을 기준으로 출력
                                            (오른쪽테이블에 없지만 왼쪽테이블에 있는애들은 다 출력)
    FULL [OUTER] JOIN    : 양쪽 테이블 데이터가 없더라도 다 조인해줘


5) self join
    한 테이블의 행을 같은 테이블에 있는 행과 연결
    하나의 테이블을 마치 두개인 것 처럼 사용하여 조인





연습1. t_data01 테이블과 t_data02 테이블의  Catesian Product 구하기
Select *
From   t_data01 , t_data02


연습2. employees 테이블과 departments 테이블을 EQUI Join하여
            employee_id, first_name, department_name, department_id 을 출력

Select       e.employee_id, e.first_name, d.department_name, e.department_id
From        employees   e   , departments   d
WHERE    e.department_id = d.department_id
별명 사용(from 절)

Select e.employee_id, e.first_name, d.department_name, e.department_id
From employees e join departments d
ON  e.department_id = d.department_id
(조건문 where 대신에 on 쓸수 잇음 join을 써야됨)

2-1) 단, department_id가 100번인 데이터들만 조회

Select e.employee_id, e.first_name, d.department_name, e.department_id
From employees e join departments d
ON  e.department_id = d.department_id
AND e.department_id = 100


연습3. emplotees 테이블과 salary_grade테이블을 Non-equi join조인하여
            first_name, salary, grade 컬럼의 레코드 출력
            (단, grade는 salary가 salary_grade 테이블의
            low_sal과 high_sal 컬럼 범위값일 것)

SELECT first_name, salary, grade
From employees , salary_grade 
where salary between low_sal and high_sal
order by grade


연습4. employees 테이블과 salary_grade 테이블을 
           조인하여 전체 salary 별 grade와 각 grade의 갯수 출력
 
SELECT concat(grade,' 등급') "grade", concat(COUNT(grade),' 개') as 소계
From employees , salary_grade 
where salary between low_sal and high_sal
group by grade

          4-1) 단, grade의 소계가 10이상인 레코들만 출력

SELECT concat(grade,' 등급') "grade", concat(to_char(COUNT(grade),'00'),' 개') as 소계
From employees , salary_grade 
where salary between low_sal and high_sal
having COUNT(grade) >= 10
group by grade


연습5. employees 테이블과 departments 테이블을 조인하여
            last_name, job_id, department_id, department_name을 출력

SELECT  e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d
WHERE e.department_id = d.department_id


연습6. employees 테이블과 departments 테이블을 조인하여
            각 부서별 급여의 합을 급여합의 높은  순으로 검색하여
            department_id, department_name, 부서별 급여의 합을 출력
            단, 부서 아이다가 없는 레코드들도 출력
출력형태 :   부서 아이디     부서명        부서급여합
                    --------------------------------------------
                        10                     ****             0000000



select e.department_id "부서 아이디", d.department_name "부서", to_char(sum(e.salary),'000,000') "부서 급여합"
FROM   employees e left outer join departments d
on e.department_id = d.department_id
group by e.department_id,d.department_name
ORDER BY sum(e.salary) desc


연습7. employees 테이블을 셀프 조인하여
            emloyee_id, first_name, manager_id, manager_name
            단, manager가 없는 사람들의 데이터는 ceo로 출력



SELECT         e.employee_id, e.first_name, e.manager_id, 
                     NVL2(m.first_name,m.first_name,'CEO') as "MANAGER_NAME"
FROM          employees e left outer join employees m
ON               e.manager_id = m.employee_id
ORDER BY   employee_id


====================================================

6. SUB QUERY 서브 쿼리

하나의 테이블에서 검색한 결과를
다른 테이블에 전달하여
새로운 결과를 검색

하나의 SELECT 구문(메인 쿼리) 안에 포함된
또 하나의 SELECT 구문(서브 쿼리)

비교 연산자의 오른쪽에 반드시 괄호로 둘러싸서 명시
특별한 경우를 제외하고 ORDER BY를 쓰면 안 됨

SELECT ~~~
FROM ~~~
WHERE ~~~ >= (SELECT ~~~ FROM~~~)

1. 단일행 서브 쿼리
    수행 결과가 오직 하나의 행만 반환
    메인 쿼리의 WHERE 절에서 단일 행 비교 연산자만
    사용해야 함 (=, >, >= , <, < >)
 단일행 쿼리의 결과값이 하나의 행일때 사용
 진행순서 1) 서브쿼리를 먼저 찾는다. 2) 찾고자하는 쿼리의 조건절에 집어넣는다.






연습1. Lex와 같은 부서 사람들의 목록 출력 서브 쿼리 적용 전
            Lex의 department_id를 찾는다.
            찾아낸 department_id와 일치하는 사람들의 목록 출력한다.

select first_name,department_id
from employees
where department_id = (select department_id
                                           from employees
                                           where first_name = 'Lex')


연습2. 평균 salary 보다 적은 salary를 받는 사람들의
           first_name, salary, job_id를 출력
            단, 평균 salary는 소수점 이하 반올림하여 
                   salary 내림차순 정렬

select first_name,salary,job_id
from employees
WHERE salary  <= 
(
select round(avg(salary))
from employees
)
ORDER BY salary desc

연습3. 가장 낮은 급여를 받는 job_id에 대해 해당하는
             job_id 와 평균 급여 출력



연습4. 가장 낮은 평균 salary를 받는 job_id에 대해 
           해당하는 job_id 와 평균 salary 출력

select job_id, avg(salary) as "평균 급여"
from employees
having avg(salary)=
(
select min(avg(salary))
from employees
group by job_id
)
group by job_id

16/12/09===================================================================

2. 다중행 서브 쿼리
반드시 다중행 연산자와 함께 사용해야 함

  비교 조건 서브 쿼리의 결과 중에서 
 IN              	 :   하나라도 일치하는 경우
 ANY, SOME	 :   하나 이상이 일치하는 경우
 ALL		 :   모든 값이 일치하는 경우
 EXIST 		 :   만족하는 겂이 하나라도 존재하는 경우



ANY/ALL		:  주로 =, > , < , >= , <= , <> 와 같이 사용
> ANY		:  최소값보다 큼
> ALL 		:  최대값보다 큼
 <ANY		:  최대값보다 작음
 <ALL 		:  최소값보다 작음







연습1. 각 department_id 별로 최소 급여를 받는 사원들의
            first_name, salary , department_id 출력

select first_name,salary, department_id
from employees
where (department_id,salary) in
(
select department_id, min(salary)
from employees
group by department_id
)


연습2. department_id가 30번인 사원들의  salary 중 
            가장 큰 값보다 더 많은 salary를 받는 사람들의
            first_name, salary 출력

select first_name,salary
from employees
where salary >all
(
select max(salary)
from employees
where department_id = 30
group by department_id
)

연습3. department_id가 30번인 사원들의  salary 중 
            가장 작은 값보다 더 많은 salary를 받는 사람들의
            first_name, salary 출력

select first_name,salary
from employees
where salary >any
(
select min(salary)
from employees
where department_id = 30
group by department_id
)

연습4. commission_pct가 0.1, 0.15 두 값보다 모두 큰
            사람들의 first_name, commission_pct 출력
            (commission_pct 내림 차순 정렬)
select commission_pct
from employees
where commission_pct >all(0.1,0.15)
ORDER BY commission_pct desc


연습5. salary가 10000 이상인 사원들의 department_id 와 
           같은 department_id의 first_name, salary, department_id 출력


============================================
3. 스칼라 서브 쿼리

메인 쿼리의 select 절에서 함수처럼 사용되는 쿼리문

연습1. employees 테이블과 departments 테이블을
            조인하여 first_name, department_name 출력

select first_name,
       department_id, 
(select department_name
from   departments d
where e.department_id = d.department_id
) "부서 이름"
from   employees e 
order by department_id



===============================================

4. 상관형 서브 쿼리

메인 쿼리에서 넘긴 데이터를 서브 쿼리가 처리한 후 돌려주는 방식


연습1. 사원들의 소속 부서의 평균 salary보다 적은 salary를 받는  
            사람들의 first_name, salary, department_id 목록 출력

1.WHERE 절로 해결

select first_name,salary,department_id 
from employees f
where salary < (select avg(salary)
from employees a
where f.department_id =a.department_id)
order by department_id

2.FROM 절로 해결

select    f.first_name,  f.salary,  b.department_id 
from     employees f, (select department_id, AVG(salary) 평균
                                     from employees
                                     group by department_id)       b
where   f.department_id = b.department_id
and       f.salary < b.평균
order by  department_id

3.간단히
select first_name,salary,department_id 
from employees outer
where salary < (select avg(salary)
                           from employees 
                           where department_id = outer.department_id)
order by department_id,salary


연습2. department_id 별로 department_id,
            department_name, 평균 salary 와 
            각 부서가 위치한 city 및 country_name을 조회
            단, 평균 salary가 높은 순서로 정렬하되 소수점 이하
           자릿수는 버림
      
select e.department_id, d.department_name, trunc(avg(e.salary)) "평균 salary", l.city, c.country_name
from   employees e,departments d, locations l, countries c
where  e.department_id = d.department_id
AND    d.location_id = l.location_id
AND    l.country_id = c.country_id
group  by e.department_id,d.department_name, l.city, c.country_name
ORDER  BY trunc(avg(e.salary)) DESC



=========================================================

View
 
물리적인 테이블에 근거한 논리적인 가상 테이블
실질적인 데이터는 없으나.
실제테이블을 사용하는 것과 동일하게 사용 가능
기존 테이블에서 파생된 객체로
기본테이블에 대한 하나의 쿼리문

1.create view
   뷰 생성

2.create or replace force view
뷰를 생성 하거나 기존 뷰가 존재하는 경우 변경

3. FORCE
기존의 존재 여부와 상관 없이 뷰생성

4. WITH REDAD ONLY
    SELECT만 가능하도록 처리
    생략 시에는 , INSERT/DELETE/UPADTE 모두 가능


5. WITH CHECK  OPTION
    서브 쿼리문에 WHERE 절을 추가하여 변경 금지 설정
---------------------------------------------------------------

뷰의 종류

1. 단순 뷰
     뷰를 생성할 서브 쿼리에 조인 조건이 안 들어가고
      1개의 테이블로 만들어지는 뷰

2. 복합 뷰
     뷰를 생성할 서브 쿼리에 여러 개의 테이블이 
     조인되어 만들어지는 뷰

3. 인라인 뷰
    CREATE VIEW로 생성된 뷰가 아니라
    문장 내에서 임시로 생성된 형태의 뷰
    FROM 절에 서브 쿼리로 기술





연습1. job_id가 'IT_PROG'인 사원들이 소속되어있는 
          last_name, job_id, job_title,department_name
          단, FROM 절에 서브 쿼리문을 이용

select e.last_name, e.job_id, j.job_title,d.department_name
from departments d, jobs j  ,(select last_name,job_id, department_id
                                                  from employees
                                                   where job_id = 'IT_PROG') e 
where e.job_id = j.job_id
AND   e.department_id = d.department_id


연습2. employees 테이블을 이용하여  employee_id, 
           last_name, job_id, salary 컬럼을 갖는 단순 뷰 v_emp 생성
           (단, 기존에 뷰가 존재하지 않는 경우에만)

create  view V_EMP
as
select employee_id, last_name, job_id, salary
from employees
   

연습3. employees 테이블을 이용하여 employee_id, 
           last_name, job_id, salary 컬럼을 
          각각 사원번호, 성명, 직무번호, 급여의 이름으로
          갖는 단순 뷰 v_emp 생성
           (단, 기존에 뷰가 존재하는 경우 새로운 뷰로 변경되도록 처리)

create or replace  view V_EMP(사원번호, 성명, 직무번호, 급여)
as
select employee_id , last_name, job_id, salary
from employees


연습4. department_id 별로 salary의 총액과 평균을 조회만 
            할 수 있는 V_salary_info 뷰를 작성

create or replace view V_salary_info(부서번호,급여총액,급여평균)
as
select department_id,  sum(salary),  avg(salary)
from employees 
group by department_id
with read only

업데이트 오류 메세지
ORA-01732: data manipulation operation not legal on this view
update v_salary_info
SET 급여총액 = 10000
WHERE 부서번호 = 100

연습 5. employees 테이블과 departments 테이블을 조인하여
            emploee_id, last_name, salary, department_name
            컬럼을 
            각각 emp_id, emp_name, sal, dept_name의 이름으로 
             V_EMP_INFO 뷰 생성
create or replace view v_emp_info
as
select e.employee_id, e.last_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id

Rownum 은  데이터의 열을 시스템상 나열해줌
select rownum, last_name ,salary
from employees

인라인 
select rownum, e.last_name, b.salary
from employees e,
(select  last_name ,salary
from employees
ORDER BY salary)b
where e.salary = b.salary

where절





연습6. employees 테이블에서 job_id가 IT_PROG 이거나  
           PU_CLERK인 데이터들의 employee_id, last_name, 
           job_id, salary 컬럼을 갖는 v_emp_view 뷰 생성
          단, 조건으로 지정된 컬럼 값 변경 금지 설정


           salary가 5000이상인 사람들의 job_id를 IT_GUY로 변경

연습7.employees 테이블에서 hire_date가 가장 빠른 사람 5명을 조회하는
          v_emp_hire 뷰를 생성

create or replace  view v_emp_hire
as
select rownum 순위, hire_date
from (select hire_date
     from employees
     order by hire_date)
where rownum <= 5

연습8. employees 테이블에서 salary 상위 10명인 사람들의
            last_name, job_id, salary를 출력

select rownum, e.last_name,e.job_id, b.salary
from employees e,
(select  last_name ,salary
from employees
ORDER BY salary)b
where e.salary = b.salary


연습9. department_id 별 최소/최대/평균 급여를 출력하는 v_dept_info 작성
           단, 평균급여는 반올림
           출력형태 : 부서명        최소급여           최대급여         평균급여
                             --------------------------------------------------------
create or replace view v_dept_info
as
select d.department_name 부서명, min(e.salary) 최소급여, 
       max(e.salary) 최대급여, round(avg(e.salary)) 평균급여
from employees e ,departments d
where e.department_id = d.department_id
group by d.department_name
order by department_name

과제. 나의 view 테이블 만들기

16/12/12===========================================================================================================


SEQUENCE
연속적으로 자동 생성되는 숫자
Ex) 메모 번호 순서 등록할때는 시퀀스 메모등록일자(SYSDATE)

CREATE SEQUENCE 시퀀스명
START WITH      시작값
INCREMENT BY    증가값
MAXVALUE        최대값
MINVALUE        최소값
CYCLE           재시작(순환)여부
CACHE           캐쉬사용 여부
                메모리 상에서 시퀀스 관리 지정
                기본 값은 20(이내면 그냥 노캐시)


시퀀스 사용 : 시퀀스명.NEXTVAL

연습1.  시작값 1,  최소값1, 최대값 9999999999999
             시퀀스 값은 순환해서 사용하지 않도록
             T_MEMO_SEQ 시퀀스를 생성

CREATE SEQUENCE   "T_MEMO_SEQ"  
MINVALUE 1 
MAXVALUE 9999999999999 
INCREMENT BY 1 
START WITH 5 
NOCACHE  
NOORDER
 NOCYCLE ;


연습2. T_MEMO_SEQ 시퀀스를 이용하여
            T_MEMO 테이블에 메모 하나 추가
            
INSERT INTO T_MEMO
VALUES(T_MEMO_SEQ.NEXTVAL,'SEQ1','TOP','SEVER','SMITH_JPG',SYSDATE)

* 시퀀스를 사용할때 프라이머리 키 에러가 떳는지 잘 확인하자.


-CURRVAL
시퀀스의 LAST NUMBER 값이 NEXT VLAUE 값이 됨.
SELECT T_MEMO_SEQ.CURRVAL
FROM   DUAL
다음 메모의 작성된 순서를 알수 있다.

=================================================================================

INDEX

sql 명령문의 처리 속도를 향상 시키기 위해서
컬럼에 대해서 생성하는 오라클 객체

기본 키나 유일 키는 데이터 무결성을 확인하기 위해서 
수시로 데이터를 검색하기 때문에 빠른 조회를 목적으로
오라클에서 내부적으로 해당 컬럼에 자동으로 인덱스 생성


장점: 검색 속도가 빨라짐
      시스템에 걸리는 부하를 줄여서
      전체 시스템 성능 향상

단점: 인덱스를 추가적인 공간필요 및 생성 시간 소요
      DML이 자주 일어날 경우에는 오히려 성능 저하

ROWID 
오라클의 모든 데이터가 갖는 고유의 주소
(--데이터를 찾아갈 때 필요)
이 ROWID 정보를 모아서 갖고 있는 것이 인덱스


**인덱스를 사용해야 하는 경우
- 테이블에 행의 수가 많을 때
- WHERE 절에 특정 컬럼이 많이 사용될 떄
- 검색 결과가 전체 데이터의 2~4%정도일 떄
- JOIN에 자주 사용되는 컬럼이나 NULL을 포함하는 컬럼이 많은 경우



**인덱스를 사용하지 말아야 하는 경우
- 테이블에 행의 수가 적을 때
- WHERE 절에 특정 컬럼이 자주 사용되지 않을때
- 검색 결과가 전체 데이터의 10~15% 이상일 떄
- 테이블에 DML 작업이 많은 경우


인덱스 생성

CReate INDEX 인덱스 이름
ON           원본 테이블 명(원하는 컬럼명)



인덱스 종류

1. UNICQUE INDEX  
   --기본 키나 유일 키처럼 유일한 값을 갖는 컬럼에 생성
   



2. NON-UNIQUE INDEX
   중복된 데이터를 갖는 컬럼에 대해서 생성된 인덱스

    CReate INDEX 인덱스 이름
    ON           원본 테이블 명(원하는 컬럼명)



3. FUNCTION BASED INDEX
    함수 기반 인덱스
    WHERE 절에 산술 표현 또는 함수를 사용하는 경우
    이를 적용하여 생성하는 인덱스
    
    ex) WHERE salary = 10000
        WHERE salary*12 = 120000 
        산술표현이 적용된 수식

4. COMPOSITE INDEX
    결합 인덱스

    두 개 이상의 컬럼으로 구성하는 인덱스
    WHERE 절에서 두 개 이상의 조건이 AND로 연결되는
    경우에 많이 사용
    잘못 마들면 오히려 성능 악화 기능


연습1. 서브 쿼리를 이용하여 emp 테이블의 모든 데이터를 
       emp3 테이블에 추가하고, last_name 컬럼에 emp3_lastname_idx
       라는 인덱스 생성
    
       insert into emp3
       select      *
       from        emp

    CREATE INDEX emp3_lastname_idx
    ON           emp3(last_name)

연습2. 위에서 생성한 인덱스 삭제
       drop index emp3_lastname_idx


연습3. T_DATA01 테이블의 DATA_NO 컬럼에 DATA1_NO_IDX 라는 
       이름의 UPNIQUE 인덱스 생성

    CREATE UNIQUE INDEX DATA1_NO_IDX
    ON           T_DATA01(DATA_NO)

연습4. emp3 테이블의 salary 컬럼에 emp3_sal_idx라는 이름의 
       인덱스 생성하고, salary*12가 120000인 데이터의
       last_name, salary, salary*12를 출력 

    CREATE INDEX emp3_sal_idx
    ON           emp3(salary)
    select distinct last_name, salary, salary*12
    from emp3
    where salary*12 = 120000

연습5. emp3 테이블의 SALARY 컬럼 12배한 값으로2 EMP_SAL_FBIDX
       salary*12가 120000인 데이터의
       last_name, salary, salary*12를 출력 

    CREATE INDEX emp3_sal_FBIDX
    ON           EMP3(SALARY*12)

    SELECT DISTINCT last_name, salary, salary*12
    FROM EMP3
    where salary*12 = 120000


연습6. EMP3 테이블에서 SALARY가 10000 이상이고,
       JOB_ID가 MK_MAN인 데이터 검색해보고
       SALARY와 JOB_ID를 복합 인덱스로 
       emp3_sal_job_idx 생성

    SELECT SALARY, JOB_ID
    FROM EMP3
    where salary >= 10000
    And   job_id = 'MK_MAN'

    create index emp3_sal_job_idx
    on           emp3(salary,job_id)

    *과제 필요한 시퀀스를 만들고, 필요한 인덱스를 만들어서
    메일로 보냄
2016/12/13=======================================================================

과제. Q&A 게시판 Ver.01 data 테이블 만들기

요구사항 정의

1. 회원가입을 하고 아이디를 보유한 사람만 질문 가능
2. 답변은 관리자만 가능
3. 답변이 완료되면 답변 여부에 O 표시
4. ...

//출력 형태// USER INTERFACE

1번테이블
// Q & A 게시판//

                                                            [질문하기]
  NO.       질문                작성일자          작성자      답변여부
+--------------------------------------------------------------------+
|  1      첫번쨰 질문           12/31/2016          ABC          X    |
|  2      그냥 질문             11/30/2016          BBB          X    |
|  3      관리자님께            11/11/2016          CCC          O    |
+--------------------------------------------------------------------+
                           [작성자 검색 바]                   [질문하기]
                                                            --4. 질문 등록
=====================================================================


//Q & A 상세보기// "UI"
    번호       1
    질문       첫번째 질문           조회수 1
    작성일자    12/31/2016          추천 0
    작성자      ABC
    질문 내용   ~~~~~~~~~~
               ~~~~~~~~~~??

[수정] [삭제]                           [추천하기] --조회수가 증가해야됨 UPDATE
--쓴사람은 보이고 안쓴사람은 안보임
--삭제시 삭제시 삭제하시겠습니까 Y/N
==================================================================
    //답변//

    아직 답변이 등록 되지 않았습니다.        [등록]
             --등록이 안된경우

              첫번째 답변                   [수정] [삭제]--답변삭제는 업데이트
    등록일자: 12/31/2016

--제약 조건 답변은 관리자만 할 수있고 질문은 회원만할 수 잇음
       
=====================================================================

2번 테이블
//Q & A 게시판

    질문하기
    ---------------------------
    질문번호
    질문      ~~~~~~~~
    작성자    ~~~~~~
    질문내용  ~~~~~~
              ~~~~~~~?    
======================================================================

3. 테이블
//답변하기
    
    질문       ~~~~~
    질문 내용  ~~~~~~??
    질문 번호  1
    -- 질문 내용이 보임
    답변    ~~~~~!       
    작성자


4. 회원 테이블

 




--T_QNA_Q 질문 쿼리

** 질문 상세 보기
SELECT *
FROM T_QNQ 
WHERE T_QUESTION = ''

** 질문 내용 수정
UPDATE T_QNA_Q
SET 내용= ''
FROM T_QNA_Q
WHERE 내용 = ''

** 질문 내용 삭제
DELETE T_QUESTION
FROM T_QNA_Q
WHERE T_QUESTION =''


** 질문 추가
INSERT INTO T


** 질문 목록 출력




--답변 쿼리

** 답변 삭제

** 답변 수정

** 답변 출력

과제 답안 제출 쿼리 문============================================================



1. 회원 테이블                   테이블 이름: MEMBER
항목            컬럼명     데이터타입(크기)   제약조건
-------------------------------------------------------------
ID            M_USER         VARCHAR2(8)      PK
PASS          M_USERPW       VARCHAR2(10)	  not null  
이메일         M_EMAIL        VARCHAR2(30)	    UK not null
성별           M_GENDER       CHAR(1)	         CHECK 
                                            M_GENDER IN('F','M'), not null
전화           M_PHONE        VARCHAR2(13)	 not null    
이름           M_NAME    VARCHAR2(10)	         not null
생일           M_BIRTH        DATE             not null

--관리자는  ADMIN, T_MEMBER를 가져다 쓸꺼임


2.Q & A 테이블                        테이블 이름: QNA

항목               컬럼명             데이터타입(크기)        제약조건
-----------------------------------------------------------------------------
번호              Q_NO                NUMBER                  PK,SEQ
질문등록일         Q_QDATE              DATE                  DEFAULT SYSDATE
답변등록일         Q_ADATE              DATE                  
작성자             Q_USER             VARCHAR2(8)             FK
질문제목           Q_TITLE             VARCHAR2(60)           
질문내용           Q_QCONTENTS          VARCHAR2(150)
답변내용           Q_ACONTENTS          VARCHAR2(500)     DEFAULT '아직 답변이 등록 되지 않았습니다.'
답변여부           Q_CHECK             CHAR(1)                CHECK, DEFAULT 'N',(CHECK IN('X','O'))
추천수             Q_BEST              NUMBER                 DEFAULT 0
조회수             Q_CLICKS            NUMBER                 DEFAULT 0


===========================================
SEQUENCE

번호      구분               이름
1        ID_NO_SEQ          번호


===========================================
SQL


1. 회원정보 데이터 테이블 생성 쿼리

CREATE TABLE  "MEMBER" 
   (	"M_USER" VARCHAR2(8), 
	"M_USERPW" VARCHAR2(10), 
	"M_EMAIL" VARCHAR2(30), 
	"M_GENDER" CHAR(1), 
	"M_PHONE" VARCHAR2(13), 
	"M_NAME" VARCHAR2(10), 
	"M_BIRTH" DATE, 
	 CONSTRAINT "T_MEMBER_PK" PRIMARY KEY ("M_USER") ENABLE, 
	 CONSTRAINT "T_EMAIL_UK" UNIQUE ("M_EMAIL") ENABLE, 
	 CONSTRAINT "T_GENDER_CK" CHECK ("M_GENDER"='F' OR "M_GENDER"='M') ENABLE, 
	 CONSTRAINT "T_USERPW_NN" CHECK ("M_USERPW" IS NOT NULL) ENABLE;

1-1. 회원등록
INSERT INTO MEMBER
VALUES('ADMIN','ADMIN','ADMIN@ADMIN.COM','M','010-1111-1111','김지성','12/01/2016')
--모두 다 작성
--이메일 중복 안되게


2. Q & A 데이터 테이블 생성 쿼리

    CREATE TABLE  "QNA" 
   (	"Q_NO" NUMBER, 
	"Q_QDATE" DATE DEFAULT SYSDATE, 
	"Q_ADATE" DATE, 
	"Q_USER" VARCHAR2(30), 
	"Q_TITLE" VARCHAR2(60), 
	"Q_QCONTENTS" VARCHAR2(150), 
	"Q_ACONTENTS" VARCHAR2(500) DEFAULT '아직 답변이 등록 되지 않았습니다.', 
	"Q_CHECK" CHAR(1) DEFAULT 'N', 
	"Q_BEST" NUMBER DEFAULT 0, 
	"Q_CLICKS" NUMBER DEFAULT 0, 
	 CONSTRAINT "Q_NO_PK" PRIMARY KEY ("Q_NO") ENABLE, 
	 CONSTRAINT "Q_CHECK_CK" CHECK (Q_CHECK IN('Y','N')) ENABLE
   ) ;ALTER TABLE  "QNA" ADD CONSTRAINT "Q_USER_FK" FOREIGN KEY ("Q_USER")
	  REFERENCES  "MEMBER" ("M_USER") ON DELETE SET NULL ENABLE;



3. Q & A 게시판 목록 출력 --목록 버튼

        SELECT  Q_NO "NO.", Q_TITLE "질문", Q_QDATE "작성 일자",
                Q_USER "작성자", Q_CHECK "답변여부",Q_CLICKS "조회수",
                Q_BEST "추천수"
        FROM    QNA 

3-1. 작성자 찾기 --검색 란
        SELECT  Q_NO "NO.", Q_TITLE "질문", Q_QDATE "작성 일자",
                Q_USER "작성자", Q_CHECK "답변여부",Q_CLICKS "조회수",
                Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_USER = 'ADMIN'


4. 질문 등록 --등록 버튼
    INSERT INTO QNA(Q_NO, Q_QDATE, Q_USER, Q_TITLE, Q_QCONTENTS)
    VALUES      (ID_NO_SEQ.NEXTVAL,SYSDATE,'ADMIN','게시판 공개','게시판을 열겠습니다.')
    4-1. 질문 등록 화면--질문 등록 완료 버튼
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO =(SELECT MAX(Q_NO)
                       FROM   QNA)

5. 질문 수정
    5.1수정화면 출력--질문 수정 버튼
        SELECT  Q_NO "작성번호" , Q_USER "작성자", Q_TITLE "제목",Q_QCONTENTS "질문내용"
        FROM    QNA
        WHERE   Q_NO = 4        
    5.2 수정 처리
        UPDATE  QNA
        SET     Q_TITLE = '' , Q_QCONTENTS = ''
        WHERE   Q_NO = 4

    5.3수정 확인 화면 --완료버튼
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO =4

6. 질문 삭제 --삭제 버튼
    DELETE  QNA
    WHERE   Q_NO = 4
    6-1. Q & A 게시판 목록 화면
        SELECT  Q_NO "NO.", Q_TITLE "질문", Q_QDATE "작성 일자",
                Q_USER "작성자", Q_CHECK "답변여부",Q_CLICKS "조회수",
                Q_BEST "추천수"
        FROM    QNA 


7. 추천 --추천 버튼
    UPDATE  QNA
    SET     Q_BEST = (Q_BEST +1)
    WHERE   Q_NO = 4

8. 조회수 --질문 클릭 버튼
    UPDATE  QNA
    SET     Q_CLICKS = (Q_CLICKS +1)
    WHERE   Q_NO = 4

9. 질문 상세 보기 
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO =4

10. 답변 등록
   10.1 질문 화면 출력 --답변하기 버튼
        SELECT  Q_NO "질문번호", Q_USER "작성자", Q_TITLE "제목",Q_QCONTENTS "작성내용"
        FROM    QNA   
        WHERE   Q_NO = 4 
   10.2 답변 등록 처리 
        UPDATE  QNA
        SET     Q_ACONTENTS = '',Q_CHECK='Y', Q_ADATE=SYSDATE
        WHERE   Q_NO = 4    
   10.3 답변 등록 화면 --완료 버튼
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO =4

11. 답변 수정   
    11.1 답변 수정 화면 출력 --답변 수정 버튼
        SELECT  Q_ACONTENTS "답변내용"
        FROM    QNA
        WHERE   Q_NO = 4
    11.2 답변 수정 처리
        UPDATE  QNA
        SET     Q_ACONTENTS = '',Q_CHECK='N', Q_ADATE=SYSDATE
        WHERE   Q_NO = 4
    11.3 답변 등록 화면 --완료 버튼
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO =4


12. 답변 삭제--답변 삭제 버튼
    UPDATE  QNA
    SET     Q_ACONTENTS = DEFAULT, Q_CHECK = 'N'
    WHERE   Q_NO = 4    
    12.1 답변 등록 화면 --완료 버튼
        SELECT  Q_NO "NO.", Q_TITLE "제목",Q_QDATE "작성일자", 
                Q_USER "작성자", Q_QCONTENTS "질문내용",Q_ACONTENTS "대답내용", 
                Q_ADATE "답변 등록일자",Q_CLICKS "조회수", Q_BEST "추천수"
        FROM    QNA
        WHERE   Q_NO = 4


13. 시퀀스 1 생성
CREATE SEQUENCE   "ID_NO_SEQ"  
MINVALUE 1 
MAXVALUE 99999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE  
NOORDER  
NOCYCLE ;


2016/12/14=======================================================================

C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN

tnsnames.oracle: 클라이언트 들이 오라클 서버에 접속하기 위한 정보 적혀있음
DB에 접속할 때 나중에 JABA나 
오라클 서버와 개발하는 환경과 같지 않다. 원격으로 접속한다.
ORACLE DATA BASE MANAGEMENT SERVER 어딘가 설치되어있을거임
HR, DEV, SYS, EMP,.... 이 DBMS 서버에 들어 있을 거임
클라이언트가 SQL PLUS 로 DBMS에 서버 접속 요청을 함

listener.oracle: 서버에서 클라이언트 명령을 승인하거나 관리 감독함

============================================================

1. HR SQL COMMAND line 접속방법

1)처음 접속
SQL> CONN SYS/1111 AS SYSDBA

1-1) 계정 만들기
SQL> CONN SYS/1111 AS SYSDBA -- 계정을 만들려면 SYS관리자로 들어가야됨
SQL> CREATE USER [유저네임] IDENTIFIED BY [비밀번호]

2)HR 계정 관리자 승인
SQL> ALTER USER [hr] ACCOUNT UNLOCK;

3)계정 비번 수정
SQL> ALTER USER hr IDENTIFIED BY 1111
SQL> CONN hr/1111


이 방법도 잇음
SQL> ALTER USER hr IDENTIFIED
SQL> CONN / AS SYSDBA





==============================================================
 
SQL * PLUS 명령어

> HELP SET


    1.편집명령

        방향키로 저
        내가 했던 명령은 버퍼에 저장되어있음 
        > L: SQL문을 실행했던 마지막 명령어를 볼수있고
        > /: 버퍼에 저장된 마지막 명령어를 실행 함
        > R: RUN 버버에 저장된 SQL문을 표시하고 실행한다.
    
    2.파일 관련 명령
        버퍼의 내용을 파일에 저장하는 명령어들
        
        > ed [파일명]: 버퍼에 저장된 마지막 명령어를 메모장으로 표시하고 
            메모장을 수정한 뒤에 저장하게되면 sql 플러스에 명령문으로 표시됨
            
        > SAVE 파일명[.확장자][REPLACE][APPEND]
            --REPLACE 마지막 명령어로 바꾸기
            --APPEND  마지막 명령어 추가

        > GET [경로\파일명]
            쿼리문이 들어있는 파일을 버퍼로 불러옴

        > @ [경로\파일명][.확장자]
            저장된 SQL파일의 모든 명령들을 바로실행하는 역할 [여러 데이터를 한번에 실행가능]

        > SPOOL 경로\파일명;    
        > [명령어들 입력];
        > SPOOL OFF;
            SPOOL을 지정한 시점부터 SPOOL이 끝난 시점까지
            입력된 쿼리문과 도출된 결과들이 지정된 경로에 .LST 파일로 저장됨
          
     
      
    
    3.DB 접속 및 종료

        > CONNECT 아이디/비밀번호
        > CONN    아이디/비밀번호
    
        > host: DOS FROMPT로 빠짐
         ㄴ > DIR/W [경로\파일명*] : 파일의 유무를 알 수 있음.
         ㄴ > CODE [경로\파일명*]: 코드를 메모장으로 바로 가져옴
         --TAB키를 누르면 파일관련된 파일을 자동으로 적음
        
        > exit :   SQL문에서는 아이디종료 
                   HOST의 DOSFT에서는 SQL문으로 다시 빠짐

    4.출력 형식
 
        > SET 명령어
            ㄴHELP SET 해서 여러 명령어들이 있음
        > SET SERVEROUTPUT ON/OFF
            PL/SQL, 프로시저가 화면으로 출력됨.  
          
        > SELECT * FROM TAB;
          클라이언트가 가지고있는 테이블을 모두 보여준다.

        > COL [컬럼명] FORMAT A숫자 --컬럼 너비조절 A숫자
          COL[UMN] 컬럼명 FORMAT A숫자 --컬럼의 항목 출력 길이
          COL[UMN] 컬럼명 FORMAT 9,999,999 --나타나는 자릿수
          COL[UMN] 컬럼명 FORMAT 000.00 --소수점 자리수
          
          > SELECT * FROM TAB;
        
        > desc [테이블명];
          테이블의 구성을 알수 있다.
        
        > SHOW ERRORS
          마지막에 실행된 명령문의 에러를 찾아낸다.


연습1. C 드라이브 밑에 DATA 폴더를 생성하고
      SQL PLUS에서 가장 마지막에 수행한 쿼리문을
      EXERCISE.SQL 파일로 저장 


      > SAVE C:\DATA\EXERCISE
      --SAVE [경로명\파일명] 경로로 따라가서 파일명으로 저장 

      연습1-1. DEPARTMENT_ID 중복안되게 추출한뒤
               EXERCISE.SQL 파일에 추가  [APPEND]


               > SAVE C:\DATA\EXERCISE APPEND

연습2. EMP2 테이블의 전체 데이터를 조회하고,
       DEPARTMENT_ID가 20인 데이터를 조회하는 결과를
       C 드라이브 밑의 DATA 폴더에
       EMP2_DEPTS.LS 파일로 캡쳐한 후,
       캡쳐한 파일을 SQL PLUS에서 출력


       > ED C:\DATA\DATA\EMP2_DPETS.LST

===========================================================

DB 권한

사용자가 특정 테이블 접근 가능 여부나
특정 테이블에 SELECT/DELETE/UPDATE/INSERT 등의 
쿼리문 실행 가능 여부제한

1. 시스템 권한 System Privileges
   사용자의 생성/제거, DB 접근 및 가종 객체 생성 등
   주로 DBA에 의해 부여

   CREATE/DROP USER --SYS계정으로 됨
   CREATE/DROP ANY TABLE
   GRANT CREATE SESSION TO [계정]--SYS계정으로 됨
   CREATE VIEW
   CREATE SEQUENCE
   CREATE PROCEDURE

2. 객체 권한 Object Privileges
   겍체를 조작할 수 있는 권한
   (테이블, 뷰,시퀀스, 인덱스 등)


===========================================================

시스템 권한

1. CREATE 사용자 생성
   오라클 설치할 때 자동으로 생성되는
   디폴트 사용자 가운데
   시스템 권한을 가진 데이터베이스 관리자만 생성가능
   --(SYS,SYSTEM)

   > CREATE USER 사용자명 IDENTIFIED BY 비밀번호
   --DB 접속 권한이 부여되지않아 접속불가

2. GRANT
   DB권한이 있는 사용자가 다른 사용자에게 시스템 권한 부여
   --예를 들면 DML(SELECT,INSERT,UPDATE,DELETE)
   
   > GRANT [권한명] TO [계정] WITH ADMIN OPTION
     --다른 사용자에게 권한을 넘겨 줄수 잇다.






연습1. SYS 계정으로 로그인하여 
       아이디는 USER1, 비밀번호 1111을 사용자 생성
       

       > CREATE USER USER1 IDENTIFIED BY 1111

연습2. 위에서 생성한 USER1에게 DB 접속 권한인 CREATE SESSION을 부여
       

       > GRANT CREATE SESSION TO USER1 

연습3. 아이디는 user2, 비밀번호 1111로 사용자 생성하고
      DB접속과 부여받은 권한을 USER3에게 DB 접속 권한 부여


       > CREATE USER USER2 IDENTIFIED BY 1111;
       > GRANT CREATE SESSION TO USER2 WITH ADMIN OPTION;
       > CREATE USER USER2 IDENTIFIED BY 1111; 
       > CONN USER2/1111 ;
       > GRANT CREATE SESSION TO USER3;


============================================================================

객체 권한

권한              TABLE      VIEW      SEQUENCE     PROCEDURE
.....................................................................
ALTER               O     |         |      O     |
                          |         |            |
DELETE              O     |    O    |            |
                          |         |            |
EXECUE                    |         |            |       O
                          |         |            |
INDEX               O     |         |            |
                          |         |            |
INSERT              O     |    O    |            |
                          |         |            |
REFERENCE           O     |         |            |
                          |         |            |
SELECT              O     |    O    |      O     |
                          |         |            |
UPDATE              O     |    O    |            |

권한 범위
특정 객체에 대한 권한은
기본적으로 그 그 객체를 만든 사용자에게만 주어짐

스키마 SCHEMA
객체를 소유한 사용자
자신이 소유한 객체는 스키마 생략 가능

1.GRANT

GRANT 권한명(SELECT,UPDATE,INSERT,DELETE) | ALL
ON    객체명 | 롤명 | PUBLIC
TO    사용자명

2.REVOKE
REVOKE 권한명(SELECT,UPDATE,INSERT,DELETE) | ALL
ON    객체명 | 롤명 | PUBLIC
FROM    사용자명



연습1. USER1 사용자에게 EMPLOYEES 테이블을 SELECT할 수 있는 
       권한 부여

SQL> CONN HR/1111
Connected.
SQL> GRANT SELECT
  2  ON EMLOYEES
  3  TO USER1;

Grant succeeded.

SQL> SELECT *
  2  FROM HR.EMPLOYEES;
--테이블에 스키마를 명시해야된다.

연습2. USER1 사용자에게 EMPLOYEES 테이블을 SELECT할 수 있는 
       권한 철회
       단, HR 사용자가 USER1에게 부여한 권한을 확인하고 처리

SQL> SELECT *
  2  FROM USER_TAB_PRIVS_MADE;

SQL> REVOKE SELECT
  2  ON EMPLOYEES
  3  FROM USER1;

Revoke succeeded.   

========================================================================


데이터 딕셔너리 DATA DICTIONARY

DB자원을 효율적으로 관리하기 위해
다양한 정보를 저장하는 시스템 테이블

사용자가 테이블을 생성하거나, 사용자를 추가하는 등의
작업을할 때 자동으로 갱신되서 해당 객체가 갖는 
메타 데이터 정보가 저장 됨


시스템이 직접 관리하기 때문에 조회를 할 경우
암호 같은 기호만 보여질 뿐 내용은 알 수 없음



========================================================================


데이터 딕셔너리 DATA DICTIONARY VIEW

    데이터 딕셔너리 원 테이블은 직접 조회하기가 
    거의 불가능하기 때문에 사용자가 이해 할 수 있는 데이터를 산출 한다.
    --제약조건 정보 조회를 하여 제약이 걸려있는 데이터를 지우고싶을때 연결된 다른 테이블의 제약을 확인한다.

종류
1. Static Data Dictionary View (DICT)--DICT로 모든 딕셔너리 확인가능
DESC(테이블 설명을 볼수 잇다.)
    DBA_~~~~ --데이터 베이스 관리자만 접근 가능한 객체 등의 정보조회
                ex) DBA_Tables : SYS나 SYSTEM이 사용가능한 TABLE를 볼 수 있음

    ALL_~~~~ --자신이 계정 소유 또는 권한을 부여 받은 객체등의 정보조회
                ex) ALL_tables : 전체 소유한 TABLE

    USER_~~~ --자신의 계정이 소유한 객체 드의 정보 조회
                ex) user_tables : 자신이 소유한 TABLE


2. Dynamic Performance View
   변경 내용 자동 반영

-------------------------------------------------------------------------------
제약조건 정보
1)USER_CONSTRAINTS
    CONSTRAINT_TYPE
    -P: 프라이머리 키
    -R: FRORIENG KEY
    -U: UNIQUE
    -C: CHECK

2)USER_CONS_COLUMNS

    제약조건이 걸린 컬럼들을 조회함   

3)USER_VIEWS

    뷰테이블을 정의한 쿼리문을 조회할때 씀

4)USER_SEQUENCES

    시퀀시스가 지정된 컬럼 조회

5)USER_IND_COLUMNS

    인덱스가 지정된 컬럼을 조회 하고 컬럼의 자세한 사항을 나타냄

6)USER_INDEXES

    인덱스가 연결된 테이블과의 관계를 조회

7)USER_TAB_PRIVS_MADE

    내가 남에게 준 권한을 조회

8)USER_TAB_PRIVS_RECD

    내가 가진 권한을 조회

9)USER_ROLE_PRIVS

    내가 가진 롤 권한

10)USER_SOURCE
    
    프로시저나 트리거를 볼 수 있다.



============과제 1 내가 사용할 딕셔너리가 무엇이 있을지======

1)USER_CONSTRAINTS
SELECT  CONSTRAINT_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE

어떤 제약 조건들을 걸었는지 모두 볼수 있음

2)USER_CONS_COLUMNS
SELECT   TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME
FROM     USER_CONS_COLUMNS
ORDER BY TABLE_NAME

어떤 테이블의 컬럼에 제약이 걸려있는지 알수 잇음

3)USER_VIEWS
SELECT VIEW_NAME, TEXT
FROM   USER_VIEWS
ORDER BY VIEW_NAME

만들어진 뷰테이블의 쿼리를 가져올수 있음
    
4)USER_SEQUENCES
SELECT SEQUENCE_NAME
FROM   USER_SEQUENCES
ORDER BY SEQUENCE_NAME

내가 적용할 시퀀스들을 알 수 있음

5)USER_IND_COLUMNS
SELECT INDEX_NAME,COLUMN_NAME
FROM USER_IND_COLUMNS
ORDER BY INDEX_NAME

내가 사용하는 인덱스가 어떤컬럼을 조회하는지 알수 있음
    

6)USER_INDEXES
SELECT INDEX_NAME,TABLE_OWNER
FROM USER_INDEXES
ORDER BY INDEX_NAME

지정된 인덱스의 원래 권한이 누구인지 알수 잇음
    

7)USER_TAB_PRIVS_MADE
SELECT PRIVILEGE, GRANTEE
FROM USER_TAB_PRIVS_MADE
ORDER BY PRIVILEGE

 어떤 권한을 누구한테 주었는지 알수 있음

8)USER_TAB_PRIVS_RECD
SELECT TABLE_NAME, Privilege
FROM USER_TAB_PRIVS_RECD

내가 어떤 권한을 가졌는지 알수있음



===+++====+++===+++===+++==+++===+++===+++===+++===+++===+++===+++===


//자주 사용하는 딕셔너리//
1.USER_OBJECTS(OBJ)
    - 모든 객체(테이블, 인덱스, 시퀀스 등..)에 대한 정보를 제공한다.

    -- 사용자의 테이블명을 조회하는 예이다 
    SELECT object_name 
      FROM USER_OBJECTS 
     WHERE object_type='TABLE';
    -- 아래는 시노님을 이용해서 조회하는 예이다.
    SELECT object_name 
      FROM obj 
     WHERE object_type='TABLE';


2.USER_TABLES(tabs)
    - 테이블에 대한 정보를 제공한다.

    -- 사용자가 소유한 테이블명과 테이블의 테이블스페이스를 조회하는 예이다. 
    SELECT table_name, tablespace_name 
    FROM tabs;


3.USER_TAB_COLUMNS(COLS)
    - 사용자가 소유한 테이블의 컬럼에 대한 정보를 제공한다.

    -- DEPTNO 컬럼이 있는 테이블과 테이터타입, 데이터사이즈를 조회하는 예이다. 
    SELECT table_name, data_type, data_length 
      FROM cols 
     WHERE column_name='DEPTNO' ;


4.USER_CONSTRAINTS, USER_CONS_COLUMNS
    - USER_CONSTRAINTS : 사용자가 소유한 제약조건 정보 제공
    - USER_CONS_COLUMNS : 컬럼에 할당된 제약조건 정보 제공

    -- 입력받은 테이블의 제약조건 정보를 조회하는 예이다. 
    SELECT SUBSTR(a.column_name,1,15) column_name,　　
             DECODE(b.constraint_type,
                 'P','PRIMARY KEY',
                 'U','UNIQUE KEY',
                 'C','CHECK OR NOT NULL',
                 'R','FOREIGN KEY') constraint_type,　　
           a.constraint_name　　
      FROM　user_cons_columns a, user_constraints b　　
     WHERE a.table_name = UPPER('&table_name')　
       AND a.table_name = b.table_name　　
       AND a.constraint_name = b.constraint_name　　
     ORDER BY 1;　　

    -- 테이블 명을 입력 하면 된다.
    table_name의 값을 입력하십시오: emp2 
    
    COLUMN_NAME    CONSTRAINT_TYPE    CONSTRAINT_NAME
    ------------- ----------------- -----------------
    DEPTNO           FOREIGN KEY         FK_DEPTNO
    EMPNO            PRIMARY KEY         PK_EMP


5.USER_INDEXES(IND), USER_IND_COLUMNS
    - USER_INDEXES(IND) : 사용자가 소유한 인덱스 정보 제공
    - USER_IND_COLUMNS: 인덱스 컬럼에 대한 정보 제공
 
    -- 사용자가 소유한 인덱스 정보를 조회하는 예이다. 
    SELECT index_name, table_name, tablespace_name 
      FROM user_indexes;

===+++====+++===+++===+++==+++===+++===+++===+++===+++===+++===+++===
연습1. HR 계정으로 SQL PLUS에 접속하여 사용 가능한 모든 테이블이름을
       내림차순으로 정령하여 출력
       단, USER_TABLES 데이터 딕셔너리 뷰를 사용
       
       > DESC USER_TABLES;


연습2. HR 계정이 소유하고 있는 테이블들의 제약조건 소유자,이름, 타입, 소속 테이블
       참조소유자, 참조 이름을 출력
       

SELECT OWNER, CONSTRAINT_NAME,  CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE



연습3.  EMPLOYEES 테이블에 관련되어 있는 인덱스 이름과 컬럼 이름을
        화면에 출력.

SELECT *
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES'

연습4. DICT 테이블에서 table_name에 ROLE이 포함되어 있는 레코드 조회

SELECT * 
FROM DICT 
WHERE TABLE_NAME LIKE '%ROLE%'

==============================================================================
2016/12/15

ROLE
사용자에게 보다 효율적으로 권한을 부여할 수 있도록 
여러 개의 권한을 묶어 놓은것

사전 정의 롤: DB 설치 시 기본 제공
    사용자가 데이터베이스에 접속 할 수 있도록 묶어놓은
    기본적인 시스템 권한 8가지

1.> CONNECT --모든 CONNECT권한을 다줌
    CREATE CLUSTER
    CREATE DATABASE LINK
    CREATE SEQUENCE
    CREATE SESSION
    CREATE SYNONYM
    CREATE TABLE
    CREATE VIEW
    ALTER SESSION

2. > RESOURCE --모든 RESOURCE 권한을 다줌
    사용자가 객체(테이블, 뷰, 인덱스 등)를 생성할 수 있도록
    하기 위해 묶어 놓은 시스템 권한

    CREATE CLUSTER
    CREATE PROCEDURE
    CREATE SEQUENCE
    CREATE TABLE --ALTER USER [계정] QUOTA 50M ON SYSTEM;
    CREATE TRIGGER

3.DBA ROLE
    사용자들이 소유한 데이터 베이스 객체를 관리하고
    사용자 생성/변경/제거 할 수 있도록 하는 모든 권한 보유
    


사용자 정의 롤: 사용자가 직접 롤 정의
    롤생성 > 롤에 권한 부여 > 롤 부여
    DBA     DBA/특정 사용자  DBA

    > CREATE ROLE [롤이름];
    > GRANT [권한이름] ON [테이블] TO [롤이름];  
    > CONN/ AS SYSDBA
    > GRANT [롤이름] TO [계정];


디폴트 롤 생성 및 사용
    롤에 시스템 권한과 객체 권한을 부여한 후 롤을 사용자에게 부여.


---------------------------------------------------------------
ROLE 회수

REVOKE  [롤이름]
FROM    [사용자 이름]

> SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = '계정'
> REVOKE [롤 이름] FROM [사용자이름]



연습1. 시스템 관리자 계정으로 롤그인하여
       아이디는 USER4, 비밀번호는 1111로 계정을 생성한 후 
       CONNECT와 RESOURCE 권한 부여

> CONN SYS/1111 AS SYSDBA
> CREATE USER USER4 IDENTIFIED BY 1111
> GRANT CONNECT, RESOURCE  TO USER4;
Grant succeeded.


연습2. THE_ROLE이라는 이름의 롤을 생성하고, EMPLOYEES 테이블의 
       조회 권한을 THE_ROLE에 부여한 후 생성된 롤을 USER4에게 부여

> CREATE ROLE THE_ROLE;
> SELECT OWNER,TABLE_NAME FROM ALL_TABLES WHERE TABLE_NAME ='EMPLOYEES'; 
> GRANT SELECT HR.EMPLOYEES TO THE_ROLE;
Grant succeeded.
> GRANT THE_ROLE TO USER4;     
Grant succeeded.

연습3. THE_ROLE2라는 이름의 롤을 생성하고, 
       데이터베이스 접속/테이블 및 뷰생성 권한을 부여한 후
       아이디는 USER5, 비밀번호는 1111로 생성성한 사용자에게 생성된 롤 부여
 
SQL> CREATE ROLE THE_ROLE2;
    Role created.
SQL> CREATE USER USER5 IDENTIFIED BY 1111 ;
    User created.
SQL> GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO THE_ROLE2;
    Grant succeeded.
SQL> GRANT THE_ROLE2 TO USER5;
    Grant succeeded.



연습4. BASIC_ROLE이라는 이름의 롤을 생성하고, 데이터베이스 접근 권한을 부여한후,
       EMPLOYEES 테이블을 수정/삭제/조회 가능한 권한도 부여.

       아이디가 tester1 ~ 3, 비밀번호가 1111인 사용자3개를 추가한 후,
       모두에게 위에서 생선한 롤 부여.
> CREATE ROLE BASIC_ROLE;
> GRANT CREATE SESSION TO BASIC_ROLE;
> GRANT UPDATE,DELETE,SELECT ON HR.EMPLOYEES TO BASIC_ROLE;
> CREATE USER TESTER1 IDENTIFIED BY 1111
> CREATE USER TESTER2 IDENTIFIED BY 1111
> CREATE USER TESTER3 IDENTIFIED BY 1111
> GRANT 


연습5. USER5에게 부여된 롤을 확인한 후
       부여된 롤을 회수





연습6. USER5에게 부여되었던 롤의 권한을 확인
       데이터 딕셔너리에 해당 롤의 소유자의 롤제거

--어떤 테이블이 있는지 확인
> DESC DICT 

--ROLE 이나 PRIVS가 관련된 어떤 테이블이 있는지 확인
> SELECT *
> FROM DICT
> WHERE TABLE_NAME LIKE '%ROLE%' 
OR TABLE_NAME LIKE '%PRIVS%'  
                        
--해당 ROLE 소유자 확인
> SELECT GRANTEE, GRANTED_ROLE
> FROM DBA_ROLE_PRIVS
> WHERE GRANTED_ROLE = 'THE_ROLE2';

GRANTEE              GRANTED_ROLE
-------------------- ------------------------------
SYS                  THE_ROLE2

--롤 회수
> REVOKE THE_ROLE2
> FROM SYS

Revoke succeeded.







==================================================================

PL/SQL

Oralces Procedual Language extension to SQL의 약자
데이터베이스 내의 데이터를 조작하기 위해서
SQL과 함께 제공

변수 저의, 조건 처리, 반복처리 등을 지원

구조      선언부       변수, 상수 선언
          실행부       로직 기술
          예외 처리부  예외 처리 기술  


형식      DECLARE     선언부
             --변수나 상수 선언
          BEGIN       실행부 시작
             --로직 기술
          END;        실행부 끝
          / 프로시저 종료

익명의 프로시저
          BEGIN 
          프로시져 이름;
          END;
          /

--에러가 났을 경우 SHOW ERRORS

ex) > SET SERVEROUTPUT ON
    > BEGIN
    > DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
    > END;
    > /
    HELLO WORLD!

    PL/SQL procedure successfully completed.

변수 

변수 선언 :     변수이름 데이터 타입(크기);

변수에 값 대입   [변수이름]:= ['저장할 값'];

연습1. 고객명
           ex) 원금과 이자율 및 이자를 저장할 변수 선언
               customer_name VARCHAR2(20);  //고객명
               principal number;            //원금
               interest_rate number(1,2);    //이자율
               interest number;              //이자


연습2. 위에서 선언한 변수에 다음의 값을 저장
       고객명 : kim,       customer_name := 'Kim';
       원금: 10000,        principal := 10000;
       이자율: 5%          interest_rate := 0.05; 
       이자: 원금 x 이자율  interest := principal*interest_rate;


연습3. 연습1과 2를 메모장 파일에 기술하여
       원금과 이자율 및 이자를 계산하여 화면으로 출력처리


DECLARE
customer_name VARCHAR2(20); 
principal number;           
interest_rate number(1,2);   
interest number;            

BEGIN
customer_name := 'Kim';
principal := 10000;
interest_rate := 0.05; 
interest := principal*interest_rate;
DBMS_OUTPUT.PUT_LINE('고객명 : '|| customer_name );
DBMS_OUTPUT.PUT_LINE('원금 : '|| principal );
DBMS_OUTPUT.PUT_LINE('이자율 : ' || interest_rate );
DBMS_OUTPUT.PUT_LINE('이자 : '|| interest );
END;
/

프로시저 ===============================================

PL/SQL을 저장해 놓고 필요한 경우 여러 번 호출하여 사용 가능

형식   CREATE [OR REPLACE] PROCEDURE 프로시저 이름
              [(매개변수1 IN|OUT|INOUT 데이터타입)
              (매개변수2 IN|OUT|INOUT 데이터타입)
              .....]
       IS                                --IN 넘겨받을 데이터
              [변수 선언]                 --OUT 넘겨줄 데이터
       BEGIN                             --INOUT 둘다
              처리할 내용1
              처리할 내용2
              ....
       END;
       /

실행   EXECUTE 프로시저이름
      EXECUTE 프로시저이름(매개변수 값)




연습4. DEV 사용자의 EMP 테이블의 모든 레코드를 복사하여
       EMP1테이블 생성하고,
       EMP1 테이블의 모든 레코드를 삭제하는 
       DEL_EMP1  프로시저 작성
/*EMP1 테이블의 모든 레코드를 삭제하는 프로시져*/
CREATE OR REPLACE PROCEDURE DEL_EMP1
IS
BEGIN
DELETE FROM EMP1;
END;
/
EXECUTE DEL_EMP1;


연습5. 임의의 변수에 생년월일 정보 8자를 저장하고
       ~~~~년 ~~월 ~~일의 형태로 출력하는
       BIRTH_INFO프로시저 작성
CREATE OR REPLACE PROCEDURE BIRTH_INFO
IS 
BIRTH_NO VARCHAR(8);
BEGIN
BIRTH_NO := '~~~~~~~~';
 DBMS_OUTPUT.PUT_LINE( SUBSTR(BIRTH_NO,1,4) ||'년 '|| SUBSTR(BIRTH_NO,5,2) || '월 ' || SUBSTR(BIRTH_NO,7,2) || '일');
END;
/
@ C:\DATA\PLSQL.SQL;
EXCUTE BIRTH_INFO

연습6. 생년월일을 8자리의 숫자로 (19991111)로 입력받아
      1999년 11월 11일의 형태로 출력하는
      BIRTH_INFO2 프로시저 작성

CREATE OR REPLACE PROCEDURE BIRTH_INFO
IS 
BIRTH_NO VARCHAR(8);
BEGIN
BIRTH_NO := '19991111';
 DBMS_OUTPUT.PUT_LINE( SUBSTR(BIRTH_NO,1,4) ||'년 '|| SUBSTR(BIRTH_NO,5,2) || '월 ' || SUBSTR(BIRTH_NO,7,2) || '일');
END;
/
@ C:\DATA\PLSQL.SQL;
EXCUTE BIRTH_INFO


연습7. 임의의 변수에 전화번호 8자리(12345678)를 입렵받아
       010-1234-5678의 형태로 출력하는 TEL_INFO프로시저 작성
       단,전화번호는 실행 시 마다 변경 가능
       
       CREATE OR REPLACE PROCEDURE TEL_INFO
       (TEL_DATA IN VARCHAR2)
       IS
       TEL VARCHAR2(20) := TEL_DATA;
       BEGIN
       TEL := '010-' ||
              SUBSTR(TEL,1,4) ||'-' ||
              SUBSTR(TEL,5);
       DBMS_OUTPUT.PUT_LINE('전화번호: '|| TEL);
       END;
       /


20161216================================================================

저장 함수

저장 프로시저와 달리 실행 결과를 넘겨줄 수 있음
넘겨줄 데이터의 타입과 값을 명시 해야함



형식   CREATE [OR REPLACE] FUNCTION 함수 이름
              [(매개변수1 IN|OUT|INOUT 데이터타입)
              (매개변수2 IN|OUT|INOUT 데이터타입)
              .....]
       RETURN 반환데이터 타입       
       IS                                --IN 넘겨받을 데이터
              [변수 선언]                 --OUT 넘겨줄 데이터
       BEGIN                             --INOUT 둘다
              처리할 내용1
              처리할 내용2
              ....
       RETURN 반환데이터 값
       END;
       /

실행           VARIABLE 변수이름 데이터타입(크기);
               EXCUTE:변수이름 := 함수이름
               EXCUTE:변수이름 := 함수이름([매개변수들])          
변수의값 출력   PRINT 변수이름;









연습8. BIRTH_INFO 프로시저를  함수 BIRTH_INFO_F로 변경
       /*임의의 변수에 생년월일 정보 8자를 저장하고
       ~~~~년 ~~월 ~~일의 형태로 출력하는
       BIRTH_INFO 함수 프로시저 출력*/

CREATE OR REPLACE FUNCTION BIRTH_INFO_F
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20) := '19991111';
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_NO,1,4) ||'년 '|| 
             SUBSTR(BIRTH_NO,5,2) || '월 ' || 
             SUBSTR(BIRTH_NO,7) || '일';
RETURN BIRTH_NO;
END;
/
VARIABLE BIRTH_OUT VARCHAR2(20);
EXECUTE:BIRTH_OUT := BIRTH_INFO_F;
PRINT BIRTH_OUT;

연습9. BIRTH_INFO 프로시저를 함수 BIRTH_INFO2_F로 변경
CREATE OR REPLACE FUNCTION BIRTH_INFO2_F
(BIRTH_DATA IN VARCHAR2)
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20) := BIRTH_DATA;
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_NO,1,4) ||'년 '|| 
             SUBSTR(BIRTH_NO,5,2) || '월 ' || 
             SUBSTR(BIRTH_NO,7) || '일';
RETURN BIRTH_NO;
END;
/
VARIABLE BIRTH_OUT2 VARCHAR2(20);
EXECUTE:BIRTH_OUT2 :=BIRTH_INFO2_F(19991111);
PRINT BIRTH_OUT2
/* 이것도 됨
CREATE OR REPLACE FUNCTION BIRTH_INFO2_F
(BIRTH_DATA IN VARCHAR2)
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20);
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_DATA,1,4) ||'년 '|| 
             SUBSTR(BIRTH_DATA,5,2) || '월 ' || 
             SUBSTR(BIRTH_DATA,7) || '일';
RETURN BIRTH_NO;
END;
/*/



연습10. TEL_INFO 프로시저를 TEL_INFO_F 함수로 변경.

CREATE OR REPLACE FUNCTION TEL_INFO_F
(TEL_DATA IN VARCHAR2)
RETURN VARCHAR2
IS
TEL VARCHAR2(20);
BEGIN
TEL := '010-' ||
       SUBSTR(TEL_DATA,1,4) ||'-' ||
       SUBSTR(TEL_DATA,5);

RETURN TEL;
END;
/
VARIABLE 전화번호 VARCHAR2(20);
EXECUTE:전화번호 :=TEL_INFO_F(19991111);
PRINT 전화번호



연습11. 익명의 프로시저를 작성하여
        BIRTH_INFO 프로시저를 실행한다.

BEGIN
BIRTH_INFO;
END;
/

==========================================================

오라클 계층형 쿼리

START WITH 조건1
    루트노드 식별
    조건1을 만족하는 행들은 모드 루트노드가 됨
    start with 절을 생략할 경우 모든 행들을 루트노드로 간주
    조건1에 서브쿼리도 사용 가능
    

CONNECT BY 조건2
    부모와 자식 노드들 간의 관계 명시
    조건2에는 반드시 prior 연산자를 포함시켜야함
    > prior 연사자를 이용하여 부모 노드의 컬럼 식별
    조건2에는 서브쿼리 사용 불가




PRIOR 연산자
    계층형 쿼리에서만 사용
    connect by 절에서 = 과 동등한 레벨로 사용되는 연산자
    connect by 절에서 해당 컬럼의 부모 행 식별


LEVEL Pseudo column
레벨 의사 컬럼
    rownum,rowid와 같이 실제로 테이블에
    저장되어 있지만 않지만 있는 컬럼처럼 사용 가능
    계층형 정보를 표현할 때 레벨 표시
    일반적인 컬럼처럼 select, where, order by 절에서 사용가능

====================================================================

1.T_BOARD 테이블 생성
   Column Name   	Data Type	  Nullable	Default	Primary Key
---------------------------------------------------------------
    MEMO_NO  	    NUMBER	        No	       -	     1
    PMEMO_NO    	NUMBER	        Yes	       0	     -
    TITLE	        VARCHAR2(100)	Yes	       -	     -
    CONTENTS	    VARCHAR2(4000)	Yes	       -	     -
    REG_DATE	    DATE	        Yes	       -	     - 

     CREATE TABLE  "T_BOARD" 
        (	"MEMO_NO" NUMBER, 
     	"PMEMO_NO" NUMBER DEFAULT 0, 
     	"TITLE" VARCHAR2(100), 
     	"CONTENTS" VARCHAR2(4000), 
     	"REG_DATE" DATE, 
     	 CONSTRAINT "T_BOARD_PK" PRIMARY KEY ("MEMO_NO") ENABLE
        ) ;
     
     CREATE OR REPLACE TRIGGER  "BI_T_BOARD" 
       before insert on "T_BOARD"               
       for each row  
     begin   
       if :NEW."MEMO_NO" is null then 
         select "T_BOARD_SEQ".nextval into :NEW."MEMO_NO" from dual; 
       end if; 
     end; 
     
     /
     ALTER TRIGGER  "BI_T_BOARD" ENABLE;
     


2.T_BOARD 테이블에 레코드 추가
    INSERT INTO t_board
    VALUES(T_BOARD_SEQ.NEXTVAL, 0, 'FIRST','MEMO',SYSDATE)

    INSERT INTO t_board
    VALUES(T_BOARD_SEQ.NEXTVAL, 1, 'FFF','RE: MEMO',SYSDATE)
    INSERT INTO t_board
    VALUES(T_BOARD_SEQ.NEXTVAL, 1, 'TTT','RE: MEMO',SYSDATE)

    INSERT INTO t_board
    VALUES(T_BOARD_SEQ.NEXTVAL, 0, 'SECOND','MEMO',SYSDATE)

    INSERT INTO t_board
    VALUES(T_BOARD_SEQ.NEXTVAL, 2, 'AAA','MEMO',SYSDATE)

3. T_BOARD 리스트


    글번호         제목                    작성일자
.............................................................
      1           FIRST                   SYSDATA
      3            ㄴTTT                  SYSDATA 
      6              ㄴAAA                SYSDATA     
      4            ㄴTTT                  SYSDATA
      2           FFF                     SYSDATA
      5           SECOND                  SYSDATA          

    SELECT MEMO_NO, PMEMO_NO, LPAD('▷▷▷▷▷ ', 2*(LEVEL - 1) ) || TITLE , REG_DATE
    FROM t_board
    START WITH PMEMO_NO = 0
    CONNECT BY PRIOR MEMO_NO = PMEMO_NO



4. T_BOARD 리스트- 루트 노드
--단순히 루트 노드만 표현함 페이징시 나타나는 리스트가 목록표.

    글번호         제목                    작성일자
.............................................................
      6           FIRST[3]                SYSDATA
      4           FFF                     SYSDATA
      1           SECOND                  SYSDATA              

     SELECT a.MEMO_NO as "글번호",
            a.TITLE ||'['|| NVL((select COUNT(b.pmemo_no)
                                 from t_board b 
                                 where a.memo_no = b.pmemo_no
                                 group by a.memo_no 
                                 ),0) ||']' as "제목"  , 
            a.REG_DATE as "작성일"
     FROM  t_board a
     where level =1
     START WITH PMEMO_NO = 0
     connect by prior memo_no = pmemo_no
     order by a.memo_no desc



5. T_BOARD 상세보기

    글번호     :   1
    고유번호   :   1    
    제목     : FRIST               
    작성일자 : SYSDATA
    내용     : ~~~~~

.............................................................
    댓글 내용 :                              작성일자:
        ㄴTTT                                    SYSDATA 
          ㄴAAA                                  SYSDATA     
        ㄴTTT                                    SYSDATA


작성글 상세보기
    --페이징 하게 될때 글번호(rownum)를 클릭하고들어감.

    select *
    from   
    (select rownum "글번호", memo_no "고유번호", title "제목 ", reg_date "작성일자", contents "내용"
    from t_board
    where pmemo_no = 0
    order by memo_no desc
    )
    where 고유번호 = 4        
    

댓글 상세보기

    select LPAD('▷▷▷▷▷', 2*(LEVEL - 1) ) || TITLE "댓글 제목",contents "댓글 내용" , reg_date "댓글 작성일자"
    from  T_BOARD 
    where CONNECT_BY_root memo_no = 1
    and pmemo_no <> 0
    START WITH PMEMO_NO = 0
    connect by prior memo_no = pmemo_no
    
    --고유번호(memo_no)를 자동셀렉을 염두해두고 잇음.
    select rownum, m
    from (SELECT MEMO_NO as m
     FROM  t_board 
     where pmemo_no = 0
     order by memo_no desc)


6. 글쓰기
    테이블에 pmemo_no에 default 값을 주면 입력할때 따로 할 필요없음.

    INSERT INTO T_BOARD(MEMO_NO,TITLE,CONTENTS,REG_DATE)
    VALUES(MEMO_NO_SEQ.NEXTVAL,'오늘 집에 갈수있나','모르겟어',SYSDATE)

    6-1.시퀀스
       CREATE SEQUENCE   "MEMO_NO_SEQ"  
       MINVALUE 1
       MAXVALUE 999999999999999999999999 
       INCREMENT BY 1 
       START WITH 1 
       NOCACHE  
       NOORDER  
       NOCYCLE ;

7. 댓글달기


    INSERT INTO T_BOARD
    VALUES(MEMO_NO_SEQ.NEXTVAL,'1','오늘 집에 갈수있나','모르겟어',SYSDATE)

--글번호(rownum)와 고유번(memo_no)가 다르기때문에 혹시몰라 고유번 셀렉을 따로 만들어둠
    select memo_no
    from t_board
    where 

8. PAGING - 한 페이지에 5개씩 출력

 번호    제목        작성일자       번호    제목        작성일자                      
------------------------------  ------------------------------           
  1     FIRST[2]                  5     FIRST[2]                  
  2     SECOND                    6     SECOND                                                         
  3     SECOND                    7     SECOND                 
  4     SECOND                    8     SECOND                 
  5     SECOND                    9     SECOND                 
  6     SECOND                    10    SECOND                 
  ---------------------------   --------------------------------                                  
  1 [2][3]                       [1] 2 [3]                  

select *
   from--페이징을 하려면 rownum를 고정시켜 줘야됨 별칭을 붙여주자.
   (  
    SELECT rownum as "글번호", "제목", "작성일"  
    
    from --리스트 목록을 from 절로 가져옴
         (SELECT a.MEMO_NO as "고유번호",
                a.TITLE ||'['|| NVL((select COUNT(b.pmemo_no)
                                     from t_board b 
                                     where a.memo_no = b.pmemo_no
                                     group by a.memo_no 
                                     ),0) ||']' as "제목"  , 
                a.REG_DATE as "작성일"
         FROM  t_board a
         where level =1
         START WITH PMEMO_NO = 0
         connect by prior memo_no = pmemo_no
         order by a.memo_no desc
         )
   )
    where "글번호" between 5*(2-1)+1 and  5*2
    -- 로우넘으로 다시 정렬하여 페이징을 만듬, 페이지 넘버에 숫자기입





=====
1. 시스템 정보를 주고 어떤 종류오라클의 어떤 버전을 설치할 수 있나.
64비트 쓰기 때문에답은 두개
ORACLE DATABASE 12C REALEASE 1
ORACLE DATABASE EXPRESSS EDITION 11G RELEASE2 (32BIT AVAILABLE)


2.listener.ora, tnsnmaes.ora 에서 확인할 수 있는 정보 3개는?
  sevice_name = xe (SID)를 다른이름으로?
리스너
host= 오라클 서버에 접속할 주소{ip}
port = 접속할 기본 포트
service_name= 데이터베이스명
protocol = 접속방식 TCP

3.오라클이 실행헀는지 확인하려면 작업관리자 관련된 서비스2개는 무엇이냐?
Oracle Service Xe
Oracle XERNS Listener

OracleService데이터베이스명
OracleOraDb10g_home1TNSListener

4.db화면을 하나 주고 테이블 하나를 만드는 스크립트를 쓰시오
 CREATE TABLE  "EMP" 
   (	"EMPNO" NUMBER(4,0) NOT NULL ENABLE, 
	"ENAME" VARCHAR2(10), 
	"JOB" VARCHAR2(9), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0), 
	 PRIMARY KEY ("EMPNO") ENABLE
   ) ;ALTER TABLE  "EMP" ADD FOREIGN KEY ("MGR")
	  REFERENCES  "EMP" ("EMPNO") ENABLE;
      ALTER TABLE  "EMP" ADD FOREIGN KEY ("DEPTNO")
	  REFERENCES  "DEPT" ("DEPTNO") ENABLE;

5. 1-listener.ora가 하는일 2-tnsnmaes.ora  하는일
리스너 = 클라이언트가 오라클 서버에 접속하기 위해서 서버 컴퓨터에 하는 설정
서버접속 정보설정 = 클라이언트에서 오라클 서버에 접속할 때 필요한 설정


6. 내가 부여한 권한과 내가 권한받은 딕셔너리 찾는 방법
USER_TAB_PRIVS_MADE

7. 데이터 랑 계정 생성자 sys,DBA


8. 서로 다른 테이블의 view 만드는 것  
create or replace view v_emp_info
as
select e.employee_id, e.last_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id
조인한다.

9. 시퀀스 만드는것 초기값 얼마 증가값 얼마
 CREATE SEQUENCE   "SEQQ"  
 MINVALUE 1 
 MAXVALUE 9999999999999999999999999 
 INCREMENT BY 1 
 START WITH 1 
 NOCACHE  
 NOORDER  
 NOCYCLE ;


last number= 현재 진행된 숫자

10. index로 인해 data딕셔너리 뷰로 하는것

USER_INDEXES(IND), USER_IND_COLUMNS
    - USER_INDEXES(IND) : 사용자가 소유한 인덱스 정보 제공
    - USER_IND_COLUMNS: 인덱스 컬럼에 대한 정보 제공
 
    -- 사용자가 소유한 인덱스 정보를 조회하는 예이다. 
    SELECT index_name, table_name, tablespace_name 
      FROM user_indexes;

11. alter 하는 쿼리 컬럼 추가
  ALTER TABLE 테이블명
  ADD(컬럼명 데이터 타입(자리수) DEFAULT(컬럼의 기본값 설정))
ALTER TABLE t_virtual
ADD   (no6 char(10) default '6th')


12. insert into 쿼리

INSERT(데이터 추가)

INSERT  INTO  테이블명[(컬럼명1, 컬럼명2, ...)]
VALUES(데이터1, 데이터2,....)

INSERT all (다중 데이터 입력)
INTO 테이블명 VALUES(데이터1, 데이터2,....)
INTO 테이블명 VALUES(데이터1, 데이터2,....)
SELECT   컬럼명1,컬럼명2,.......
FROM    DUAL;



복사 붙여넣기
서브 쿼리로 원본 테이블의 데이터를 한꺼번에 복사하여 추가
INSERT
INTO  테이블명
SELECT   컬러명
FROM    원본테이블명
WHERE 조건식

13. rollback, COMMIT

14. sql 내가 만든 테이블의 모든 쿼리 목록 보기 sql+
select dbms_metadata.get_ddl('TABLE','table name','user') DDL_QUERY from dual;
SELECT DBMS_METADATA.GET_DDL('TABLE','테이블명','테이블소유자') FROM DUAL;

15. 만든 인덱스 삭제할때
 drop index emp3_lastname_idx

16. 테이블 만들고 만들어진 테이블의 구조만 복사하기
CREATE TABLE [테이블명]
AS 
SELECT *
FROM EMP
WHERE 1=2; --거짓 조건

17. crossjoin을 다른 이름으로 하는 쿼리
Catesian Product(    CROSS JOIN)

    특별한 키워드 없이 SELECT문의 FROM 절에
    테이블명을 콤마로 구분하여 연속 기술
    얻어지는 컬럼의 수는 두 테이블을 더한 것이 되고,
    레코드 수는 두 테이블의 행을 곱한 결과
 =   두 테이블을 곱하여 합치는 타입 누락된 정보들을 불러올때 사용

18. 특정부서의 부서인원이 인원수 group by having 쿼리

SELECT department_id, COUNT(*), sum(salary)
From    employees
Having sum(salary) >= 20000
GROUP BY department_id
ORDER BY department_id


19. 어떤테이블의 권한 부여하는 것 select 권한
    > GRANT [권한이름] ON [테이블] TO [롤이름];  
   
    > CONN/ AS SYSDBA
    > GRANT [롤이름] TO [계정];
 GRANT UPDATE,DELETE,SELECT ON HR.EMPLOYEES TO BASIC_ROLE;

20. 프로시져를 호출할수 있는 익명의 프로시져,  그 프로시져를 함수로 바꿈
익명의 프로시저
        
        호출
          BEGIN 
          프로시져 이름;
          END;
          /


           CREATE [OR REPLACE] FUNCTION 함수 이름
              [(매개변수1 IN|OUT|INOUT 데이터타입)
              (매개변수2 IN|OUT|INOUT 데이터타입)
              .....]
       RETURN 반환데이터 타입       
       IS                                --IN 넘겨받을 데이터
              [변수 선언]                 --OUT 넘겨줄 데이터
       BEGIN                             --INOUT 둘다
              처리할 내용1
              처리할 내용2
              ....
       RETURN 반환데이터 값
       END;
       /

실행           VARIABLE 변수이름 데이터타입(크기);
               EXCUTE:변수이름 := 함수이름
               EXCUTE:변수이름 := 함수이름([매개변수들])          
변수의값 출력   PRINT 변수이름;

CREATE OR REPLACE FUNCTION TEL_INFO_F
(TEL_DATA IN VARCHAR2)
RETURN VARCHAR2
IS
TEL VARCHAR2(20);
BEGIN
TEL := '010-' ||
       SUBSTR(TEL_DATA,1,4) ||'-' ||
       SUBSTR(TEL_DATA,5);

RETURN TEL;
END;
/
VARIABLE 전화번호 VARCHAR2(20);
EXECUTE:전화번호 :=TEL_INFO_F(19991111);
PRINT 전화번호;



21. 만드는 프로시져나 트리거에 내용들을 이름 확인하기위해서 select 명령어 user_ooo잇다.

    SELECT *
    FROM ALL_OBJECTS --USER_OBJECTS
    WHERE object_type ='PROCEDURE';


     SELECT text 
     FROM USER_SOURCE 
     WHERE name='FORCURSOR_TEST';