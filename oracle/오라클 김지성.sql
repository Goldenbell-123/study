16/12/01============================================================


����Ŭ �����

1.www.oracle.com

2.buie4532@naver.com
  Kim05******

3.oracle database 11g expresions �ٿ�

4.�¾��� ����.(�ȵǸ� �����) ��� �˱⽱�� 1111

5.Application express Ŭ��

6.sys�� �α��� ����� �����ߴ���. 1111

7.���̵� ���� dev ��� 1111


si�� ���ο�� ã�°�
-----------------------------------------------------------------

1�� ����

- HomeSQL > Workshop > Object Browser > tables > EMP

(������ ���̽� ���ϴ»���� ���� ���̺� �ִ� �ֵ��� �����ͼ� ����.)


- HomeSQL > Workshop > SQL Commands > desc emp > Run Ŭ��
 (���� ����)


- Ŀ�ǵ� �Է� ���(SQL plus)

 ���� > SQL Command line > connect > dev > 1111(�Ⱥ���) > desc emp; 
 (���� ����)

-----------------------------------------------------------------
2�� SELECT ��Ʈ

���� ������ �۾��� Insert , Delete , Update , Select 4���� �۾��� �Ѵ�.
�� �۾����� Crud ��� �Ѵ�.

EMP�� DEPT �ֵ��� ���� ����Ǿ��ִ�.  �����Ҳ��� ������� ������Ʈ�� �����ϴ°� ����

DEPTNO �� ���ִ� ���ڵ�� ������ �ɸ� �� ���ڷ� ���Ǿ߾�ߵ�
Ex(10/20/30/40)

----------���� ��� ����� �ʹ�.----------
�����ϰ� ����

-----------summery--------

SELECT �÷���
FROM   ���̺��
WHERE  ���ǽĸ�(������)
       (<=>)
       (and,BETWEEN,OR,IN)
ORDER BY (DESC,ASC)
--------------------------


-EMP > insert
Insert INTO ���̺�� (�÷���,...)
            Values(��1,...)

-----HR ����------

������ ��ȸ Select ��

1)�⺻ ����: select �÷��� From  ���̺� ��

2)��ü �÷� ��ȸ: Select *(*�� ���� �ҷ��´�) from employees

3)Ư�� �÷� ��ȸ: Select �÷�1,�÷�2,... From employees

4)�÷��� ���� ���: SELECT �÷��� AS ����
                  FROM ���̺��

5)�÷��� ���� ���2: SELECT �÷��� AS "�� ��"
                  FROM ���̺��

-----------------------------


6)�÷��� ���� ���3: 
                    Select �÷��� "����"
                    From ���̺��

7)�ߺ� ���� �����ϰ� ���: 

select DISTINCT(department_id) From employees


8)�����Ͽ� ����ϱ�: SELECT department_id FROM employees ORDER BY department_id DESC

	SELECT �÷���
	FROM ���̺��
	ORDER BY �÷��� ASC(��������) �Ǵ� DESC(��������)

9)������ȸ

	SELECT �÷���
	FROM ���̺��
	WHERE Salary >= ���ǹ� 
	'��¥'(mm/dd/yyyy) �� '����' (���� ������ ������ ��ҹ��� �����ϴ� ����)
                  Ư�� ���ڿ� ���� ��: LIKE '%���ǹ�%'
	    1) %(���ϵ�ī��): ������ �𸦶�
	    2)  _: ������ ������ �˶�
---------------------------------------------------------------------------------
�������� �з�

	1.���������
	  -���, ���� ��ȣǥ�� : +,-
	  -��Ģ����: +, - ,* ,/

	2. ���տ�����
	  -�ΰ��� ���ڿ��� ����:||

	3.���� ������
	  -������: UNION
	  -�����տ� ���� ������: Union all
	  -������: Intersect
	  -������: Minus

 	4. ��� �� ������: >,<,>=,<=

	5. �� ������
	   ����: NOT
	   ���� ����: AND
	   �κ� ����: OR

	6. SQR �� ������
	  Ư�� ���ڿ� ���� ��: LIKE 
				%(���ϵ�ī��): ������ �𸦶�
				_: ������ ������ �˶�
	  List ��: IN

�������� �켱 ���� : ��� �񱳿�����  > AND > OR
		     ���� ������ ��� �¿��� ��� ���� ��ȣ�� �׻� �켱
---------------------------------------------------------------------------------

	����1. Job_id�� 'it_prog'�� ������� first_name, salary, �μ���ȣ ���
	(�̸��� ������������ ����)

SELECT job_id, first_name, salary, department_id "�μ���ȣ"
FROM employees
WHERE job_id = 'IT_PROG' 
Order by first_name

	����2. 2005�� ���Ŀ� �Ի��� �������
	       first_name, salary, �μ���ȣ ���
	       (�Ի����� �������� ����)	*01/01/2005

SELECT hire_date, first_name, salary, department_id "�μ���ȣ"
FROM employees
WHERE hire_date >= '01/01/2005'
Order by hire_date;

	����3. employee_id�� first_name�� �������� �����ϰ� 
		'�������'��� �������� ���

SELECT employee_id || ' ' || first_name "�������"
FROM employees


	����4. 2005�⵵�� �Ի��� �������
	[LIKE]	first_name, salary, �Ի���, �μ���ȣ ���
	[WHERE]	(�Ի����� �������� ����) 
		
SELECT hire_date "�Ի���", first_name, salary, department_id "�μ���ȣ"
FROM employees
WHERE  hire_date >= '01/01/2005' 
AND hire_date < '01/01/2006'
Order by hire_date;
	
	����5. salary�� 10000���� 20000������
		first_name, job_id,salary �˻�
		(salary�� ����) AND ������, BETWEEN������
	
SELECT job_id, first_name, salary
FROM employees
WHERE salary >= 10000 
AND salary <= 20000
Order by salary;
		(�̰͵� �� WHERE salary BETWEEN 10000 AND 20000)

	����6. department_id�� 30, 60, 90�� ������� 
		department_id, first_name ��� (OR ������, IN ������)

SELECT     department_id, first_name
FROM       employees
WHERE      department_id = 30 
OR         department_id = 60
OR         department_id = 90;
		(�̰͵� �� WHERE department_id IN(30,60,90)
		
	����7. last_name�� K�� �����ϴ� �������
		last_name, first_name, salary ���

SELECT     last_name, first_name, salary
FROM       employees
WHERE      last_name LIKE 'K%'

	����8. last_name�� K�� �����ϰ� , g�� ������ 4������ �������
		last_name, first_name, salary ���

SELECT     last_name, first_name, salary
FROM       employees
WHERE      last_name LIKE 'K__g'

	����9. phone_number�� ��� ��ȣ�� 500����� �����ϴ� �������
		first_name, phone_number ���

SELECT first_name, phone_number
FROM employees
WHERE phone_number LIKE '%.5%.%';

	����10. phone_number�� ��� ��ȣ�� 500������ �ƴ� �������
		first_name, phone_number ���


--------------------------------16/12/02---------------------------------------


	IS NULL
	IS NOT NULL	: NULL �� ��ȸ

	����1. salary�� commission_pct�� ���ؼ�	
		���ʽ��� ����Ͽ�
		first_name, job_id, salary, ���ʽ� ��� 
		(��, commission_pct�� �ִ� �ڷ�鸸 ���)			

SELECT   First_name, job_id, salary ,salary * commission_PCT as ���ʽ�
From     employees
WHERE    Commission_pct IS NOT NULL


	����2. CEO�� employee_id,last_name, manager_id, salary ���


SELECT   employee_id,last_name, manager_id, salary
From     employees
WHERE    manager_id IS NULL



	����3. department_id�� 100�̳� 50�� ���ϴ�
		����� �߿��� salary�� 5000 �̻��� �ڷ�
		last_name, salary, job_id, department_id ���
		��, department_idf�� ������������ �����ϰ�, 
		���� department_id�� ��� Salary�� ������������ ����

SELECT   last_name, salary, job_id, department_id
From     employees
WHERE    (department_id = 50 OR department_id = 100)
AND      Salary >= 5000
ORDER BY department_id, Salary DESC

	����4. salary�� 10000�̻���
		department_id�� 80,90�� �������
		first_name, salary, department_id ���

SELECT   first_name, salary, department_id
From     employees
WHERE    Salary >= 10000
And      department_id = 80

UNION al
SELECT   first_name, salary, department_id
From     employees
WHERE    Salary >= 10000
And      department_id = 90


	����5. department_id�� 70 �̻��� �ڷ��
		70�̸��� �ڷ��� salary�� ���� �ڷ� ���

SELECT   salary
From     employees
WHERE    department_id >= 70

intersect

SELECT   salary
From     employees
WHERE    department_id < 70


	����6. department_id�� 100���� �ڷ��� salary�� 
		������ ��� salary ���


SELECT   salary
From     employees

Minus

SELECT   salary
From     employees
WHERE    department_id =100

-------------------------------------------------------------------------------
3.������ �Լ�

1. ��� ���ڸ� �빮�ڷ� ��ȯ: UPPER

2. ��� ���ڸ� �ҹ��ڷ� ��ȯ: LOWER

3. ���ڸ� �ܾ�� ù���ڴ� �빮��
   �������� �ҹ��ڷ� ��ȯ : INITCAP

4. ���ڿ� ����: CONCAT

5. ���ڿ��� Ư���κ� ����:  SUBSTR (�÷���, ���ۼ���, �������)

6. ���ڿ��� ���� ���: LENGTH(�÷���)

7. Ư�� ���ڿ��� ���� ��ġ�� ���� : INSTR(�÷���,ã�¹���,����,��°)

8. ���� ���� �ڸ� ä�� : LPAD

9. ������ ���� �ڸ� ä�� : RPAD

10. ���� ���� ���� :  LTRIM

11. ������ ���� ���� : RTRIM

12. ����, ������ ���� ���������� ���� : TRIM

------------

����1. UPPER Ȱ��
                  last_name�� ��� �빮�ڷ� ��ȯ
	job_id�� ��� �ҹ��ڷ� ��ȯ,
	email�� ù���ڸ� �빮�ڷ� ��ȯ

SELECT   UPPER(last_name), LOWER(job_id), INITCAP(email)
From     employees


����2.  CONCAT Ȱ��
	last_name, salary�� ���
           ����� ������ ' ~~~�� ����: ~~~~��'���� ���

SELECT     last_name , salary,
CONCAT  (CONCAT (last_name, '�� ���� : '),CONCAT (salary*12, '�޷�')) "����� ����"
From         employees


����3.  SUbSTR Ȱ��1
	hire_date�� 12���� �������
	last_name, hire_date ���

SELECT    last_name, hire_date
From       employees
WHERE   SUBSTR(hire_date,1,2) = 12

����4.  SUbSTR Ȱ��2
	hire_date�� 2005�� �������
	last_name, hire_date ���

SELECT  last_name, hire_date
From    employees
WHERE   SUBSTR(hire_date,7) = 2005


����4-1 INSTR�� Ȱ��
	hire_date�� 2005�� �������
	last_name, hire_date ���


���� 5. http://127.0.0.1:8080/index.jsp���� 
           ip�� ����

SELECT  SUBSTR('http://127.0.0.1:8080/index.jsp',
        INSTR('http://127.0.0.1:8080/index.jsp','/',1,2)+1,
        INSTR('http://127.0.0.1:8080/index.jsp','/',1,3)-INSTR('http://127.0.0.1:8080/index.jsp','/',1,2)-1)
From    dual

����6. salary�� 10000 ������ �������
           salary�� 7�ڸ��� ���
          (��, ������ �ڸ����� *ǥ��)

SELECT  first_name,salary,
        LPAD(salary,7,'*'),
        RPAD(salary,7,'*')
From    employees
WHERE salary <= 10000


����7. employee_id �� ���ʿ� 1�� ����, �������� 1�� ����

SELECT  employee_id ,
        LTRIM(employee_id,1),
        RTRIM(employee_id,1)
From    employees

����8. job_id �÷��� IT_PROG�� ��� IT_ENGINEER�� �ٲ�

SELECT  job_id,
        Replace(job_id,'IT_PROG','IT_ENGINEER')
From    employees
WHERE job_id = 'IT_PROG'

����8-1 last_name �� At***son���� ǥ��
replace ���
---------------------------------------------------------------------

���ڰ��� �Լ�
1.�ݿø� : ROUND
2.����: TRUNC
3.CEIL  ���ڸ� �ø��ϰ� �Ҽ��� ����
4.FLOOR ���ڸ� �����ϰ� �Ҽ��� ����
5.MOD ������ ���ϴ� �Լ�

����1.   Salary�� ���ʽ��� 0.33333�� ���Ͽ� �ݿø�

SELECT first_name, salary,
       salary*0.333333,
       Round(salary*0.33333,-1),
       Round(salary*0.33333,2),
       Round(salary*0.33333,1),
       Round(salary*0.33333)
From    employees

����2. Salary�� ���ʽ��� 0.33333�� ���Ͽ� �ݿø�
         (��, 1000���� 9999���� ��Ÿ����)


SELECT first_name, salary,RPAD(round(salary*0.33333,2),7,'0')
      
From    employees
WHERE ROUND(salary*0.33333,2) BETWEEN 1000 AND 9999



����3.
SELECT first_name, salary,
       salary*0.333333 Bonus,
      salary/3 DIV,
      MOD(salary,3)MOD,
      ceil(salary*0.33333)ceil,
      Floor(salary*0.33333)Floor

From    employees

4
����3-1. last_name�� �������� ������� ǥ��

SELECT first_name, salary, concat(Trunc((sysdate-hire_date)/365),' ����') AS "�ټ� ���"
      
From    employees



-----------------------------

 ��¥ ���� �Լ�

1. Months_BETWEEN Ư�� �γ�¥������ ������
2.ADD_MONTHS  ������ ��¥�� ��� ���� ��¥
3.NEXT_DAY Ư�� ��¥���� ���� ���Ϥ�
4. LAST_Day  ������ ���� ������ ��¥


����1. last_name�� �������� �ٹ� ���� �� ǥ��
��.1-1
SELECT sysdate, Hire_date,
       trunc(MONTHS_between(sysdate, Hire_date)) Months1,
       Trunc((sysdate-HIre_date)/30) Months2,
       Trunc((sysdate-HIre_date)/31) Months2,
       Trunc((sysdate-HIre_date)/365*12) Months2
From employees

����2. hire_date�� �Ի� �� 6���� �Ǵ� ��¥ ���

SELECT hire_date,
       ADD_MONTHs(hire_date,6)
From employees

����3. �̹� �� ������� ��¥ ���

SELECT SYSDATE, NEXT_DAY(sysdate,'saturday')
From employees

 ����4.�̹����� ������ ��¥

SELECT SYSDATE, LAST_Day (sysdate)
From employees

����5. �ټ� ���� ���� 120���� �̻��� �������
          last_Name, job_id, �ټ� ������ ǥ��

SELECT last_name,job_id,
 trunc(MONTHs_BETWEEN(sysdate,Hire_date)) "�ټ� ������"
From employees
WHERE trunc(MONTHs_BETWEEN(sysdate,Hire_date)) >= 120

---------------------------------
�� ��ȯ ���� �Լ�
1. To_char         ����/��¥�� ���ڷ� �ٲٴ°�
	19981231  => 19,981,231
	12/31/1998  => 1998�� 12�� 31��

	���ڸ� ���ڷ� ��ȯ �ÿ� ���Ǵ� ���� ���
	9      : �Ϲ����� ���� ǥ��
	0      : ���� ���ڸ��� 0���� ä��
	$      : dollar�� ǥ��
	L      : ���� ��ȭ ����
	.       : �Ҽ��� ǥ��
	,       : õ ���� ǥ��

       ��¥�� ���ڷ� ��ȯ �ÿ� ���Ǵ� ���� ���
       YYYY: 4�ڸ� ���� ǥ��
       MM: 2�ڸ� ���� ǥ��
       DD: 2�ڸ� �Ϸ� ǥ��
       HH, HH24  : 1~12, 0~23 �ð� ǥ��
       MI   :  �� ǥ��
       SS   :  �� ǥ��

2. To_number   ���ڸ� ���ڷ� �ٲٴ� ��


3. To_date         ���ڸ� ��¥�� �ٲٴ� ��


����1. Salary�� �� �ڸ����� �޸��� �����Ͽ� ǥ��

SELECT last_name, salary,
       To_char(salary*12*10,'999,999,999.99$') "10��ġ ����",
       To_char(salary*12*10,'000,000,000.00$') "10��ġ ����"
FROM employees

���� 2. hire_date�� ��/��/���� ���·� ���
           ex) 2003/12/31

SELECT last_name,hire_date,
       To_char(hire_date,'yyyy/mm/dd')
FROM employees

����3. '20161231'�� ���ڷ� ��ȯ�Ͽ� ���

SELECT TO_number('20161202','YYYY/mm/dd')
From dual

����4. '20161231'�� ��¥�� ��ȯ�Ͽ�  2016/31/31�� ���·� ���

SELECT TO_DATE('20161202','YYYY/mm/dd')
From dual


16/12/05=======================================================================================

�پ��� �Ϲ� �Լ���

1.NULL ���� Ư�� ������ ��ȯ: 

NVL(�÷���,'����')
���� ������(null)�� ���� or �÷� ���� ���

NVL2(�÷���,'���ڳ� ����a1', '���ڳ� ����b2')
������(not null)�� ����� ��Ÿ�� ���� a1 or �÷�
���� ������(null)��  ����� ��Ÿ�� ���� b2 or �÷�
���� ��� ��

NULLIF(�÷�1,�÷�2)
�÷�1 �� �÷�2�� ���Ͽ� ���� ���� �ٸ���  [�÷�1]�� ��Ÿ�� 
                            ���� ���� ��  [null]���� ��Ÿ��
 (IF,ELSE�� ����)


2.DECODE  : equal ��, ���ǹ��� ���� ����


3.case         : Range ��,���ǹ��� �����


 

����1. commission_pct�� ���� ����� ��� 3%�� �����Ͽ�
           last_name, salary, bonus�� ���

����2. commission_pct�� ���� ����� ��� 3%,
            ������ �־��� ��쿡�� 5%�� �����Ͽ�
            Last_name, salary, bonus�� ���

SELECT last_name, salary,
       salary*NVL2(commission_pct,0.05,0.03) BOUNUS
FROM employees


����3. first_name�� last_name�� ���ڿ� ���̸� ���
            �� ���ڿ��� ���̸� ���Ͽ�
            ���������� first_name�� ���, ������ NULL�� ó��

SELECT first_name,last_name, length(first_name),length(last_name), 
NULLIF(length(first_name),length(last_name))
FROM employees




����4. department_id�� 10�̸� 'team1',
             20�̸� 'team2', 30�̸�  'team3',
            ��������  'team0'�� ó��

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

����5. departmen_id�� 10~50�̸� 'teamA',
            60~100�̸� 'teamB', 110~150�̸� 'teamC',
           �������� 'teamX'�� ó��

����6. salary�� 10000�̸��̸� 50%, 
                           20000 �̸��̸� 30%,
                           20000 �̻��̸� 10%�� ���ʽ���
            ����Ͽ� last_name, salary, bounus ���

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

�׷� �Լ�: ���� ���� �����͸� �Ѳ����� ó��

1. COUNT (�÷���) :
	���� ����� ī���� ��

2. AVG       :
	���
3. SUM      :
	�հ�
4. MIN       :
  	�ּҰ�
5. MAX      :
	�ִ밪




����1. job_id�� 'IT'�� ���Ե� �������� �� ���.

SELECT  Count(job_id)
From    employees
WHERE job_id Like '%IT%'



����2. job_id�� 'IT'�� ���Ե� ������ �߿��� 
           commission_pct�� �ִ� �������� �� ���

SELECT  Count(commission_pct)
From    employees
WHERE job_id Like '%IT%'



����3. job_id�� 'IT'�� ���Ե� ��������
           �޿� ��հ� �հ� ���

SELECT  AVG(salary) ���, SUM(salary) �հ�
From    employees
WHERE job_id Like '%IT%'
 
   3-1.) �� , ��� ����,NULL ���� �ִ� ��� 0���� �����Ͽ� ����

SELECT AVG(NVL(salary,0)) ���, SUM(salary) �հ�
From    employees
WHERE job_id Like '%IT%'



����4. ���� ū salary�� ���� ���� salary ���

SELECT MAX(salary) �ִ밪, MIN(salary) �ּҰ�,
       MAX(hire_date), MIN(hire_date)
From    employees
WHERE job_id Like '%IT%'

---------------------------------------------------------------------
�׷� �Լ��� Ư�� ���� ����

1. GROUP BY : count, avg, sum ���� ���Ե� select�� �ϰ������
                         count, avg, sum�� �ƴ� �÷����� ���� ���� �׷�ȭ�Ͽ� ��Ÿ����.
2. HAVING  : �׷��Լ��� ����  count, avg, sum � ������ �ɶ�  HAVING�� ��

����1. �� department_id ���� ��� �޿� ���, department_id ���� job_id�� ���� ���

SELECT department_id, avg(salary)
From    employees
GROUP BY department_id
ORDER BY department_id


����2. salary�� �հ谡 20000 �̻��� �μ���
           department_id, �ο��� , salary �հ� ���

SELECT department_id, COUNT(*), sum(salary)
From    employees
Having sum(salary) >= 20000
GROUP BY department_id
ORDER BY department_id


����3. salary�� ����� 10000 �̻��� 
            departmen_id, ��� salary ���

SELECT department_id, COUNT(*), avg(salary)
From    employees
Having avg(salary) >= 10000
GROUP BY department_id
ORDER BY department_id


����4.  �� department_id ���� job_id�� 2���̻��� �����͵��� 
             department_id, job_id, �ο��� ���

SELECT department_id, COUNT(*) �ο���, job_id
From    employees
Having  count(job_id) >= 2
GROUP BY department_id,job_id
ORDER BY department_id


����5. �� department _id ���� job_id�� 'IT_PROG'��
           ������� ��� �޿����
            ��, department_id, ��� �޿��� ���

SELECT department_id, AVG(salary)
From    employees
WHERE  job_id Like 'IT_PROG'
GROUP BY department_id,job_id
ORDER BY department_id



���� 6. �� department _id�� 60 �̻��� ���ڵ���
              department_id, job_id, �ο���, salary�� �հ� ���
             
SELECT department_id, COUNT(*),job_id, SUM(salary) "�޿� �հ�"
From    employees
where  department_id >= 60
GROUP BY department_id, job_id
ORDER BY department_id


-----------------------------------------------------------------------------

������ ���� �Լ���
\\GROUP BY ���� ��ߵ�
1. ROLLUP    :
	������ �κ��հ� ���� ���κ� ����  �հ谡 ����
2. CUBE         :
	ROLLUP�� �����ϰ� �Ѱ踸 ���� �ؿ� ���ĵǾ� ����

3.GROUPING SETS:
	 �� �÷����� �׷�ȭ(�ο���)�Ͽ� �����.
4.LISTAGG 
                ��



����1. �� department _id�� 60 �̻��� ���ڵ���
              department_id, job_id, �ο���, salary�� �հ� ���
	��, �� �����͵��� �Ұ赵 ���

SELECT department_id, job_id, COUNT(*), SUM(salary) "�޿� �հ�"
From    employees
where  department_id >= 60
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id


����2. �� department _id�� 60 �̻��� ���ڵ���
              department_id, job_id, �ο���, salary�� �հ� ���
	��, �� �����͵��� �Ұ� �� ��ü �Ѱ� ���

SELECT department_id, job_id, COUNT(*), SUM(salary) "�޿� �հ�"
From    employees
where  department_id >= 60
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id

����3.  ��department _id�� 100 �̻��� ���ڵ���
              department_id,manager_id, manager_id �� �ο��� ���

SELECT department_id, manager_id, COUNT(*) �ο���
From    employees
where  department_id >= 100
GROUP BY GROUPING SETS(department_id, manager_id)
ORDER BY department_id

======================================================


3��. DDL ; Data Definition Language
        ������ ���� ���

CREATE, DROP, ALTER, TRUNCATE, RENAME, COMMENT

1.CRATE TABLE: ���ο� ���̺� ����

2.DROP TABLE: �⺻ ���̺��� ���� �� ��� �� ����

3.ALTER TABLE: �⺻ ���̺� ����
	          �÷��� �߰�, ����, ����
	          ���� ������ �߰�, ����, Ȱ��ȭ/��Ȱ��ȭ

4.TRUNCATE  : ���� ���̺��� ������ ����� ��� �� ����

5.RENAME     : ���̺� �̸� ����

6. COMMENT  : ���̺��̳� �÷��� �ּ��� �ޱ�



��� ��Ģ
 * ��ü�� �ǹ��� �� �ִ� ������ �̸� ���
 * ���̺��� �÷����� �ݵ�� ���ڷ� ����
    (�ִ� 30�ڱ��� ���)
    A~Z, a~z, 0~9, _, $, #�� ��� ����
    ���ϸ� �ߺ� �Ұ�
    ����Ŭ�� ����� ��� �Ұ�

  ex)���̺� �� 
        10_DEPT   ���ڷ� �����ϸ� x
        S-SALES   - �� ���� x
        ORDER     ����Ŭ ���Ǿ� x




���̺� ����

CREATE TABLE [��Ű��.]���̺��(
	�÷���1 ������Ÿ��[�⺻����],
	�÷���2 ������Ÿ��[�⺻����],
	...
)


   ��Ű��          :  ��ü�� �������� ���̺��� ������ �ǹ�
   ������ Ÿ�� :  �÷��� ���� �������� ������ ũ��
   �⺻ ����     :  ������ �Է�(INSERT) �ÿ� ���� �⺻ ��
   	          Ư�� ���� �Է����� �ʾ��� ���
	          NULL �� ��ſ� �⺻ ���� �ڵ� �Է� ��
��.����!! ���̺�� ū �ֵ���ǥ�� �ٿ����� 
�÷��� �߰��Ҷ�, ����, ����, ��ȸ �� ��� ���̺� "���̺��" ���� ��ߵ� ����          

������ Ÿ��--------------------------------------------------
CHAR(size)                :   ���� ���� ���� ������
		    �Էµ� �ڷ��� ���̿� ��� ����
		    ������ ���̸�ŭ ���� ���� ����
		    �ּ� ũ��� 1

VARCHAR(size)      :   ���� ���� ���� ������
		    ���� �Էµ� ���ڿ��� ���̸�ŭ
		    ���� ���� ����
   		    �ּ� ũ��� 1 �ִ� 4000ByteS

NUMBER                   :    �ְ� 40�ڸ����� ���� ����
		    �Ҽ����̳� ��ȣ�� ���̿� ���� X

NUMBER(W)             :   �ִ� 38�ڸ����� ���� ����

NUMBER(w, d)          :    d�� �Ҽ��� ���� �ڸ� ��

DATE                          :    ��¥



����1. T_MEMO ��� �޸� ���̺� ����
            �޸��ȣ          : ���� 9�ڸ�                     : memo_no
            ����� ���̵� : �������ڿ� 8�ڸ�         : user_id
            �޸�  ����        : �������ڿ� 40��           : title
            �޸�  ����        : ���� ���ڿ� 1000�ڸ�  : memo
            �̸�Ƽ��          : ���� ���ڿ� 20��          : emoticon
            ��������          : ��¥                                 : reg_date
            
CREATE TABLE "T_MEMO"(
        memo_no   NUMBER(9),
        user_id      VARCHAR(8),
        title           VARCHAR(40),
        memo        VARCHAR(1000),
        emoticon  VARCHAR(20),
        reg_date  DATE DEFAULT SYSDATE
)

-------------------------------------------------------
���̺� �����ϱ�(CTAS)

1. ��� �÷��� ����
 CREATE TABLE ���̺��
as 
SELECT * FROM ���� ���̺��
DEFAULT ���� ���簡 �ȵǹǷ� �ٽ� �־���ߵ�

2. Ư�� �÷��� ����
CREATE TABLE ���̺��
as 
SELECT  �÷�1, �÷�2, �÷�3,.....
FROM ���� ���̺��

3.������ ������ �����ؼ� ���̺� ����
CREATE TABLE ���̺��
as 
SELECT *
FROM ���� ���̺��
WHERE 1 = 0 (���������κҰ����� ������ ���ָ� ���̺� ����)

4. ���� �÷� ���̺� ����
CREATE TABLE t_virtual(
    no1 NUMBER,
    no2 NUMBER,
    no3 NUMBER GENERATED 
               ALWAYS AS  (no1 + no2) VIRTUAL
)

5.���̺��� �����Ҷ�
ALTER TABLE t_virtual
ADD   (no4 GENERATED ALWAYS AS((no1*12) + no2))



����1.  employees ���̺��� ��� Į���� �����͸� �����Ͽ� emp���̺� ����

CREATE TABLE emp2
as
SELECT *
FROM employees


����2. employees  ���̺��� employee_id, first_name, department_id, job_id Į����
           �����͵鸸 �����Ͽ� emp2 ���̺� ����

CREATE TABLE emp2
as
SELECT employee_id, first_name, department_id, job_id 
FROM employees



����3. employees  ���̺��� ������ �����Ͽ� emp3 ���̺� ����


---------------------------------------------------------------------------

ALTER ���

1. ���̺� ���ο� �÷� �߰��ϱ�
   ALTER TABLE ���̺��
  ADD(�÷��� ������ Ÿ��(�ڸ���) DEFAULT(�÷��� �⺻�� ����))

2.���̺��� �÷� �̸� �����ϱ�****************
  ALTER TABEL ���̺��
  RENAME COLUMN �����÷��� TO ���� �÷���

3.���̺� �̸� �����ϱ�
 RENAME  �����÷��� TO ���� �÷���

4. �÷��� ������ Ÿ��/ũ�� ����
 ALTER TABEL ���̺��
 ALTER TABEL ���̺��
 MODIFY(�÷��� ũ��)

5.�÷� ����
  ALTER TABEL ���̺��
 DROP COLUMN �÷���

5.1 ����Ű�� ������ �÷� ����
  ALTER TABLE ���̺��
 DROP COLUMN �÷��� CASCADE CONSTRAINTS


6. ���̺��� �б� �������� ����
ALTER TABLE ���̺��
READ ONLY / READ WRITE(�а���)




����1. t_virtual ���̺� �������ڿ��� 10�ڸ��� ���� no6 �÷� �߰�
            ��, �⺻���� '6th' ���� ����

ALTER TABLE t_virtual
ADD   (no6 char(10) default '6th')



����2. t_virtual ���̺� no6 �÷����� no 6th�� ����
ALTER TABLE t_virtual
RENAME COLUMN no6 TO no6th



����3.  t_virtual ���̺��� �̸��� t_nums�� ����

RENAME t_virtual To  t_nums


����4. t_nums ���̺��� no5 �÷��� ũ�⸦ 5�� �����ϰ�
            �÷� Ÿ���� �������ڿ��� ����
ALTER TABLE t_virtual
MODIFY(NO5 Varchar(5))


����5. t_nums ���̺��� no7 �÷��� ����
ALTER TABLE t_nums
DROP COLUMN NO7

����6. t_nums ���̺��� ��� �÷��� �����͸�
           t_virtual ���̺��� �����Ͽ� ����


���� 7. ���ڸ� �����ϴ� num �÷��� ���� t_read ���̺� �����ϰ�,
             num �÷��� 100�� ������ ��,
             ���̺��� �б� �������� ������ ����,
             num �÷��� 200�� �����ϰ� ǥ�õǴ� �޽��� Ȯ��

---------------------------------------------------------------------------

DROP ���

DROP TABLE ���̺��
���̺� ����
            
����1.  t_read���̺��� ����

DROP TABLE t_read

--------------------------------------------------------------------------

TRUNCATE  ���

TRUNCATE TABLE ���̺��
���̺��� �����Ϳ� �ε��� �����ϰ� ������ ����


����1. T_VIRTUAL ���̺��� ��絥���� ����
TRUNCATE TABLE t_virtual

------------------
����. t_memo ���̺��� reg _date�� ������ Ÿ����
          time stamp 


����2. ���̺� �����


16/12/07==================================================

 DML; Data Manipulation Language
������ ���̼��� �Էµ� �����͸� ��ȸ�ϰų� 
�߰�, ���� , ����
INSERT, DELETE, UPDATE, SELECT


1.INSERT(������ �߰�)

INSERT  INTO  ���̺��[(�÷���1, �÷���2, ...)]
VALUES(������1, ������2,....)

INSERT all (���� ������ �Է�)
INTO ���̺�� VALUES(������1, ������2,....)
INTO ���̺�� VALUES(������1, ������2,....)
SELECT   �÷���1,�÷���2,.......
FROM    DUAL;



���� �ٿ��ֱ�
���� ������ ���� ���̺��� �����͸� �Ѳ����� �����Ͽ� �߰�
INSERT
INTO  ���̺��
SELECT   �÷���
FROM    �������̺��
WHERE ���ǽ�



2. UPDATE
UPDATE    ���̺��
SET            �÷���1 = ������ ��1
                  �÷���2 = ������ ��2
                  .........
WHERE     ���ǽ�

3.DELETE
������
DELTE FROM EMP4
WHERE           ���ǽ�

4.MERGE
������ ���� �� ���� ���̺��� �ϳ��� ���̺�� ����
�����ϴ� ���̺� ������ �����ϴ� ���� �ִٸ�
���ο� ������ ����(UPDATE)�ǰ�,
�������� ������ ���ο� ������ �߰�(INSERT)

MERGE INTO  �������̺� ��     �������̺���
USING       �������̺�� 1   �������̺�1 ����
ON          (���ǽ�) --��ȣ ������ �ľߵ� ���ǽ��� �Ѱ����� �������
WHEN MATCHED THEN      ������ ��ġ�� ����� ó��
WHEN NOT MATCHED THEN  ������ ����ġ�� ����� ó��


�������� ����






����1. employees ���̺��� ������ �����Ͽ� 
            firtst_name, department_id, salary, hire_date	
            emp4 ���̺� ����

CREATE TABLE emp4
as
select first_name, department_id, salary, hire_date
from employees 


����2. emp4 ���̺� first_name�� 'MIN', �μ���ȣ�� 30
            �޿��� 10000, �Ի����ڴ� 2016�� 6�� 6���� ���ڵ� �߰�
INSERT INTO emp4
VALUES('MIN',30,10000,'06/06/2016')


����3. emp4 ���̺� firtst_name�� 'Yun', �μ���ȣ�� 20,
            �Ի����ڴ� 2016�� 10�� 10���� �ڵ� �߰�
INSERT INTO emp4(first_name, department_id, hire_date)
VALUES('Yun',20,'10/10/2016')


����4. empolyees ���̺��� department_id�� 100 �̻���
           �����͵鸸 �����Ͽ� emp4 ���̺� �߰� (�������� ���·� �μ�Ʈ�Ѵ�.)
INSERT INTO EMP4
FROM   employees
SELECT first_name, department_id, salary, hire_date
WHERE  DEPARTMENT_ID >= 100


����5. emp4 ���̺��� first_name�� Yun�� ����� 
            salary 10000�̻��� ������Ʈ
UPDATE emp4
SET    salary=1000
WHERE  first_name = 'Yun'


����6. emp4 ���̺��� department_id�� 30�� �����
           department_id�� 10���� salary�� 1000���� ����
UPDATE emp4
SET    department_id=10,
       salary      =1000
WHERE  department_id=30


����7. emp4 ���̺� employee_id �÷��� �߰��ϰ� 
            ��� employee_id�� 99�� ����
ALTER TABLE  emp4
ADD(employee_id number(2))

update emp4
set employee_id=99

����8. EMP4 ���̺� DEPARTMENT_ID�� 100�� �������
           ���ڵ带 ��� ����

DELETE EMP4
WHERE DEPARTMENT_ID =100

����9. EMP4 ���̺��� DEPARTMENT_ID�� 10�̰ų� 20��
          ���ڵ带 ��� ����


DELETE EMP4
WHERE DEPARTMENT_ID =20
OR DEPARTMENT_ID = 10

���� 10. t_datas ���̺� t_data01 �� t_data02�� ����(merge)�Ͻÿ�.

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


���� 11. employees ���̺��� ������ ��
               employee_id�� 100, 110�� ���ڵ����
               emplotee_id, last_name, job_id,
               salary, hire_date�� �����Ͽ� temp01 ���̺� ����

CREATE TABLE temp01
as
select employee_id, last_name, job_id,salary, hire_date
from employees
WHERE employee_id in(100,110)


���� 12. employees ���̺��� ������ ��
                job_id�� 'IT_PROG'�� ���ڵ����
               employee_id, last_name, job_id,
               salary, hire_date�� �����Ͽ� temp02���̺� ����

CREATE TABLE temp02
as
select employee_id, last_name, job_id,salary, hire_date
from employees
WHERE job_id like 'IT_PROG'


����13. temp02 ���̺��� job_id�� ��� TEST�� ����

UPDATE temp02
SET JOB_ID = 'TEST'
WHERE job_id IS NOT NULL


����14. temp02 ���̺� 123, Han, JOB_ID, 20000, ���ó�¥ ����
              ���� ���ڵ� �߰�
INSERT INTO temp02(employee_id, last_name, job_id,salary, hire_date)
VALUES('123','HAN','JOB_ID',20000, SYSDATE) 

 
����15. temp01�� temp02 ���̺��� ����
              ���� ������ employee_id�� ��ġ ����
              ��ġ�Ѵٸ� ���� ������ ������Ʈ
              ��ġ���� ������ �ű� ������ �߰�

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


���� 16. emp4 ���̺��� Min�� department_id�� 
               Shelley�� department_id�� ����. ������ ���� ��� �߰�

update emp4
set department_id=
(select department_id
from employees
WHERE first_name like 'Shelley')
WHERE first_name like 'MIN'


����17. emp4 ���̺��� ������ �߿��� departments ���̺��� 
department_name�� Accounting�� ���ڵ� �� ���� �����͸� ��� ����

delete emp4
WHERE department_id =
(select department_id
FROM departments
WHERE department_name ='Accounting')

============================================


TCL ; Transaction Contrl Language
Ʈ����� ���� ���
DML �۾��� �ݵ�� �ǽ��ؾ� �����ͺ��̽��� �ݿ� ��

1.COMMIT
2.ROLLBACK


DCL; Data Control Language
������ ���� ��� - ���� �ο� �� ���
1.GRANT
2.REVOKE


==============================================
���� ����

1. PRIMARY KEY(�⺻Ű)
    NOT NULL�� UNIQUE�� ������ ����
    �ߺ����� �ʴ� ������ ����
   (�ٸ� ���ڵ��� ����)
[���̵�, �ΰ� ���� ����]

2. FOREIGN KEY(�ܷ�Ű, ����Ű)
    �����Ǵ� ���̺��� �÷��� ���� �����ϸ� ���

3. UNIQUE
   �ߺ��� ���� ��� X
   �׻� ������ ���� ������ ����

4. CHECK
    ���� ������ ������ ���� ������ ������ �����Ͽ�
    ������ ���� ���

5. NOT NULL
    NULL�� ��� X




����1. ȸ�� ���̺� T_MEMBER ����
         
        �׸�                       ������ Ÿ��(�ڸ���)    ��������
        -----------------------------------------------------
        ���̵�                  VARCHAR2   8                PRIMARY KEY 
        ��й�ȣ             VARCHAR2   10               NOT NULL
        �̸���                 VARCHAR2   30               UNIQUE  
        ����                     CHAR             1                 CHECK
        ��ȭ��ȣ             VARCHAR2  13                 
        �̸�                    VARCHAR2   10                 
        �������            DATE                                  




2016/12/08===================================================

5. JOIN
�ΰ��̻��� �����͸� �̿��ؼ� �ʿ��� �����͸� �����´�.
�ΰ� �̻��� ���̺��� [���� �÷��� ����]������
��Ī�� ���δ�. [From �÷���1 ��Ī, �÷���2 ��Ī, ...]
���� �÷����� [��Ī.�÷���]���� �� �ٲ���ߵ�

1) Catesian Product(    CROSS JOIN)

    Ư���� Ű���� ���� SELECT���� FROM ����
    ���̺���� �޸��� �����Ͽ� ���� ���
    ������� �÷��� ���� �� ���̺��� ���� ���� �ǰ�,
    ���ڵ� ���� �� ���̺��� ���� ���� ���
 =   �� ���̺��� ���Ͽ� ��ġ�� Ÿ�� ������ �������� �ҷ��ö� ��� 

2) EQUI Join
   WHERE ���� ����Ǵ� ���� ������ �˻��ؼ�
   ���� ���̺� ���� ���� ������ ������
=  ������ �׸��� �ִ� �� ���̺��� ��ĥ ��
     ��Ī�� �� �ʿ���

3) Non-equi join
    �� �÷��� ���� �ٸ� �÷��� ���� ��Ȯ�� ��ġ���� �ʴ� ��쿡 ���

4) outer join
    join ������ �������� ���� ��쿡��
    ��� �� ���
    LEFT [OUTER] JOIN     : �������̺� ��������
                                           (�������̺� ������ ���������̺� �ִ¾ֵ��� �����)
    RIGHT [OUTER] JOIN  : ���������̺��� �������� ���
                                            (���������̺� ������ �������̺� �ִ¾ֵ��� �� ���)
    FULL [OUTER] JOIN    : ���� ���̺� �����Ͱ� ������ �� ��������


5) self join
    �� ���̺��� ���� ���� ���̺� �ִ� ��� ����
    �ϳ��� ���̺��� ��ġ �ΰ��� �� ó�� ����Ͽ� ����





����1. t_data01 ���̺�� t_data02 ���̺���  Catesian Product ���ϱ�
Select *
From   t_data01 , t_data02


����2. employees ���̺�� departments ���̺��� EQUI Join�Ͽ�
            employee_id, first_name, department_name, department_id �� ���

Select       e.employee_id, e.first_name, d.department_name, e.department_id
From        employees   e   , departments   d
WHERE    e.department_id = d.department_id
���� ���(from ��)

Select e.employee_id, e.first_name, d.department_name, e.department_id
From employees e join departments d
ON  e.department_id = d.department_id
(���ǹ� where ��ſ� on ���� ���� join�� ��ߵ�)

2-1) ��, department_id�� 100���� �����͵鸸 ��ȸ

Select e.employee_id, e.first_name, d.department_name, e.department_id
From employees e join departments d
ON  e.department_id = d.department_id
AND e.department_id = 100


����3. emplotees ���̺�� salary_grade���̺��� Non-equi join�����Ͽ�
            first_name, salary, grade �÷��� ���ڵ� ���
            (��, grade�� salary�� salary_grade ���̺���
            low_sal�� high_sal �÷� �������� ��)

SELECT first_name, salary, grade
From employees , salary_grade 
where salary between low_sal and high_sal
order by grade


����4. employees ���̺�� salary_grade ���̺��� 
           �����Ͽ� ��ü salary �� grade�� �� grade�� ���� ���
 
SELECT concat(grade,' ���') "grade", concat(COUNT(grade),' ��') as �Ұ�
From employees , salary_grade 
where salary between low_sal and high_sal
group by grade

          4-1) ��, grade�� �Ұ谡 10�̻��� ���ڵ鸸 ���

SELECT concat(grade,' ���') "grade", concat(to_char(COUNT(grade),'00'),' ��') as �Ұ�
From employees , salary_grade 
where salary between low_sal and high_sal
having COUNT(grade) >= 10
group by grade


����5. employees ���̺�� departments ���̺��� �����Ͽ�
            last_name, job_id, department_id, department_name�� ���

SELECT  e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d
WHERE e.department_id = d.department_id


����6. employees ���̺�� departments ���̺��� �����Ͽ�
            �� �μ��� �޿��� ���� �޿����� ����  ������ �˻��Ͽ�
            department_id, department_name, �μ��� �޿��� ���� ���
            ��, �μ� ���̴ٰ� ���� ���ڵ�鵵 ���
������� :   �μ� ���̵�     �μ���        �μ��޿���
                    --------------------------------------------
                        10                     ****             0000000



select e.department_id "�μ� ���̵�", d.department_name "�μ�", to_char(sum(e.salary),'000,000') "�μ� �޿���"
FROM   employees e left outer join departments d
on e.department_id = d.department_id
group by e.department_id,d.department_name
ORDER BY sum(e.salary) desc


����7. employees ���̺��� ���� �����Ͽ�
            emloyee_id, first_name, manager_id, manager_name
            ��, manager�� ���� ������� �����ʹ� ceo�� ���



SELECT         e.employee_id, e.first_name, e.manager_id, 
                     NVL2(m.first_name,m.first_name,'CEO') as "MANAGER_NAME"
FROM          employees e left outer join employees m
ON               e.manager_id = m.employee_id
ORDER BY   employee_id


====================================================

6. SUB QUERY ���� ����

�ϳ��� ���̺��� �˻��� �����
�ٸ� ���̺� �����Ͽ�
���ο� ����� �˻�

�ϳ��� SELECT ����(���� ����) �ȿ� ���Ե�
�� �ϳ��� SELECT ����(���� ����)

�� �������� �����ʿ� �ݵ�� ��ȣ�� �ѷ��μ� ���
Ư���� ��츦 �����ϰ� ORDER BY�� ���� �� ��

SELECT ~~~
FROM ~~~
WHERE ~~~ >= (SELECT ~~~ FROM~~~)

1. ������ ���� ����
    ���� ����� ���� �ϳ��� �ุ ��ȯ
    ���� ������ WHERE ������ ���� �� �� �����ڸ�
    ����ؾ� �� (=, >, >= , <, < >)
 ������ ������ ������� �ϳ��� ���϶� ���
 ������� 1) ���������� ���� ã�´�. 2) ã�����ϴ� ������ �������� ����ִ´�.






����1. Lex�� ���� �μ� ������� ��� ��� ���� ���� ���� ��
            Lex�� department_id�� ã�´�.
            ã�Ƴ� department_id�� ��ġ�ϴ� ������� ��� ����Ѵ�.

select first_name,department_id
from employees
where department_id = (select department_id
                                           from employees
                                           where first_name = 'Lex')


����2. ��� salary ���� ���� salary�� �޴� �������
           first_name, salary, job_id�� ���
            ��, ��� salary�� �Ҽ��� ���� �ݿø��Ͽ� 
                   salary �������� ����

select first_name,salary,job_id
from employees
WHERE salary  <= 
(
select round(avg(salary))
from employees
)
ORDER BY salary desc

����3. ���� ���� �޿��� �޴� job_id�� ���� �ش��ϴ�
             job_id �� ��� �޿� ���



����4. ���� ���� ��� salary�� �޴� job_id�� ���� 
           �ش��ϴ� job_id �� ��� salary ���

select job_id, avg(salary) as "��� �޿�"
from employees
having avg(salary)=
(
select min(avg(salary))
from employees
group by job_id
)
group by job_id

16/12/09===================================================================

2. ������ ���� ����
�ݵ�� ������ �����ڿ� �Բ� ����ؾ� ��

  �� ���� ���� ������ ��� �߿��� 
 IN              	 :   �ϳ��� ��ġ�ϴ� ���
 ANY, SOME	 :   �ϳ� �̻��� ��ġ�ϴ� ���
 ALL		 :   ��� ���� ��ġ�ϴ� ���
 EXIST 		 :   �����ϴ� ���� �ϳ��� �����ϴ� ���



ANY/ALL		:  �ַ� =, > , < , >= , <= , <> �� ���� ���
> ANY		:  �ּҰ����� ŭ
> ALL 		:  �ִ밪���� ŭ
 <ANY		:  �ִ밪���� ����
 <ALL 		:  �ּҰ����� ����







����1. �� department_id ���� �ּ� �޿��� �޴� �������
            first_name, salary , department_id ���

select first_name,salary, department_id
from employees
where (department_id,salary) in
(
select department_id, min(salary)
from employees
group by department_id
)


����2. department_id�� 30���� �������  salary �� 
            ���� ū ������ �� ���� salary�� �޴� �������
            first_name, salary ���

select first_name,salary
from employees
where salary >all
(
select max(salary)
from employees
where department_id = 30
group by department_id
)

����3. department_id�� 30���� �������  salary �� 
            ���� ���� ������ �� ���� salary�� �޴� �������
            first_name, salary ���

select first_name,salary
from employees
where salary >any
(
select min(salary)
from employees
where department_id = 30
group by department_id
)

����4. commission_pct�� 0.1, 0.15 �� ������ ��� ū
            ������� first_name, commission_pct ���
            (commission_pct ���� ���� ����)
select commission_pct
from employees
where commission_pct >all(0.1,0.15)
ORDER BY commission_pct desc


����5. salary�� 10000 �̻��� ������� department_id �� 
           ���� department_id�� first_name, salary, department_id ���


============================================
3. ��Į�� ���� ����

���� ������ select ������ �Լ�ó�� ���Ǵ� ������

����1. employees ���̺�� departments ���̺���
            �����Ͽ� first_name, department_name ���

select first_name,
       department_id, 
(select department_name
from   departments d
where e.department_id = d.department_id
) "�μ� �̸�"
from   employees e 
order by department_id



===============================================

4. ����� ���� ����

���� �������� �ѱ� �����͸� ���� ������ ó���� �� �����ִ� ���


����1. ������� �Ҽ� �μ��� ��� salary���� ���� salary�� �޴�  
            ������� first_name, salary, department_id ��� ���

1.WHERE ���� �ذ�

select first_name,salary,department_id 
from employees f
where salary < (select avg(salary)
from employees a
where f.department_id =a.department_id)
order by department_id

2.FROM ���� �ذ�

select    f.first_name,  f.salary,  b.department_id 
from     employees f, (select department_id, AVG(salary) ���
                                     from employees
                                     group by department_id)       b
where   f.department_id = b.department_id
and       f.salary < b.���
order by  department_id

3.������
select first_name,salary,department_id 
from employees outer
where salary < (select avg(salary)
                           from employees 
                           where department_id = outer.department_id)
order by department_id,salary


����2. department_id ���� department_id,
            department_name, ��� salary �� 
            �� �μ��� ��ġ�� city �� country_name�� ��ȸ
            ��, ��� salary�� ���� ������ �����ϵ� �Ҽ��� ����
           �ڸ����� ����
      
select e.department_id, d.department_name, trunc(avg(e.salary)) "��� salary", l.city, c.country_name
from   employees e,departments d, locations l, countries c
where  e.department_id = d.department_id
AND    d.location_id = l.location_id
AND    l.country_id = c.country_id
group  by e.department_id,d.department_name, l.city, c.country_name
ORDER  BY trunc(avg(e.salary)) DESC



=========================================================

View
 
�������� ���̺� �ٰ��� ������ ���� ���̺�
�������� �����ʹ� ������.
�������̺��� ����ϴ� �Ͱ� �����ϰ� ��� ����
���� ���̺��� �Ļ��� ��ü��
�⺻���̺� ���� �ϳ��� ������

1.create view
   �� ����

2.create or replace force view
�並 ���� �ϰų� ���� �䰡 �����ϴ� ��� ����

3. FORCE
������ ���� ���ο� ��� ���� �����

4. WITH REDAD ONLY
    SELECT�� �����ϵ��� ó��
    ���� �ÿ��� , INSERT/DELETE/UPADTE ��� ����


5. WITH CHECK  OPTION
    ���� �������� WHERE ���� �߰��Ͽ� ���� ���� ����
---------------------------------------------------------------

���� ����

1. �ܼ� ��
     �並 ������ ���� ������ ���� ������ �� ����
      1���� ���̺�� ��������� ��

2. ���� ��
     �並 ������ ���� ������ ���� ���� ���̺��� 
     ���εǾ� ��������� ��

3. �ζ��� ��
    CREATE VIEW�� ������ �䰡 �ƴ϶�
    ���� ������ �ӽ÷� ������ ������ ��
    FROM ���� ���� ������ ���





����1. job_id�� 'IT_PROG'�� ������� �ҼӵǾ��ִ� 
          last_name, job_id, job_title,department_name
          ��, FROM ���� ���� �������� �̿�

select e.last_name, e.job_id, j.job_title,d.department_name
from departments d, jobs j  ,(select last_name,job_id, department_id
                                                  from employees
                                                   where job_id = 'IT_PROG') e 
where e.job_id = j.job_id
AND   e.department_id = d.department_id


����2. employees ���̺��� �̿��Ͽ�  employee_id, 
           last_name, job_id, salary �÷��� ���� �ܼ� �� v_emp ����
           (��, ������ �䰡 �������� �ʴ� ��쿡��)

create  view V_EMP
as
select employee_id, last_name, job_id, salary
from employees
   

����3. employees ���̺��� �̿��Ͽ� employee_id, 
           last_name, job_id, salary �÷��� 
          ���� �����ȣ, ����, ������ȣ, �޿��� �̸�����
          ���� �ܼ� �� v_emp ����
           (��, ������ �䰡 �����ϴ� ��� ���ο� ��� ����ǵ��� ó��)

create or replace  view V_EMP(�����ȣ, ����, ������ȣ, �޿�)
as
select employee_id , last_name, job_id, salary
from employees


����4. department_id ���� salary�� �Ѿװ� ����� ��ȸ�� 
            �� �� �ִ� V_salary_info �並 �ۼ�

create or replace view V_salary_info(�μ���ȣ,�޿��Ѿ�,�޿����)
as
select department_id,  sum(salary),  avg(salary)
from employees 
group by department_id
with read only

������Ʈ ���� �޼���
ORA-01732: data manipulation operation not legal on this view
update v_salary_info
SET �޿��Ѿ� = 10000
WHERE �μ���ȣ = 100

���� 5. employees ���̺�� departments ���̺��� �����Ͽ�
            emploee_id, last_name, salary, department_name
            �÷��� 
            ���� emp_id, emp_name, sal, dept_name�� �̸����� 
             V_EMP_INFO �� ����
create or replace view v_emp_info
as
select e.employee_id, e.last_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id

Rownum ��  �������� ���� �ý��ۻ� ��������
select rownum, last_name ,salary
from employees

�ζ��� 
select rownum, e.last_name, b.salary
from employees e,
(select  last_name ,salary
from employees
ORDER BY salary)b
where e.salary = b.salary

where��





����6. employees ���̺��� job_id�� IT_PROG �̰ų�  
           PU_CLERK�� �����͵��� employee_id, last_name, 
           job_id, salary �÷��� ���� v_emp_view �� ����
          ��, �������� ������ �÷� �� ���� ���� ����


           salary�� 5000�̻��� ������� job_id�� IT_GUY�� ����

����7.employees ���̺��� hire_date�� ���� ���� ��� 5���� ��ȸ�ϴ�
          v_emp_hire �並 ����

create or replace  view v_emp_hire
as
select rownum ����, hire_date
from (select hire_date
     from employees
     order by hire_date)
where rownum <= 5

����8. employees ���̺��� salary ���� 10���� �������
            last_name, job_id, salary�� ���

select rownum, e.last_name,e.job_id, b.salary
from employees e,
(select  last_name ,salary
from employees
ORDER BY salary)b
where e.salary = b.salary


����9. department_id �� �ּ�/�ִ�/��� �޿��� ����ϴ� v_dept_info �ۼ�
           ��, ��ձ޿��� �ݿø�
           ������� : �μ���        �ּұ޿�           �ִ�޿�         ��ձ޿�
                             --------------------------------------------------------
create or replace view v_dept_info
as
select d.department_name �μ���, min(e.salary) �ּұ޿�, 
       max(e.salary) �ִ�޿�, round(avg(e.salary)) ��ձ޿�
from employees e ,departments d
where e.department_id = d.department_id
group by d.department_name
order by department_name

����. ���� view ���̺� �����

16/12/12===========================================================================================================


SEQUENCE
���������� �ڵ� �����Ǵ� ����
Ex) �޸� ��ȣ ���� ����Ҷ��� ������ �޸�������(SYSDATE)

CREATE SEQUENCE ��������
START WITH      ���۰�
INCREMENT BY    ������
MAXVALUE        �ִ밪
MINVALUE        �ּҰ�
CYCLE           �����(��ȯ)����
CACHE           ĳ����� ����
                �޸� �󿡼� ������ ���� ����
                �⺻ ���� 20(�̳��� �׳� ��ĳ��)


������ ��� : ��������.NEXTVAL

����1.  ���۰� 1,  �ּҰ�1, �ִ밪 9999999999999
             ������ ���� ��ȯ�ؼ� ������� �ʵ���
             T_MEMO_SEQ �������� ����

CREATE SEQUENCE   "T_MEMO_SEQ"  
MINVALUE 1 
MAXVALUE 9999999999999 
INCREMENT BY 1 
START WITH 5 
NOCACHE  
NOORDER
 NOCYCLE ;


����2. T_MEMO_SEQ �������� �̿��Ͽ�
            T_MEMO ���̺� �޸� �ϳ� �߰�
            
INSERT INTO T_MEMO
VALUES(T_MEMO_SEQ.NEXTVAL,'SEQ1','TOP','SEVER','SMITH_JPG',SYSDATE)

* �������� ����Ҷ� �����̸Ӹ� Ű ������ ������ �� Ȯ������.


-CURRVAL
�������� LAST NUMBER ���� NEXT VLAUE ���� ��.
SELECT T_MEMO_SEQ.CURRVAL
FROM   DUAL
���� �޸��� �ۼ��� ������ �˼� �ִ�.

=================================================================================

INDEX

sql ��ɹ��� ó�� �ӵ��� ��� ��Ű�� ���ؼ�
�÷��� ���ؼ� �����ϴ� ����Ŭ ��ü

�⺻ Ű�� ���� Ű�� ������ ���Ἲ�� Ȯ���ϱ� ���ؼ� 
���÷� �����͸� �˻��ϱ� ������ ���� ��ȸ�� ��������
����Ŭ���� ���������� �ش� �÷��� �ڵ����� �ε��� ����


����: �˻� �ӵ��� ������
      �ý��ۿ� �ɸ��� ���ϸ� �ٿ���
      ��ü �ý��� ���� ���

����: �ε����� �߰����� �����ʿ� �� ���� �ð� �ҿ�
      DML�� ���� �Ͼ ��쿡�� ������ ���� ����

ROWID 
����Ŭ�� ��� �����Ͱ� ���� ������ �ּ�
(--�����͸� ã�ư� �� �ʿ�)
�� ROWID ������ ��Ƽ� ���� �ִ� ���� �ε���


**�ε����� ����ؾ� �ϴ� ���
- ���̺� ���� ���� ���� ��
- WHERE ���� Ư�� �÷��� ���� ���� ��
- �˻� ����� ��ü �������� 2~4%������ ��
- JOIN�� ���� ���Ǵ� �÷��̳� NULL�� �����ϴ� �÷��� ���� ���



**�ε����� ������� ���ƾ� �ϴ� ���
- ���̺� ���� ���� ���� ��
- WHERE ���� Ư�� �÷��� ���� ������ ������
- �˻� ����� ��ü �������� 10~15% �̻��� ��
- ���̺� DML �۾��� ���� ���


�ε��� ����

CReate INDEX �ε��� �̸�
ON           ���� ���̺� ��(���ϴ� �÷���)



�ε��� ����

1. UNICQUE INDEX  
   --�⺻ Ű�� ���� Űó�� ������ ���� ���� �÷��� ����
   



2. NON-UNIQUE INDEX
   �ߺ��� �����͸� ���� �÷��� ���ؼ� ������ �ε���

    CReate INDEX �ε��� �̸�
    ON           ���� ���̺� ��(���ϴ� �÷���)



3. FUNCTION BASED INDEX
    �Լ� ��� �ε���
    WHERE ���� ��� ǥ�� �Ǵ� �Լ��� ����ϴ� ���
    �̸� �����Ͽ� �����ϴ� �ε���
    
    ex) WHERE salary = 10000
        WHERE salary*12 = 120000 
        ���ǥ���� ����� ����

4. COMPOSITE INDEX
    ���� �ε���

    �� �� �̻��� �÷����� �����ϴ� �ε���
    WHERE ������ �� �� �̻��� ������ AND�� ����Ǵ�
    ��쿡 ���� ���
    �߸� ����� ������ ���� ��ȭ ���


����1. ���� ������ �̿��Ͽ� emp ���̺��� ��� �����͸� 
       emp3 ���̺� �߰��ϰ�, last_name �÷��� emp3_lastname_idx
       ��� �ε��� ����
    
       insert into emp3
       select      *
       from        emp

    CREATE INDEX emp3_lastname_idx
    ON           emp3(last_name)

����2. ������ ������ �ε��� ����
       drop index emp3_lastname_idx


����3. T_DATA01 ���̺��� DATA_NO �÷��� DATA1_NO_IDX ��� 
       �̸��� UPNIQUE �ε��� ����

    CREATE UNIQUE INDEX DATA1_NO_IDX
    ON           T_DATA01(DATA_NO)

����4. emp3 ���̺��� salary �÷��� emp3_sal_idx��� �̸��� 
       �ε��� �����ϰ�, salary*12�� 120000�� ��������
       last_name, salary, salary*12�� ��� 

    CREATE INDEX emp3_sal_idx
    ON           emp3(salary)
    select distinct last_name, salary, salary*12
    from emp3
    where salary*12 = 120000

����5. emp3 ���̺��� SALARY �÷� 12���� ������2 EMP_SAL_FBIDX
       salary*12�� 120000�� ��������
       last_name, salary, salary*12�� ��� 

    CREATE INDEX emp3_sal_FBIDX
    ON           EMP3(SALARY*12)

    SELECT DISTINCT last_name, salary, salary*12
    FROM EMP3
    where salary*12 = 120000


����6. EMP3 ���̺��� SALARY�� 10000 �̻��̰�,
       JOB_ID�� MK_MAN�� ������ �˻��غ���
       SALARY�� JOB_ID�� ���� �ε����� 
       emp3_sal_job_idx ����

    SELECT SALARY, JOB_ID
    FROM EMP3
    where salary >= 10000
    And   job_id = 'MK_MAN'

    create index emp3_sal_job_idx
    on           emp3(salary,job_id)

    *���� �ʿ��� �������� �����, �ʿ��� �ε����� ����
    ���Ϸ� ����
2016/12/13=======================================================================

����. Q&A �Խ��� Ver.01 data ���̺� �����

�䱸���� ����

1. ȸ�������� �ϰ� ���̵� ������ ����� ���� ����
2. �亯�� �����ڸ� ����
3. �亯�� �Ϸ�Ǹ� �亯 ���ο� O ǥ��
4. ...

//��� ����// USER INTERFACE

1�����̺�
// Q & A �Խ���//

                                                            [�����ϱ�]
  NO.       ����                �ۼ�����          �ۼ���      �亯����
+--------------------------------------------------------------------+
|  1      ù���� ����           12/31/2016          ABC          X    |
|  2      �׳� ����             11/30/2016          BBB          X    |
|  3      �����ڴԲ�            11/11/2016          CCC          O    |
+--------------------------------------------------------------------+
                           [�ۼ��� �˻� ��]                   [�����ϱ�]
                                                            --4. ���� ���
=====================================================================


//Q & A �󼼺���// "UI"
    ��ȣ       1
    ����       ù��° ����           ��ȸ�� 1
    �ۼ�����    12/31/2016          ��õ 0
    �ۼ���      ABC
    ���� ����   ~~~~~~~~~~
               ~~~~~~~~~~??

[����] [����]                           [��õ�ϱ�] --��ȸ���� �����ؾߵ� UPDATE
--������� ���̰� �Ⱦ������ �Ⱥ���
--������ ������ �����Ͻðڽ��ϱ� Y/N
==================================================================
    //�亯//

    ���� �亯�� ��� ���� �ʾҽ��ϴ�.        [���]
             --����� �ȵȰ��

              ù��° �亯                   [����] [����]--�亯������ ������Ʈ
    �������: 12/31/2016

--���� ���� �亯�� �����ڸ� �� ���ְ� ������ ȸ������ �� ����
       
=====================================================================

2�� ���̺�
//Q & A �Խ���

    �����ϱ�
    ---------------------------
    ������ȣ
    ����      ~~~~~~~~
    �ۼ���    ~~~~~~
    ��������  ~~~~~~
              ~~~~~~~?    
======================================================================

3. ���̺�
//�亯�ϱ�
    
    ����       ~~~~~
    ���� ����  ~~~~~~??
    ���� ��ȣ  1
    -- ���� ������ ����
    �亯    ~~~~~!       
    �ۼ���


4. ȸ�� ���̺�

 




--T_QNA_Q ���� ����

** ���� �� ����
SELECT *
FROM T_QNQ 
WHERE T_QUESTION = ''

** ���� ���� ����
UPDATE T_QNA_Q
SET ����= ''
FROM T_QNA_Q
WHERE ���� = ''

** ���� ���� ����
DELETE T_QUESTION
FROM T_QNA_Q
WHERE T_QUESTION =''


** ���� �߰�
INSERT INTO T


** ���� ��� ���




--�亯 ����

** �亯 ����

** �亯 ����

** �亯 ���

���� ��� ���� ���� ��============================================================



1. ȸ�� ���̺�                   ���̺� �̸�: MEMBER
�׸�            �÷���     ������Ÿ��(ũ��)   ��������
-------------------------------------------------------------
ID            M_USER         VARCHAR2(8)      PK
PASS          M_USERPW       VARCHAR2(10)	  not null  
�̸���         M_EMAIL        VARCHAR2(30)	    UK not null
����           M_GENDER       CHAR(1)	         CHECK 
                                            M_GENDER IN('F','M'), not null
��ȭ           M_PHONE        VARCHAR2(13)	 not null    
�̸�           M_NAME    VARCHAR2(10)	         not null
����           M_BIRTH        DATE             not null

--�����ڴ�  ADMIN, T_MEMBER�� ������ ������


2.Q & A ���̺�                        ���̺� �̸�: QNA

�׸�               �÷���             ������Ÿ��(ũ��)        ��������
-----------------------------------------------------------------------------
��ȣ              Q_NO                NUMBER                  PK,SEQ
���������         Q_QDATE              DATE                  DEFAULT SYSDATE
�亯�����         Q_ADATE              DATE                  
�ۼ���             Q_USER             VARCHAR2(8)             FK
��������           Q_TITLE             VARCHAR2(60)           
��������           Q_QCONTENTS          VARCHAR2(150)
�亯����           Q_ACONTENTS          VARCHAR2(500)     DEFAULT '���� �亯�� ��� ���� �ʾҽ��ϴ�.'
�亯����           Q_CHECK             CHAR(1)                CHECK, DEFAULT 'N',(CHECK IN('X','O'))
��õ��             Q_BEST              NUMBER                 DEFAULT 0
��ȸ��             Q_CLICKS            NUMBER                 DEFAULT 0


===========================================
SEQUENCE

��ȣ      ����               �̸�
1        ID_NO_SEQ          ��ȣ


===========================================
SQL


1. ȸ������ ������ ���̺� ���� ����

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

1-1. ȸ�����
INSERT INTO MEMBER
VALUES('ADMIN','ADMIN','ADMIN@ADMIN.COM','M','010-1111-1111','������','12/01/2016')
--��� �� �ۼ�
--�̸��� �ߺ� �ȵǰ�


2. Q & A ������ ���̺� ���� ����

    CREATE TABLE  "QNA" 
   (	"Q_NO" NUMBER, 
	"Q_QDATE" DATE DEFAULT SYSDATE, 
	"Q_ADATE" DATE, 
	"Q_USER" VARCHAR2(30), 
	"Q_TITLE" VARCHAR2(60), 
	"Q_QCONTENTS" VARCHAR2(150), 
	"Q_ACONTENTS" VARCHAR2(500) DEFAULT '���� �亯�� ��� ���� �ʾҽ��ϴ�.', 
	"Q_CHECK" CHAR(1) DEFAULT 'N', 
	"Q_BEST" NUMBER DEFAULT 0, 
	"Q_CLICKS" NUMBER DEFAULT 0, 
	 CONSTRAINT "Q_NO_PK" PRIMARY KEY ("Q_NO") ENABLE, 
	 CONSTRAINT "Q_CHECK_CK" CHECK (Q_CHECK IN('Y','N')) ENABLE
   ) ;ALTER TABLE  "QNA" ADD CONSTRAINT "Q_USER_FK" FOREIGN KEY ("Q_USER")
	  REFERENCES  "MEMBER" ("M_USER") ON DELETE SET NULL ENABLE;



3. Q & A �Խ��� ��� ��� --��� ��ư

        SELECT  Q_NO "NO.", Q_TITLE "����", Q_QDATE "�ۼ� ����",
                Q_USER "�ۼ���", Q_CHECK "�亯����",Q_CLICKS "��ȸ��",
                Q_BEST "��õ��"
        FROM    QNA 

3-1. �ۼ��� ã�� --�˻� ��
        SELECT  Q_NO "NO.", Q_TITLE "����", Q_QDATE "�ۼ� ����",
                Q_USER "�ۼ���", Q_CHECK "�亯����",Q_CLICKS "��ȸ��",
                Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_USER = 'ADMIN'


4. ���� ��� --��� ��ư
    INSERT INTO QNA(Q_NO, Q_QDATE, Q_USER, Q_TITLE, Q_QCONTENTS)
    VALUES      (ID_NO_SEQ.NEXTVAL,SYSDATE,'ADMIN','�Խ��� ����','�Խ����� ���ڽ��ϴ�.')
    4-1. ���� ��� ȭ��--���� ��� �Ϸ� ��ư
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO =(SELECT MAX(Q_NO)
                       FROM   QNA)

5. ���� ����
    5.1����ȭ�� ���--���� ���� ��ư
        SELECT  Q_NO "�ۼ���ȣ" , Q_USER "�ۼ���", Q_TITLE "����",Q_QCONTENTS "��������"
        FROM    QNA
        WHERE   Q_NO = 4        
    5.2 ���� ó��
        UPDATE  QNA
        SET     Q_TITLE = '' , Q_QCONTENTS = ''
        WHERE   Q_NO = 4

    5.3���� Ȯ�� ȭ�� --�Ϸ��ư
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO =4

6. ���� ���� --���� ��ư
    DELETE  QNA
    WHERE   Q_NO = 4
    6-1. Q & A �Խ��� ��� ȭ��
        SELECT  Q_NO "NO.", Q_TITLE "����", Q_QDATE "�ۼ� ����",
                Q_USER "�ۼ���", Q_CHECK "�亯����",Q_CLICKS "��ȸ��",
                Q_BEST "��õ��"
        FROM    QNA 


7. ��õ --��õ ��ư
    UPDATE  QNA
    SET     Q_BEST = (Q_BEST +1)
    WHERE   Q_NO = 4

8. ��ȸ�� --���� Ŭ�� ��ư
    UPDATE  QNA
    SET     Q_CLICKS = (Q_CLICKS +1)
    WHERE   Q_NO = 4

9. ���� �� ���� 
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO =4

10. �亯 ���
   10.1 ���� ȭ�� ��� --�亯�ϱ� ��ư
        SELECT  Q_NO "������ȣ", Q_USER "�ۼ���", Q_TITLE "����",Q_QCONTENTS "�ۼ�����"
        FROM    QNA   
        WHERE   Q_NO = 4 
   10.2 �亯 ��� ó�� 
        UPDATE  QNA
        SET     Q_ACONTENTS = '',Q_CHECK='Y', Q_ADATE=SYSDATE
        WHERE   Q_NO = 4    
   10.3 �亯 ��� ȭ�� --�Ϸ� ��ư
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO =4

11. �亯 ����   
    11.1 �亯 ���� ȭ�� ��� --�亯 ���� ��ư
        SELECT  Q_ACONTENTS "�亯����"
        FROM    QNA
        WHERE   Q_NO = 4
    11.2 �亯 ���� ó��
        UPDATE  QNA
        SET     Q_ACONTENTS = '',Q_CHECK='N', Q_ADATE=SYSDATE
        WHERE   Q_NO = 4
    11.3 �亯 ��� ȭ�� --�Ϸ� ��ư
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO =4


12. �亯 ����--�亯 ���� ��ư
    UPDATE  QNA
    SET     Q_ACONTENTS = DEFAULT, Q_CHECK = 'N'
    WHERE   Q_NO = 4    
    12.1 �亯 ��� ȭ�� --�Ϸ� ��ư
        SELECT  Q_NO "NO.", Q_TITLE "����",Q_QDATE "�ۼ�����", 
                Q_USER "�ۼ���", Q_QCONTENTS "��������",Q_ACONTENTS "��䳻��", 
                Q_ADATE "�亯 �������",Q_CLICKS "��ȸ��", Q_BEST "��õ��"
        FROM    QNA
        WHERE   Q_NO = 4


13. ������ 1 ����
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

tnsnames.oracle: Ŭ���̾�Ʈ ���� ����Ŭ ������ �����ϱ� ���� ���� ��������
DB�� ������ �� ���߿� JABA�� 
����Ŭ ������ �����ϴ� ȯ��� ���� �ʴ�. �������� �����Ѵ�.
ORACLE DATA BASE MANAGEMENT SERVER ��� ��ġ�Ǿ���������
HR, DEV, SYS, EMP,.... �� DBMS ������ ��� ���� ����
Ŭ���̾�Ʈ�� SQL PLUS �� DBMS�� ���� ���� ��û�� ��

listener.oracle: �������� Ŭ���̾�Ʈ ����� �����ϰų� ���� ������

============================================================

1. HR SQL COMMAND line ���ӹ��

1)ó�� ����
SQL> CONN SYS/1111 AS SYSDBA

1-1) ���� �����
SQL> CONN SYS/1111 AS SYSDBA -- ������ ������� SYS�����ڷ� ���ߵ�
SQL> CREATE USER [��������] IDENTIFIED BY [��й�ȣ]

2)HR ���� ������ ����
SQL> ALTER USER [hr] ACCOUNT UNLOCK;

3)���� ��� ����
SQL> ALTER USER hr IDENTIFIED BY 1111
SQL> CONN hr/1111


�� ����� ����
SQL> ALTER USER hr IDENTIFIED
SQL> CONN / AS SYSDBA





==============================================================
 
SQL * PLUS ��ɾ�

> HELP SET


    1.�������

        ����Ű�� ��
        ���� �ߴ� ����� ���ۿ� ����Ǿ����� 
        > L: SQL���� �����ߴ� ������ ��ɾ �����ְ�
        > /: ���ۿ� ����� ������ ��ɾ ���� ��
        > R: RUN ������ ����� SQL���� ǥ���ϰ� �����Ѵ�.
    
    2.���� ���� ���
        ������ ������ ���Ͽ� �����ϴ� ��ɾ��
        
        > ed [���ϸ�]: ���ۿ� ����� ������ ��ɾ �޸������� ǥ���ϰ� 
            �޸����� ������ �ڿ� �����ϰԵǸ� sql �÷����� ��ɹ����� ǥ�õ�
            
        > SAVE ���ϸ�[.Ȯ����][REPLACE][APPEND]
            --REPLACE ������ ��ɾ�� �ٲٱ�
            --APPEND  ������ ��ɾ� �߰�

        > GET [���\���ϸ�]
            �������� ����ִ� ������ ���۷� �ҷ���

        > @ [���\���ϸ�][.Ȯ����]
            ����� SQL������ ��� ��ɵ��� �ٷν����ϴ� ���� [���� �����͸� �ѹ��� ���డ��]

        > SPOOL ���\���ϸ�;    
        > [��ɾ�� �Է�];
        > SPOOL OFF;
            SPOOL�� ������ �������� SPOOL�� ���� ��������
            �Էµ� �������� ����� ������� ������ ��ο� .LST ���Ϸ� �����
          
     
      
    
    3.DB ���� �� ����

        > CONNECT ���̵�/��й�ȣ
        > CONN    ���̵�/��й�ȣ
    
        > host: DOS FROMPT�� ����
         �� > DIR/W [���\���ϸ�*] : ������ ������ �� �� ����.
         �� > CODE [���\���ϸ�*]: �ڵ带 �޸������� �ٷ� ������
         --TABŰ�� ������ ���ϰ��õ� ������ �ڵ����� ����
        
        > exit :   SQL�������� ���̵����� 
                   HOST�� DOSFT������ SQL������ �ٽ� ����

    4.��� ����
 
        > SET ��ɾ�
            ��HELP SET �ؼ� ���� ��ɾ���� ����
        > SET SERVEROUTPUT ON/OFF
            PL/SQL, ���ν����� ȭ������ ��µ�.  
          
        > SELECT * FROM TAB;
          Ŭ���̾�Ʈ�� �������ִ� ���̺��� ��� �����ش�.

        > COL [�÷���] FORMAT A���� --�÷� �ʺ����� A����
          COL[UMN] �÷��� FORMAT A���� --�÷��� �׸� ��� ����
          COL[UMN] �÷��� FORMAT 9,999,999 --��Ÿ���� �ڸ���
          COL[UMN] �÷��� FORMAT 000.00 --�Ҽ��� �ڸ���
          
          > SELECT * FROM TAB;
        
        > desc [���̺��];
          ���̺��� ������ �˼� �ִ�.
        
        > SHOW ERRORS
          �������� ����� ��ɹ��� ������ ã�Ƴ���.


����1. C ����̺� �ؿ� DATA ������ �����ϰ�
      SQL PLUS���� ���� �������� ������ ��������
      EXERCISE.SQL ���Ϸ� ���� 


      > SAVE C:\DATA\EXERCISE
      --SAVE [��θ�\���ϸ�] ��η� ���󰡼� ���ϸ����� ���� 

      ����1-1. DEPARTMENT_ID �ߺ��ȵǰ� �����ѵ�
               EXERCISE.SQL ���Ͽ� �߰�  [APPEND]


               > SAVE C:\DATA\EXERCISE APPEND

����2. EMP2 ���̺��� ��ü �����͸� ��ȸ�ϰ�,
       DEPARTMENT_ID�� 20�� �����͸� ��ȸ�ϴ� �����
       C ����̺� ���� DATA ������
       EMP2_DEPTS.LS ���Ϸ� ĸ���� ��,
       ĸ���� ������ SQL PLUS���� ���


       > ED C:\DATA\DATA\EMP2_DPETS.LST

===========================================================

DB ����

����ڰ� Ư�� ���̺� ���� ���� ���γ�
Ư�� ���̺� SELECT/DELETE/UPDATE/INSERT ���� 
������ ���� ���� ��������

1. �ý��� ���� System Privileges
   ������� ����/����, DB ���� �� ���� ��ü ���� ��
   �ַ� DBA�� ���� �ο�

   CREATE/DROP USER --SYS�������� ��
   CREATE/DROP ANY TABLE
   GRANT CREATE SESSION TO [����]--SYS�������� ��
   CREATE VIEW
   CREATE SEQUENCE
   CREATE PROCEDURE

2. ��ü ���� Object Privileges
   ��ü�� ������ �� �ִ� ����
   (���̺�, ��,������, �ε��� ��)


===========================================================

�ý��� ����

1. CREATE ����� ����
   ����Ŭ ��ġ�� �� �ڵ����� �����Ǵ�
   ����Ʈ ����� ���
   �ý��� ������ ���� �����ͺ��̽� �����ڸ� ��������
   --(SYS,SYSTEM)

   > CREATE USER ����ڸ� IDENTIFIED BY ��й�ȣ
   --DB ���� ������ �ο������ʾ� ���ӺҰ�

2. GRANT
   DB������ �ִ� ����ڰ� �ٸ� ����ڿ��� �ý��� ���� �ο�
   --���� ��� DML(SELECT,INSERT,UPDATE,DELETE)
   
   > GRANT [���Ѹ�] TO [����] WITH ADMIN OPTION
     --�ٸ� ����ڿ��� ������ �Ѱ� �ټ� �մ�.






����1. SYS �������� �α����Ͽ� 
       ���̵�� USER1, ��й�ȣ 1111�� ����� ����
       

       > CREATE USER USER1 IDENTIFIED BY 1111

����2. ������ ������ USER1���� DB ���� ������ CREATE SESSION�� �ο�
       

       > GRANT CREATE SESSION TO USER1 

����3. ���̵�� user2, ��й�ȣ 1111�� ����� �����ϰ�
      DB���Ӱ� �ο����� ������ USER3���� DB ���� ���� �ο�


       > CREATE USER USER2 IDENTIFIED BY 1111;
       > GRANT CREATE SESSION TO USER2 WITH ADMIN OPTION;
       > CREATE USER USER2 IDENTIFIED BY 1111; 
       > CONN USER2/1111 ;
       > GRANT CREATE SESSION TO USER3;


============================================================================

��ü ����

����              TABLE      VIEW      SEQUENCE     PROCEDURE
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

���� ����
Ư�� ��ü�� ���� ������
�⺻������ �� �� ��ü�� ���� ����ڿ��Ը� �־���

��Ű�� SCHEMA
��ü�� ������ �����
�ڽ��� ������ ��ü�� ��Ű�� ���� ����

1.GRANT

GRANT ���Ѹ�(SELECT,UPDATE,INSERT,DELETE) | ALL
ON    ��ü�� | �Ѹ� | PUBLIC
TO    ����ڸ�

2.REVOKE
REVOKE ���Ѹ�(SELECT,UPDATE,INSERT,DELETE) | ALL
ON    ��ü�� | �Ѹ� | PUBLIC
FROM    ����ڸ�



����1. USER1 ����ڿ��� EMPLOYEES ���̺��� SELECT�� �� �ִ� 
       ���� �ο�

SQL> CONN HR/1111
Connected.
SQL> GRANT SELECT
  2  ON EMLOYEES
  3  TO USER1;

Grant succeeded.

SQL> SELECT *
  2  FROM HR.EMPLOYEES;
--���̺� ��Ű���� ����ؾߵȴ�.

����2. USER1 ����ڿ��� EMPLOYEES ���̺��� SELECT�� �� �ִ� 
       ���� öȸ
       ��, HR ����ڰ� USER1���� �ο��� ������ Ȯ���ϰ� ó��

SQL> SELECT *
  2  FROM USER_TAB_PRIVS_MADE;

SQL> REVOKE SELECT
  2  ON EMPLOYEES
  3  FROM USER1;

Revoke succeeded.   

========================================================================


������ ��ųʸ� DATA DICTIONARY

DB�ڿ��� ȿ�������� �����ϱ� ����
�پ��� ������ �����ϴ� �ý��� ���̺�

����ڰ� ���̺��� �����ϰų�, ����ڸ� �߰��ϴ� ����
�۾����� �� �ڵ����� ���ŵǼ� �ش� ��ü�� ���� 
��Ÿ ������ ������ ���� ��


�ý����� ���� �����ϱ� ������ ��ȸ�� �� ���
��ȣ ���� ��ȣ�� ������ �� ������ �� �� ����



========================================================================


������ ��ųʸ� DATA DICTIONARY VIEW

    ������ ��ųʸ� �� ���̺��� ���� ��ȸ�ϱⰡ 
    ���� �Ұ����ϱ� ������ ����ڰ� ���� �� �� �ִ� �����͸� ���� �Ѵ�.
    --�������� ���� ��ȸ�� �Ͽ� ������ �ɷ��ִ� �����͸� ���������� ����� �ٸ� ���̺��� ������ Ȯ���Ѵ�.

����
1. Static Data Dictionary View (DICT)--DICT�� ��� ��ųʸ� Ȯ�ΰ���
DESC(���̺� ������ ���� �մ�.)
    DBA_~~~~ --������ ���̽� �����ڸ� ���� ������ ��ü ���� ������ȸ
                ex) DBA_Tables : SYS�� SYSTEM�� ��밡���� TABLE�� �� �� ����

    ALL_~~~~ --�ڽ��� ���� ���� �Ǵ� ������ �ο� ���� ��ü���� ������ȸ
                ex) ALL_tables : ��ü ������ TABLE

    USER_~~~ --�ڽ��� ������ ������ ��ü ���� ���� ��ȸ
                ex) user_tables : �ڽ��� ������ TABLE


2. Dynamic Performance View
   ���� ���� �ڵ� �ݿ�

-------------------------------------------------------------------------------
�������� ����
1)USER_CONSTRAINTS
    CONSTRAINT_TYPE
    -P: �����̸Ӹ� Ű
    -R: FRORIENG KEY
    -U: UNIQUE
    -C: CHECK

2)USER_CONS_COLUMNS

    ���������� �ɸ� �÷����� ��ȸ��   

3)USER_VIEWS

    �����̺��� ������ �������� ��ȸ�Ҷ� ��

4)USER_SEQUENCES

    �����ý��� ������ �÷� ��ȸ

5)USER_IND_COLUMNS

    �ε����� ������ �÷��� ��ȸ �ϰ� �÷��� �ڼ��� ������ ��Ÿ��

6)USER_INDEXES

    �ε����� ����� ���̺���� ���踦 ��ȸ

7)USER_TAB_PRIVS_MADE

    ���� ������ �� ������ ��ȸ

8)USER_TAB_PRIVS_RECD

    ���� ���� ������ ��ȸ

9)USER_ROLE_PRIVS

    ���� ���� �� ����

10)USER_SOURCE
    
    ���ν����� Ʈ���Ÿ� �� �� �ִ�.



============���� 1 ���� ����� ��ųʸ��� ������ ������======

1)USER_CONSTRAINTS
SELECT  CONSTRAINT_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE

� ���� ���ǵ��� �ɾ����� ��� ���� ����

2)USER_CONS_COLUMNS
SELECT   TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME
FROM     USER_CONS_COLUMNS
ORDER BY TABLE_NAME

� ���̺��� �÷��� ������ �ɷ��ִ��� �˼� ����

3)USER_VIEWS
SELECT VIEW_NAME, TEXT
FROM   USER_VIEWS
ORDER BY VIEW_NAME

������� �����̺��� ������ �����ü� ����
    
4)USER_SEQUENCES
SELECT SEQUENCE_NAME
FROM   USER_SEQUENCES
ORDER BY SEQUENCE_NAME

���� ������ ���������� �� �� ����

5)USER_IND_COLUMNS
SELECT INDEX_NAME,COLUMN_NAME
FROM USER_IND_COLUMNS
ORDER BY INDEX_NAME

���� ����ϴ� �ε����� ��÷��� ��ȸ�ϴ��� �˼� ����
    

6)USER_INDEXES
SELECT INDEX_NAME,TABLE_OWNER
FROM USER_INDEXES
ORDER BY INDEX_NAME

������ �ε����� ���� ������ �������� �˼� ����
    

7)USER_TAB_PRIVS_MADE
SELECT PRIVILEGE, GRANTEE
FROM USER_TAB_PRIVS_MADE
ORDER BY PRIVILEGE

 � ������ �������� �־����� �˼� ����

8)USER_TAB_PRIVS_RECD
SELECT TABLE_NAME, Privilege
FROM USER_TAB_PRIVS_RECD

���� � ������ �������� �˼�����



===+++====+++===+++===+++==+++===+++===+++===+++===+++===+++===+++===


//���� ����ϴ� ��ųʸ�//
1.USER_OBJECTS(OBJ)
    - ��� ��ü(���̺�, �ε���, ������ ��..)�� ���� ������ �����Ѵ�.

    -- ������� ���̺���� ��ȸ�ϴ� ���̴� 
    SELECT object_name 
      FROM USER_OBJECTS 
     WHERE object_type='TABLE';
    -- �Ʒ��� �ó���� �̿��ؼ� ��ȸ�ϴ� ���̴�.
    SELECT object_name 
      FROM obj 
     WHERE object_type='TABLE';


2.USER_TABLES(tabs)
    - ���̺� ���� ������ �����Ѵ�.

    -- ����ڰ� ������ ���̺��� ���̺��� ���̺����̽��� ��ȸ�ϴ� ���̴�. 
    SELECT table_name, tablespace_name 
    FROM tabs;


3.USER_TAB_COLUMNS(COLS)
    - ����ڰ� ������ ���̺��� �÷��� ���� ������ �����Ѵ�.

    -- DEPTNO �÷��� �ִ� ���̺�� ������Ÿ��, �����ͻ���� ��ȸ�ϴ� ���̴�. 
    SELECT table_name, data_type, data_length 
      FROM cols 
     WHERE column_name='DEPTNO' ;


4.USER_CONSTRAINTS, USER_CONS_COLUMNS
    - USER_CONSTRAINTS : ����ڰ� ������ �������� ���� ����
    - USER_CONS_COLUMNS : �÷��� �Ҵ�� �������� ���� ����

    -- �Է¹��� ���̺��� �������� ������ ��ȸ�ϴ� ���̴�. 
    SELECT SUBSTR(a.column_name,1,15) column_name,����
             DECODE(b.constraint_type,
                 'P','PRIMARY KEY',
                 'U','UNIQUE KEY',
                 'C','CHECK OR NOT NULL',
                 'R','FOREIGN KEY') constraint_type,����
           a.constraint_name����
      FROM��user_cons_columns a, user_constraints b����
     WHERE a.table_name = UPPER('&table_name')��
       AND a.table_name = b.table_name����
       AND a.constraint_name = b.constraint_name����
     ORDER BY 1;����

    -- ���̺� ���� �Է� �ϸ� �ȴ�.
    table_name�� ���� �Է��Ͻʽÿ�: emp2 
    
    COLUMN_NAME    CONSTRAINT_TYPE    CONSTRAINT_NAME
    ------------- ----------------- -----------------
    DEPTNO           FOREIGN KEY         FK_DEPTNO
    EMPNO            PRIMARY KEY         PK_EMP


5.USER_INDEXES(IND), USER_IND_COLUMNS
    - USER_INDEXES(IND) : ����ڰ� ������ �ε��� ���� ����
    - USER_IND_COLUMNS: �ε��� �÷��� ���� ���� ����
 
    -- ����ڰ� ������ �ε��� ������ ��ȸ�ϴ� ���̴�. 
    SELECT index_name, table_name, tablespace_name 
      FROM user_indexes;

===+++====+++===+++===+++==+++===+++===+++===+++===+++===+++===+++===
����1. HR �������� SQL PLUS�� �����Ͽ� ��� ������ ��� ���̺��̸���
       ������������ �����Ͽ� ���
       ��, USER_TABLES ������ ��ųʸ� �並 ���
       
       > DESC USER_TABLES;


����2. HR ������ �����ϰ� �ִ� ���̺���� �������� ������,�̸�, Ÿ��, �Ҽ� ���̺�
       ����������, ���� �̸��� ���
       

SELECT OWNER, CONSTRAINT_NAME,  CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE



����3.  EMPLOYEES ���̺� ���õǾ� �ִ� �ε��� �̸��� �÷� �̸���
        ȭ�鿡 ���.

SELECT *
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES'

����4. DICT ���̺��� table_name�� ROLE�� ���ԵǾ� �ִ� ���ڵ� ��ȸ

SELECT * 
FROM DICT 
WHERE TABLE_NAME LIKE '%ROLE%'

==============================================================================
2016/12/15

ROLE
����ڿ��� ���� ȿ�������� ������ �ο��� �� �ֵ��� 
���� ���� ������ ���� ������

���� ���� ��: DB ��ġ �� �⺻ ����
    ����ڰ� �����ͺ��̽��� ���� �� �� �ֵ��� �������
    �⺻���� �ý��� ���� 8����

1.> CONNECT --��� CONNECT������ ����
    CREATE CLUSTER
    CREATE DATABASE LINK
    CREATE SEQUENCE
    CREATE SESSION
    CREATE SYNONYM
    CREATE TABLE
    CREATE VIEW
    ALTER SESSION

2. > RESOURCE --��� RESOURCE ������ ����
    ����ڰ� ��ü(���̺�, ��, �ε��� ��)�� ������ �� �ֵ���
    �ϱ� ���� ���� ���� �ý��� ����

    CREATE CLUSTER
    CREATE PROCEDURE
    CREATE SEQUENCE
    CREATE TABLE --ALTER USER [����] QUOTA 50M ON SYSTEM;
    CREATE TRIGGER

3.DBA ROLE
    ����ڵ��� ������ ������ ���̽� ��ü�� �����ϰ�
    ����� ����/����/���� �� �� �ֵ��� �ϴ� ��� ���� ����
    


����� ���� ��: ����ڰ� ���� �� ����
    �ѻ��� > �ѿ� ���� �ο� > �� �ο�
    DBA     DBA/Ư�� �����  DBA

    > CREATE ROLE [���̸�];
    > GRANT [�����̸�] ON [���̺�] TO [���̸�];  
    > CONN/ AS SYSDBA
    > GRANT [���̸�] TO [����];


����Ʈ �� ���� �� ���
    �ѿ� �ý��� ���Ѱ� ��ü ������ �ο��� �� ���� ����ڿ��� �ο�.


---------------------------------------------------------------
ROLE ȸ��

REVOKE  [���̸�]
FROM    [����� �̸�]

> SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = '����'
> REVOKE [�� �̸�] FROM [������̸�]



����1. �ý��� ������ �������� �ѱ����Ͽ�
       ���̵�� USER4, ��й�ȣ�� 1111�� ������ ������ �� 
       CONNECT�� RESOURCE ���� �ο�

> CONN SYS/1111 AS SYSDBA
> CREATE USER USER4 IDENTIFIED BY 1111
> GRANT CONNECT, RESOURCE  TO USER4;
Grant succeeded.


����2. THE_ROLE�̶�� �̸��� ���� �����ϰ�, EMPLOYEES ���̺��� 
       ��ȸ ������ THE_ROLE�� �ο��� �� ������ ���� USER4���� �ο�

> CREATE ROLE THE_ROLE;
> SELECT OWNER,TABLE_NAME FROM ALL_TABLES WHERE TABLE_NAME ='EMPLOYEES'; 
> GRANT SELECT HR.EMPLOYEES TO THE_ROLE;
Grant succeeded.
> GRANT THE_ROLE TO USER4;     
Grant succeeded.

����3. THE_ROLE2��� �̸��� ���� �����ϰ�, 
       �����ͺ��̽� ����/���̺� �� ����� ������ �ο��� ��
       ���̵�� USER5, ��й�ȣ�� 1111�� �������� ����ڿ��� ������ �� �ο�
 
SQL> CREATE ROLE THE_ROLE2;
    Role created.
SQL> CREATE USER USER5 IDENTIFIED BY 1111 ;
    User created.
SQL> GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO THE_ROLE2;
    Grant succeeded.
SQL> GRANT THE_ROLE2 TO USER5;
    Grant succeeded.



����4. BASIC_ROLE�̶�� �̸��� ���� �����ϰ�, �����ͺ��̽� ���� ������ �ο�����,
       EMPLOYEES ���̺��� ����/����/��ȸ ������ ���ѵ� �ο�.

       ���̵� tester1 ~ 3, ��й�ȣ�� 1111�� �����3���� �߰��� ��,
       ��ο��� ������ ������ �� �ο�.
> CREATE ROLE BASIC_ROLE;
> GRANT CREATE SESSION TO BASIC_ROLE;
> GRANT UPDATE,DELETE,SELECT ON HR.EMPLOYEES TO BASIC_ROLE;
> CREATE USER TESTER1 IDENTIFIED BY 1111
> CREATE USER TESTER2 IDENTIFIED BY 1111
> CREATE USER TESTER3 IDENTIFIED BY 1111
> GRANT 


����5. USER5���� �ο��� ���� Ȯ���� ��
       �ο��� ���� ȸ��





����6. USER5���� �ο��Ǿ��� ���� ������ Ȯ��
       ������ ��ųʸ��� �ش� ���� �������� ������

--� ���̺��� �ִ��� Ȯ��
> DESC DICT 

--ROLE �̳� PRIVS�� ���õ� � ���̺��� �ִ��� Ȯ��
> SELECT *
> FROM DICT
> WHERE TABLE_NAME LIKE '%ROLE%' 
OR TABLE_NAME LIKE '%PRIVS%'  
                        
--�ش� ROLE ������ Ȯ��
> SELECT GRANTEE, GRANTED_ROLE
> FROM DBA_ROLE_PRIVS
> WHERE GRANTED_ROLE = 'THE_ROLE2';

GRANTEE              GRANTED_ROLE
-------------------- ------------------------------
SYS                  THE_ROLE2

--�� ȸ��
> REVOKE THE_ROLE2
> FROM SYS

Revoke succeeded.







==================================================================

PL/SQL

Oralces Procedual Language extension to SQL�� ����
�����ͺ��̽� ���� �����͸� �����ϱ� ���ؼ�
SQL�� �Բ� ����

���� ����, ���� ó��, �ݺ�ó�� ���� ����

����      �����       ����, ��� ����
          �����       ���� ���
          ���� ó����  ���� ó�� ���  


����      DECLARE     �����
             --������ ��� ����
          BEGIN       ����� ����
             --���� ���
          END;        ����� ��
          / ���ν��� ����

�͸��� ���ν���
          BEGIN 
          ���ν��� �̸�;
          END;
          /

--������ ���� ��� SHOW ERRORS

ex) > SET SERVEROUTPUT ON
    > BEGIN
    > DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
    > END;
    > /
    HELLO WORLD!

    PL/SQL procedure successfully completed.

���� 

���� ���� :     �����̸� ������ Ÿ��(ũ��);

������ �� ����   [�����̸�]:= ['������ ��'];

����1. ����
           ex) ���ݰ� ������ �� ���ڸ� ������ ���� ����
               customer_name VARCHAR2(20);  //����
               principal number;            //����
               interest_rate number(1,2);    //������
               interest number;              //����


����2. ������ ������ ������ ������ ���� ����
       ���� : kim,       customer_name := 'Kim';
       ����: 10000,        principal := 10000;
       ������: 5%          interest_rate := 0.05; 
       ����: ���� x ������  interest := principal*interest_rate;


����3. ����1�� 2�� �޸��� ���Ͽ� ����Ͽ�
       ���ݰ� ������ �� ���ڸ� ����Ͽ� ȭ������ ���ó��


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
DBMS_OUTPUT.PUT_LINE('���� : '|| customer_name );
DBMS_OUTPUT.PUT_LINE('���� : '|| principal );
DBMS_OUTPUT.PUT_LINE('������ : ' || interest_rate );
DBMS_OUTPUT.PUT_LINE('���� : '|| interest );
END;
/

���ν��� ===============================================

PL/SQL�� ������ ���� �ʿ��� ��� ���� �� ȣ���Ͽ� ��� ����

����   CREATE [OR REPLACE] PROCEDURE ���ν��� �̸�
              [(�Ű�����1 IN|OUT|INOUT ������Ÿ��)
              (�Ű�����2 IN|OUT|INOUT ������Ÿ��)
              .....]
       IS                                --IN �Ѱܹ��� ������
              [���� ����]                 --OUT �Ѱ��� ������
       BEGIN                             --INOUT �Ѵ�
              ó���� ����1
              ó���� ����2
              ....
       END;
       /

����   EXECUTE ���ν����̸�
      EXECUTE ���ν����̸�(�Ű����� ��)




����4. DEV ������� EMP ���̺��� ��� ���ڵ带 �����Ͽ�
       EMP1���̺� �����ϰ�,
       EMP1 ���̺��� ��� ���ڵ带 �����ϴ� 
       DEL_EMP1  ���ν��� �ۼ�
/*EMP1 ���̺��� ��� ���ڵ带 �����ϴ� ���ν���*/
CREATE OR REPLACE PROCEDURE DEL_EMP1
IS
BEGIN
DELETE FROM EMP1;
END;
/
EXECUTE DEL_EMP1;


����5. ������ ������ ������� ���� 8�ڸ� �����ϰ�
       ~~~~�� ~~�� ~~���� ���·� ����ϴ�
       BIRTH_INFO���ν��� �ۼ�
CREATE OR REPLACE PROCEDURE BIRTH_INFO
IS 
BIRTH_NO VARCHAR(8);
BEGIN
BIRTH_NO := '~~~~~~~~';
 DBMS_OUTPUT.PUT_LINE( SUBSTR(BIRTH_NO,1,4) ||'�� '|| SUBSTR(BIRTH_NO,5,2) || '�� ' || SUBSTR(BIRTH_NO,7,2) || '��');
END;
/
@ C:\DATA\PLSQL.SQL;
EXCUTE BIRTH_INFO

����6. ��������� 8�ڸ��� ���ڷ� (19991111)�� �Է¹޾�
      1999�� 11�� 11���� ���·� ����ϴ�
      BIRTH_INFO2 ���ν��� �ۼ�

CREATE OR REPLACE PROCEDURE BIRTH_INFO
IS 
BIRTH_NO VARCHAR(8);
BEGIN
BIRTH_NO := '19991111';
 DBMS_OUTPUT.PUT_LINE( SUBSTR(BIRTH_NO,1,4) ||'�� '|| SUBSTR(BIRTH_NO,5,2) || '�� ' || SUBSTR(BIRTH_NO,7,2) || '��');
END;
/
@ C:\DATA\PLSQL.SQL;
EXCUTE BIRTH_INFO


����7. ������ ������ ��ȭ��ȣ 8�ڸ�(12345678)�� �Էƹ޾�
       010-1234-5678�� ���·� ����ϴ� TEL_INFO���ν��� �ۼ�
       ��,��ȭ��ȣ�� ���� �� ���� ���� ����
       
       CREATE OR REPLACE PROCEDURE TEL_INFO
       (TEL_DATA IN VARCHAR2)
       IS
       TEL VARCHAR2(20) := TEL_DATA;
       BEGIN
       TEL := '010-' ||
              SUBSTR(TEL,1,4) ||'-' ||
              SUBSTR(TEL,5);
       DBMS_OUTPUT.PUT_LINE('��ȭ��ȣ: '|| TEL);
       END;
       /


20161216================================================================

���� �Լ�

���� ���ν����� �޸� ���� ����� �Ѱ��� �� ����
�Ѱ��� �������� Ÿ�԰� ���� ��� �ؾ���



����   CREATE [OR REPLACE] FUNCTION �Լ� �̸�
              [(�Ű�����1 IN|OUT|INOUT ������Ÿ��)
              (�Ű�����2 IN|OUT|INOUT ������Ÿ��)
              .....]
       RETURN ��ȯ������ Ÿ��       
       IS                                --IN �Ѱܹ��� ������
              [���� ����]                 --OUT �Ѱ��� ������
       BEGIN                             --INOUT �Ѵ�
              ó���� ����1
              ó���� ����2
              ....
       RETURN ��ȯ������ ��
       END;
       /

����           VARIABLE �����̸� ������Ÿ��(ũ��);
               EXCUTE:�����̸� := �Լ��̸�
               EXCUTE:�����̸� := �Լ��̸�([�Ű�������])          
�����ǰ� ���   PRINT �����̸�;









����8. BIRTH_INFO ���ν�����  �Լ� BIRTH_INFO_F�� ����
       /*������ ������ ������� ���� 8�ڸ� �����ϰ�
       ~~~~�� ~~�� ~~���� ���·� ����ϴ�
       BIRTH_INFO �Լ� ���ν��� ���*/

CREATE OR REPLACE FUNCTION BIRTH_INFO_F
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20) := '19991111';
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_NO,1,4) ||'�� '|| 
             SUBSTR(BIRTH_NO,5,2) || '�� ' || 
             SUBSTR(BIRTH_NO,7) || '��';
RETURN BIRTH_NO;
END;
/
VARIABLE BIRTH_OUT VARCHAR2(20);
EXECUTE:BIRTH_OUT := BIRTH_INFO_F;
PRINT BIRTH_OUT;

����9. BIRTH_INFO ���ν����� �Լ� BIRTH_INFO2_F�� ����
CREATE OR REPLACE FUNCTION BIRTH_INFO2_F
(BIRTH_DATA IN VARCHAR2)
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20) := BIRTH_DATA;
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_NO,1,4) ||'�� '|| 
             SUBSTR(BIRTH_NO,5,2) || '�� ' || 
             SUBSTR(BIRTH_NO,7) || '��';
RETURN BIRTH_NO;
END;
/
VARIABLE BIRTH_OUT2 VARCHAR2(20);
EXECUTE:BIRTH_OUT2 :=BIRTH_INFO2_F(19991111);
PRINT BIRTH_OUT2
/* �̰͵� ��
CREATE OR REPLACE FUNCTION BIRTH_INFO2_F
(BIRTH_DATA IN VARCHAR2)
RETURN VARCHAR2
IS 
BIRTH_NO VARCHAR2(20);
BEGIN
BIRTH_NO :=  SUBSTR(BIRTH_DATA,1,4) ||'�� '|| 
             SUBSTR(BIRTH_DATA,5,2) || '�� ' || 
             SUBSTR(BIRTH_DATA,7) || '��';
RETURN BIRTH_NO;
END;
/*/



����10. TEL_INFO ���ν����� TEL_INFO_F �Լ��� ����.

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
VARIABLE ��ȭ��ȣ VARCHAR2(20);
EXECUTE:��ȭ��ȣ :=TEL_INFO_F(19991111);
PRINT ��ȭ��ȣ



����11. �͸��� ���ν����� �ۼ��Ͽ�
        BIRTH_INFO ���ν����� �����Ѵ�.

BEGIN
BIRTH_INFO;
END;
/

==========================================================

����Ŭ ������ ����

START WITH ����1
    ��Ʈ��� �ĺ�
    ����1�� �����ϴ� ����� ��� ��Ʈ��尡 ��
    start with ���� ������ ��� ��� ����� ��Ʈ���� ����
    ����1�� ���������� ��� ����
    

CONNECT BY ����2
    �θ�� �ڽ� ���� ���� ���� ���
    ����2���� �ݵ�� prior �����ڸ� ���Խ��Ѿ���
    > prior �����ڸ� �̿��Ͽ� �θ� ����� �÷� �ĺ�
    ����2���� �������� ��� �Ұ�




PRIOR ������
    ������ ���������� ���
    connect by ������ = �� ������ ������ ���Ǵ� ������
    connect by ������ �ش� �÷��� �θ� �� �ĺ�


LEVEL Pseudo column
���� �ǻ� �÷�
    rownum,rowid�� ���� ������ ���̺�
    ����Ǿ� ������ ������ �ִ� �÷�ó�� ��� ����
    ������ ������ ǥ���� �� ���� ǥ��
    �Ϲ����� �÷�ó�� select, where, order by ������ ��밡��

====================================================================

1.T_BOARD ���̺� ����
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
     


2.T_BOARD ���̺� ���ڵ� �߰�
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

3. T_BOARD ����Ʈ


    �۹�ȣ         ����                    �ۼ�����
.............................................................
      1           FIRST                   SYSDATA
      3            ��TTT                  SYSDATA 
      6              ��AAA                SYSDATA     
      4            ��TTT                  SYSDATA
      2           FFF                     SYSDATA
      5           SECOND                  SYSDATA          

    SELECT MEMO_NO, PMEMO_NO, LPAD('���������� ', 2*(LEVEL - 1) ) || TITLE , REG_DATE
    FROM t_board
    START WITH PMEMO_NO = 0
    CONNECT BY PRIOR MEMO_NO = PMEMO_NO



4. T_BOARD ����Ʈ- ��Ʈ ���
--�ܼ��� ��Ʈ ��常 ǥ���� ����¡�� ��Ÿ���� ����Ʈ�� ���ǥ.

    �۹�ȣ         ����                    �ۼ�����
.............................................................
      6           FIRST[3]                SYSDATA
      4           FFF                     SYSDATA
      1           SECOND                  SYSDATA              

     SELECT a.MEMO_NO as "�۹�ȣ",
            a.TITLE ||'['|| NVL((select COUNT(b.pmemo_no)
                                 from t_board b 
                                 where a.memo_no = b.pmemo_no
                                 group by a.memo_no 
                                 ),0) ||']' as "����"  , 
            a.REG_DATE as "�ۼ���"
     FROM  t_board a
     where level =1
     START WITH PMEMO_NO = 0
     connect by prior memo_no = pmemo_no
     order by a.memo_no desc



5. T_BOARD �󼼺���

    �۹�ȣ     :   1
    ������ȣ   :   1    
    ����     : FRIST               
    �ۼ����� : SYSDATA
    ����     : ~~~~~

.............................................................
    ��� ���� :                              �ۼ�����:
        ��TTT                                    SYSDATA 
          ��AAA                                  SYSDATA     
        ��TTT                                    SYSDATA


�ۼ��� �󼼺���
    --����¡ �ϰ� �ɶ� �۹�ȣ(rownum)�� Ŭ���ϰ��.

    select *
    from   
    (select rownum "�۹�ȣ", memo_no "������ȣ", title "���� ", reg_date "�ۼ�����", contents "����"
    from t_board
    where pmemo_no = 0
    order by memo_no desc
    )
    where ������ȣ = 4        
    

��� �󼼺���

    select LPAD('����������', 2*(LEVEL - 1) ) || TITLE "��� ����",contents "��� ����" , reg_date "��� �ۼ�����"
    from  T_BOARD 
    where CONNECT_BY_root memo_no = 1
    and pmemo_no <> 0
    START WITH PMEMO_NO = 0
    connect by prior memo_no = pmemo_no
    
    --������ȣ(memo_no)�� �ڵ������� �����صΰ� ����.
    select rownum, m
    from (SELECT MEMO_NO as m
     FROM  t_board 
     where pmemo_no = 0
     order by memo_no desc)


6. �۾���
    ���̺� pmemo_no�� default ���� �ָ� �Է��Ҷ� ���� �� �ʿ����.

    INSERT INTO T_BOARD(MEMO_NO,TITLE,CONTENTS,REG_DATE)
    VALUES(MEMO_NO_SEQ.NEXTVAL,'���� ���� �����ֳ�','�𸣰پ�',SYSDATE)

    6-1.������
       CREATE SEQUENCE   "MEMO_NO_SEQ"  
       MINVALUE 1
       MAXVALUE 999999999999999999999999 
       INCREMENT BY 1 
       START WITH 1 
       NOCACHE  
       NOORDER  
       NOCYCLE ;

7. ��۴ޱ�


    INSERT INTO T_BOARD
    VALUES(MEMO_NO_SEQ.NEXTVAL,'1','���� ���� �����ֳ�','�𸣰پ�',SYSDATE)

--�۹�ȣ(rownum)�� ������(memo_no)�� �ٸ��⶧���� Ȥ�ø��� ������ ������ ���� ������
    select memo_no
    from t_board
    where 

8. PAGING - �� �������� 5���� ���

 ��ȣ    ����        �ۼ�����       ��ȣ    ����        �ۼ�����                      
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
   from--����¡�� �Ϸ��� rownum�� �������� ��ߵ� ��Ī�� �ٿ�����.
   (  
    SELECT rownum as "�۹�ȣ", "����", "�ۼ���"  
    
    from --����Ʈ ����� from ���� ������
         (SELECT a.MEMO_NO as "������ȣ",
                a.TITLE ||'['|| NVL((select COUNT(b.pmemo_no)
                                     from t_board b 
                                     where a.memo_no = b.pmemo_no
                                     group by a.memo_no 
                                     ),0) ||']' as "����"  , 
                a.REG_DATE as "�ۼ���"
         FROM  t_board a
         where level =1
         START WITH PMEMO_NO = 0
         connect by prior memo_no = pmemo_no
         order by a.memo_no desc
         )
   )
    where "�۹�ȣ" between 5*(2-1)+1 and  5*2
    -- �ο������ �ٽ� �����Ͽ� ����¡�� ����, ������ �ѹ��� ���ڱ���





=====
1. �ý��� ������ �ְ� � ��������Ŭ�� � ������ ��ġ�� �� �ֳ�.
64��Ʈ ���� ���������� �ΰ�
ORACLE DATABASE 12C REALEASE 1
ORACLE DATABASE EXPRESSS EDITION 11G RELEASE2 (32BIT AVAILABLE)


2.listener.ora, tnsnmaes.ora ���� Ȯ���� �� �ִ� ���� 3����?
  sevice_name = xe (SID)�� �ٸ��̸�����?
������
host= ����Ŭ ������ ������ �ּ�{ip}
port = ������ �⺻ ��Ʈ
service_name= �����ͺ��̽���
protocol = ���ӹ�� TCP

3.����Ŭ�� ���������� Ȯ���Ϸ��� �۾������� ���õ� ����2���� �����̳�?
Oracle Service Xe
Oracle XERNS Listener

OracleService�����ͺ��̽���
OracleOraDb10g_home1TNSListener

4.dbȭ���� �ϳ� �ְ� ���̺� �ϳ��� ����� ��ũ��Ʈ�� ���ÿ�
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

5. 1-listener.ora�� �ϴ��� 2-tnsnmaes.ora  �ϴ���
������ = Ŭ���̾�Ʈ�� ����Ŭ ������ �����ϱ� ���ؼ� ���� ��ǻ�Ϳ� �ϴ� ����
�������� �������� = Ŭ���̾�Ʈ���� ����Ŭ ������ ������ �� �ʿ��� ����


6. ���� �ο��� ���Ѱ� ���� ���ѹ��� ��ųʸ� ã�� ���
USER_TAB_PRIVS_MADE

7. ������ �� ���� ������ sys,DBA


8. ���� �ٸ� ���̺��� view ����� ��  
create or replace view v_emp_info
as
select e.employee_id, e.last_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id
�����Ѵ�.

9. ������ ����°� �ʱⰪ �� ������ ��
 CREATE SEQUENCE   "SEQQ"  
 MINVALUE 1 
 MAXVALUE 9999999999999999999999999 
 INCREMENT BY 1 
 START WITH 1 
 NOCACHE  
 NOORDER  
 NOCYCLE ;


last number= ���� ����� ����

10. index�� ���� data��ųʸ� ��� �ϴ°�

USER_INDEXES(IND), USER_IND_COLUMNS
    - USER_INDEXES(IND) : ����ڰ� ������ �ε��� ���� ����
    - USER_IND_COLUMNS: �ε��� �÷��� ���� ���� ����
 
    -- ����ڰ� ������ �ε��� ������ ��ȸ�ϴ� ���̴�. 
    SELECT index_name, table_name, tablespace_name 
      FROM user_indexes;

11. alter �ϴ� ���� �÷� �߰�
  ALTER TABLE ���̺��
  ADD(�÷��� ������ Ÿ��(�ڸ���) DEFAULT(�÷��� �⺻�� ����))
ALTER TABLE t_virtual
ADD   (no6 char(10) default '6th')


12. insert into ����

INSERT(������ �߰�)

INSERT  INTO  ���̺��[(�÷���1, �÷���2, ...)]
VALUES(������1, ������2,....)

INSERT all (���� ������ �Է�)
INTO ���̺�� VALUES(������1, ������2,....)
INTO ���̺�� VALUES(������1, ������2,....)
SELECT   �÷���1,�÷���2,.......
FROM    DUAL;



���� �ٿ��ֱ�
���� ������ ���� ���̺��� �����͸� �Ѳ����� �����Ͽ� �߰�
INSERT
INTO  ���̺��
SELECT   �÷���
FROM    �������̺��
WHERE ���ǽ�

13. rollback, COMMIT

14. sql ���� ���� ���̺��� ��� ���� ��� ���� sql+
select dbms_metadata.get_ddl('TABLE','table name','user') DDL_QUERY from dual;
SELECT DBMS_METADATA.GET_DDL('TABLE','���̺��','���̺������') FROM DUAL;

15. ���� �ε��� �����Ҷ�
 drop index emp3_lastname_idx

16. ���̺� ����� ������� ���̺��� ������ �����ϱ�
CREATE TABLE [���̺��]
AS 
SELECT *
FROM EMP
WHERE 1=2; --���� ����

17. crossjoin�� �ٸ� �̸����� �ϴ� ����
Catesian Product(    CROSS JOIN)

    Ư���� Ű���� ���� SELECT���� FROM ����
    ���̺���� �޸��� �����Ͽ� ���� ���
    ������� �÷��� ���� �� ���̺��� ���� ���� �ǰ�,
    ���ڵ� ���� �� ���̺��� ���� ���� ���
 =   �� ���̺��� ���Ͽ� ��ġ�� Ÿ�� ������ �������� �ҷ��ö� ���

18. Ư���μ��� �μ��ο��� �ο��� group by having ����

SELECT department_id, COUNT(*), sum(salary)
From    employees
Having sum(salary) >= 20000
GROUP BY department_id
ORDER BY department_id


19. ����̺��� ���� �ο��ϴ� �� select ����
    > GRANT [�����̸�] ON [���̺�] TO [���̸�];  
   
    > CONN/ AS SYSDBA
    > GRANT [���̸�] TO [����];
 GRANT UPDATE,DELETE,SELECT ON HR.EMPLOYEES TO BASIC_ROLE;

20. ���ν����� ȣ���Ҽ� �ִ� �͸��� ���ν���,  �� ���ν����� �Լ��� �ٲ�
�͸��� ���ν���
        
        ȣ��
          BEGIN 
          ���ν��� �̸�;
          END;
          /


           CREATE [OR REPLACE] FUNCTION �Լ� �̸�
              [(�Ű�����1 IN|OUT|INOUT ������Ÿ��)
              (�Ű�����2 IN|OUT|INOUT ������Ÿ��)
              .....]
       RETURN ��ȯ������ Ÿ��       
       IS                                --IN �Ѱܹ��� ������
              [���� ����]                 --OUT �Ѱ��� ������
       BEGIN                             --INOUT �Ѵ�
              ó���� ����1
              ó���� ����2
              ....
       RETURN ��ȯ������ ��
       END;
       /

����           VARIABLE �����̸� ������Ÿ��(ũ��);
               EXCUTE:�����̸� := �Լ��̸�
               EXCUTE:�����̸� := �Լ��̸�([�Ű�������])          
�����ǰ� ���   PRINT �����̸�;

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
VARIABLE ��ȭ��ȣ VARCHAR2(20);
EXECUTE:��ȭ��ȣ :=TEL_INFO_F(19991111);
PRINT ��ȭ��ȣ;



21. ����� ���ν����� Ʈ���ſ� ������� �̸� Ȯ���ϱ����ؼ� select ��ɾ� user_ooo�մ�.

    SELECT *
    FROM ALL_OBJECTS --USER_OBJECTS
    WHERE object_type ='PROCEDURE';


     SELECT text 
     FROM USER_SOURCE 
     WHERE name='FORCURSOR_TEST';