

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
        WHERE   Q_NO =4


13. ������ 1 ����
CREATE SEQUENCE   "ID_NO_SEQ"  
MINVALUE 1 
MAXVALUE 99999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE  
NOORDER  
NOCYCLE ;
