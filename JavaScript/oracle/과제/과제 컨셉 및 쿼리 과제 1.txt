

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
        WHERE   Q_NO =4


13. 시퀀스 1 생성
CREATE SEQUENCE   "ID_NO_SEQ"  
MINVALUE 1 
MAXVALUE 99999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE  
NOORDER  
NOCYCLE ;
