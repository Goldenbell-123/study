SELECT * FROM EMPLOYEES;

id, pwd , name, email , gender , phoneNuber;

CREATE TABLE ACORNMEM(
	ID			VARCHAR2(20) PRIMARY KEY,
	PWD			VARCHAR2(20) ,
	NAME		VARCHAR2(20) ,
	EMAIL		VARCHAR2(50) ,
	GENDER		VARCHAR2(10) ,
	PHONENUMBER	VARCHAR2(20)
);

INSERT INTO ACORNMEM VALUES('acorn','acorn','관리자','admin@acorn.com','y','xxx-xxxx-xxxx');

SELECT * FROM ACORNMEM;