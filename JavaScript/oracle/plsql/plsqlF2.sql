--연습문제 9
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
/