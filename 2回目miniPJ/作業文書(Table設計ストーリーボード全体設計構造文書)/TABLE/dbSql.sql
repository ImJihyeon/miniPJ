--------------------------------------------------------
--  ������ ������ - ȭ����-8��-28-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "WWW"."COMMENTS" 
   (	"COMMENTS_NUM" NUMBER, 
	"MENTO_EMAIL" VARCHAR2(30 BYTE), 
	"MEM_EMAIL" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"COMMENTS_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."COMMENTS"."COMMENTS_NUM" IS '�ı��ȣ';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."MENTO_EMAIL" IS '�����̸���';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."MEM_EMAIL" IS 'ȸ���̸���';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."CONTENT" IS '�ı⳻��';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."COMMENTS_DATE" IS '�ۼ���';
 
   COMMENT ON TABLE "WWW"."COMMENTS"  IS '�ı�';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "WWW"."MEMBER" 
   (	"EMAIL" VARCHAR2(30 BYTE), 
	"PWD" VARCHAR2(30 BYTE), 
	"NAME" VARCHAR2(10 BYTE), 
	"HP" VARCHAR2(30 BYTE), 
	"MEMBER_IMG" VARCHAR2(150 BYTE) DEFAULT 'null.png', 
	"MEMBER_GRADE_CODE" VARCHAR2(20 BYTE) DEFAULT 'M01'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."MEMBER"."EMAIL" IS '�̸���';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."PWD" IS '��й�ȣ';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."NAME" IS '�̸�';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."HP" IS '�ڵ�����ȣ';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."MEMBER_IMG" IS '�����ʻ���';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."MEMBER_GRADE_CODE" IS 'ȸ�����';
 
   COMMENT ON TABLE "WWW"."MEMBER"  IS 'ȸ��';
--------------------------------------------------------
--  DDL for Table MEMBER_GRADE_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."MEMBER_GRADE_CODE" 
   (	"GRADE_CODE" VARCHAR2(20 BYTE), 
	"GRADE_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."MEMBER_GRADE_CODE"."GRADE_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON COLUMN "WWW"."MEMBER_GRADE_CODE"."GRADE_NAME" IS '�ڵ��';
 
   COMMENT ON TABLE "WWW"."MEMBER_GRADE_CODE"  IS 'ȸ�����';
--------------------------------------------------------
--  DDL for Table MENTO
--------------------------------------------------------

  CREATE TABLE "WWW"."MENTO" 
   (	"MENTO_EMAIL" VARCHAR2(30 BYTE), 
	"CAREER" VARCHAR2(3000 BYTE), 
	"STAUS_CODE" VARCHAR2(20 BYTE) DEFAULT 'MS01'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."MENTO"."MENTO_EMAIL" IS '�̸���';
 
   COMMENT ON COLUMN "WWW"."MENTO"."CAREER" IS '���+�ڱ�Ұ�';
 
   COMMENT ON COLUMN "WWW"."MENTO"."STAUS_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON TABLE "WWW"."MENTO"  IS '����';
--------------------------------------------------------
--  DDL for Table MENTO_STAUS_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."MENTO_STAUS_CODE" 
   (	"STAUS_CODE" VARCHAR2(20 BYTE), 
	"STAUS_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."MENTO_STAUS_CODE"."STAUS_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON COLUMN "WWW"."MENTO_STAUS_CODE"."STAUS_NAME" IS '�ڵ��';
 
   COMMENT ON TABLE "WWW"."MENTO_STAUS_CODE"  IS '��������ڵ�';
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "WWW"."PAYMENT" 
   (	"STUDY_NUM" NUMBER, 
	"MEM_EMAIL" VARCHAR2(30 BYTE), 
	"PURCHASE_DATE" DATE DEFAULT sysdate, 
	"PAYMENT_PRICE" NUMBER, 
	"PRICE_CODE" VARCHAR2(20 BYTE) DEFAULT 'PAY01'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."PAYMENT"."STUDY_NUM" IS '���͵��ȣ';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."MEM_EMAIL" IS 'ȸ���̸���';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PURCHASE_DATE" IS '������';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PAYMENT_PRICE" IS '��������';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PRICE_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON TABLE "WWW"."PAYMENT"  IS '����';
--------------------------------------------------------
--  DDL for Table PAYMENT_PRICE_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."PAYMENT_PRICE_CODE" 
   (	"PRICE_CODE" VARCHAR2(20 BYTE), 
	"PRICE_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."PAYMENT_PRICE_CODE"."PRICE_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON COLUMN "WWW"."PAYMENT_PRICE_CODE"."PRICE_NAME" IS '�ڵ��';
 
   COMMENT ON TABLE "WWW"."PAYMENT_PRICE_CODE"  IS '���������ڵ�';
--------------------------------------------------------
--  DDL for Table STUDY
--------------------------------------------------------

  CREATE TABLE "WWW"."STUDY" 
   (	"STUDY_NUM" NUMBER, 
	"MENTO_EMAIL" VARCHAR2(30 BYTE), 
	"STUDY_NAME" VARCHAR2(30 BYTE), 
	"STUDY_WRITE" VARCHAR2(3000 BYTE), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"PRICE" NUMBER, 
	"STUDY_SUBJECT_CODE" VARCHAR2(20 BYTE), 
	"STUDY_LEVEL_CODE" VARCHAR2(20 BYTE), 
	"STUDY_LOC_CODE" VARCHAR2(20 BYTE), 
	"STUDY_IMG" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_NUM" IS '���͵��ȣ';
 
   COMMENT ON COLUMN "WWW"."STUDY"."MENTO_EMAIL" IS '�����̸���';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_NAME" IS '����';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_WRITE" IS '�Ұ���';
 
   COMMENT ON COLUMN "WWW"."STUDY"."START_DATE" IS '���۳�¥';
 
   COMMENT ON COLUMN "WWW"."STUDY"."END_DATE" IS '���ᳯ¥';
 
   COMMENT ON COLUMN "WWW"."STUDY"."PRICE" IS '����';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_SUBJECT_CODE" IS '�����ڵ�';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_LEVEL_CODE" IS '���͵𷹺��ڵ�';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_LOC_CODE" IS '������ȣ';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_IMG" IS '���͵����';
 
   COMMENT ON TABLE "WWW"."STUDY"  IS '���͵���';
--------------------------------------------------------
--  DDL for Table STUDY_LEVEL_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."STUDY_LEVEL_CODE" 
   (	"LEVEL_CODE" VARCHAR2(20 BYTE), 
	"LEVEL_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."STUDY_LEVEL_CODE"."LEVEL_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON COLUMN "WWW"."STUDY_LEVEL_CODE"."LEVEL_NAME" IS '�ڵ��';
 
   COMMENT ON TABLE "WWW"."STUDY_LEVEL_CODE"  IS '���͵𷹺�';
--------------------------------------------------------
--  DDL for Table STUDY_LOC_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."STUDY_LOC_CODE" 
   (	"LOC_CODE" VARCHAR2(20 BYTE), 
	"LOC_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."STUDY_LOC_CODE"."LOC_CODE" IS '������ȣ';
 
   COMMENT ON COLUMN "WWW"."STUDY_LOC_CODE"."LOC_NAME" IS '������';
 
   COMMENT ON TABLE "WWW"."STUDY_LOC_CODE"  IS '����';
--------------------------------------------------------
--  DDL for Table STUDY_MEMBER
--------------------------------------------------------

  CREATE TABLE "WWW"."STUDY_MEMBER" 
   (	"MEM_EMAIL" VARCHAR2(30 BYTE), 
	"STUDY_NUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."STUDY_MEMBER"."MEM_EMAIL" IS 'ȸ���̸���';
 
   COMMENT ON COLUMN "WWW"."STUDY_MEMBER"."STUDY_NUM" IS '���͵��ȣ';
 
   COMMENT ON TABLE "WWW"."STUDY_MEMBER"  IS '���͵�ȸ��';
--------------------------------------------------------
--  DDL for Table STUDY_SUBJECT_CODE
--------------------------------------------------------

  CREATE TABLE "WWW"."STUDY_SUBJECT_CODE" 
   (	"SUBJECT_CODE" VARCHAR2(20 BYTE), 
	"SUBJECT_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."STUDY_SUBJECT_CODE"."SUBJECT_CODE" IS '�ڵ��ȣ';
 
   COMMENT ON COLUMN "WWW"."STUDY_SUBJECT_CODE"."SUBJECT_NAME" IS '�ڵ��';
 
   COMMENT ON TABLE "WWW"."STUDY_SUBJECT_CODE"  IS '�����ڵ�';
--------------------------------------------------------
--  DDL for Table WISHLIST
--------------------------------------------------------

  CREATE TABLE "WWW"."WISHLIST" 
   (	"MEM_EMAIL" VARCHAR2(30 BYTE), 
	"STUDY_NUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "WWW"."WISHLIST"."MEM_EMAIL" IS 'ȸ���̸���';
 
   COMMENT ON COLUMN "WWW"."WISHLIST"."STUDY_NUM" IS '���͵��ȣ';
 
   COMMENT ON TABLE "WWW"."WISHLIST"  IS '����';
REM INSERTING into WWW.COMMENTS
SET DEFINE OFF;
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (51,'dyddydwnrrptwl@gmail.com','yongyong@gmail.com','����� �׵��� ��������̽��ϴ�.',to_date('18/08/28','RR/MM/DD'));
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (49,'dyddydwnrrptwl@gmail.com','skyyao@daum.net','����� ������ �ʹ� �������� �ʰ� �����Ⱑ ���Ҿ��.',to_date('18/08/28','RR/MM/DD'));
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (50,'dyddydwnrrptwl@gmail.com','hello111@naver.com','����� ������ �ʹ� ģ���ϰ� ���ذ� �Ǽ� ����־����.',to_date('18/08/28','RR/MM/DD'));
REM INSERTING into WWW.MEMBER
SET DEFINE OFF;
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('jisuhyn94@naver.com','www1004','������','010-9968-4491','studyImg2.jpg','M00');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('kim55182000@naver.com','1234','�質��','010-1234-1111','kimtaehee.jpg','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('skyyao@daum.net','dfd12313','���ϴ�','010-1245-1321','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yongyong@gmail.com','456431','���','010-4864-4231','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hello111@naver.com','we45312','�̿���','010-5365-1387','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ejrqhrdl22@hotmail.com','erv154','��ö��','010-5547-4125','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ahdxoddl156@gmail.com','1212213f','����ȭ','010-5174-1445','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yoloyolo77@naver.com','drer1222','�Ѽ���','010-5177-5517','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dyddydwnrrptwl@gmail.com','112sdlrer','���곪','010-1578-4522','bang1.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hong23441@gmail.com','honghong','ȫ����','010-7548-6887','a4a9064a2c6748d6b028ee7627e4b0a4.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('vndue@naver.com','enoughefe','���伷','010-7541-1122','2016111420365314485_1.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hollywow@gmail.com','ejkfjnv333','�۾Ƹ�','010-7417-1247','649_467x700.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dhffofp@gmail.com','irnvnnj2','�赿��','010-6721-2121','kentyann.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dfinvo2@naver.com','vidno2','�����','010-5478-1248','parkbo.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('znjflan33@naver.com','fivnke','������','010-2118-1257','isdijf.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ghdgheii@gmail.com','eifnvds1','��ä��','010-1244-4124','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('gy7ivn22k@hotmail.com','dirnibib1','������','010-1575-2571','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('bbuuk98@daum.net','vmfhrmfoa2','�����','010-5715-1200','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('zeifbbb@naver.com','dkffkqy9','������','010-7789-7511','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('lokjkvv2@daum.net','fkfjfhh22','����ȣ','010-9981-5475','447805_99153_310.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cjftn77@naver.com','eiribn3i','������','010-2777-1057','leejaehun.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ppopo6@gmail.com','cpdnrlti6','���ϴ�','010-5711-2088','yeona.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yeon222@naver.com','vu2kfnn','����ȣ','010-2078-1889','parkbo.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('iknmbie9@gmail.com','4ognblwld','�̾ƶ�','010-6530-5721','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('javamento@naver.com','test1234','�ڹٸ���','010-1114-7544','99875C355A3F52EF27.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cmento@naver.com','test1234','������','010-7214-1877','pi2.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cpmento@naver.com','test1234','�����ø���','010-7516-5788','joyin.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('jisuhyn@naver.com','aaaaaaaa','������','010-1234-1111','im.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ji@gmail.com','1004','�ȳ�','010-1234-7896','4.jpg','M01');
REM INSERTING into WWW.MEMBER_GRADE_CODE
SET DEFINE OFF;
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M00','������');
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M01','�Ϲ�ȸ��');
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M02','����');
REM INSERTING into WWW.MENTO
SET DEFINE OFF;
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('javamento@naver.com','�ڹٸ����Դϴ�. ��̰� �ڹٸ� �����Ŀ�. ���� �Բ���� �����̵� �� �� �ֽ��ϴ�!','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cmento@naver.com','C�����Դϴ�. �ų��� C�� �����Ŀ�. ����� �Բ� �н��ϴ� C���͵� �����մϴ�.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cpmento@naver.com','C++�����Դϴ�. �ؿܿ��� �����ڷ� 10�� ���� �ٹ��� �߰� ����� �ѱ����� Ȱ�� ���Դϴ�. ������ ������ ����ֽ��ϴ�.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dyddydwnrrptwl@gmail.com','���� �ǹ� 10�� ����� ���� �ְ� ����� �ڵ� ���� ���ַ� ��Ȱ�� �ϰ� �ֽ��ϴ�. �ڵ��� ���� ����ְ� �˷������. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('hong23441@gmail.com','���߻Ӹ� �ƴ϶� ȸ�� ��Ȱ���� ������ �� �� �ִ� ��� ���� �����. ���� �Բ� �غ�����. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('vndue@naver.com','�̱� �Ǹ��� �븮���� �����ڷ� ���� �߰� ����� ���������� �ٰ� �ֽ��ϴ�. ���� ������ ���� ������ �׸�ŭ ��ſ� ���� �ڵ��� �� �����ϴ�. ������ �Բ� �Ұſ���. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('hollywow@gmail.com','���� �����鿡�� �����ڷ� ������ ����� ���������� ��Ȱ�ϰ� �ֽ��ϴ�. ���߿� ���� ������ �ʿ��ϴٸ� ������ ������ �ּ���. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dhffofp@gmail.com','������ ���� �������. ����������� �ڵ� ����� ������ ������ ������ �Ǿ����ϴ�. �ڵ� õ��� �Բ� ���͵� �غ�����. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dfinvo2@naver.com','�ڵ��� �Բ� ���� ����� �߿��ϴٰ� �����մϴ�. �� ���õ� ȸ�縦 ������ �� ���� �Բ� �� ���ᰡ ���������� �ֿ켱�߽��ϴ�. ���� ȸ�� ������ ���� �˰� �־��. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('znjflan33@naver.com','������ ����� �Ѵٸ� ��� �� �ִ°� �ڵ��̿���. �������ڷ� ���α׷����� ���������� ���ݱ��� ������ �԰� ��� �ֽ��ϴ�. �������� �ƹ��͵� �̱� �� �����. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('lokjkvv2@daum.net','�����ڷ� ��ƿ��� ��� 20��, ������ ô �ϸ� ô�Դϴ�. ���͵� ���� ���� ģ���鿡�� ���� ������ �����ϰ� �;��. ȭ����!','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cjftn77@naver.com','��̰� �ڵ��� �մϴ�. ���� ���� ���� ���� �����ϸ� ��Ȱ�ϰ� �ֽ��ϴ�.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('ppopo6@gmail.com','�׸����� �׷����鼭 �ڵ��� ������ϴ�. ȿ���� �������� ���� �����󱸿�! �����е� �Բ� �ؿ�. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('yeon222@naver.com','��ŸƮ�� â���� ���� �ڵ��� �����߽��ϴ�. ��ŸƮ���� ���� ���� ������ �帱 �� �־��. ','MS00');
REM INSERTING into WWW.MENTO_STAUS_CODE
SET DEFINE OFF;
Insert into WWW.MENTO_STAUS_CODE (STAUS_CODE,STAUS_NAME) values ('MS00','����');
Insert into WWW.MENTO_STAUS_CODE (STAUS_CODE,STAUS_NAME) values ('MS01','�����û');
REM INSERTING into WWW.PAYMENT
SET DEFINE OFF;
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (30,'kim55182000@naver.com',to_date('18/08/27','RR/MM/DD'),17000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (30,'jisuhyn@naver.com',to_date('18/08/28','RR/MM/DD'),17000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (30,'ji@gmail.com',to_date('18/08/28','RR/MM/DD'),17000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (30,'cpmento@naver.com',to_date('18/08/28','RR/MM/DD'),17000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (68,'kim55182000@naver.com',to_date('18/08/27','RR/MM/DD'),30000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (68,'skyyao@daum.net',to_date('18/08/28','RR/MM/DD'),30000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (68,'yongyong@gmail.com',to_date('18/08/28','RR/MM/DD'),30000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (68,'hello111@naver.com',to_date('18/08/28','RR/MM/DD'),30000,'PAY01');
Insert into WWW.PAYMENT (STUDY_NUM,MEM_EMAIL,PURCHASE_DATE,PAYMENT_PRICE,PRICE_CODE) values (67,'ejrqhrdl22@hotmail.com',to_date('18/08/28','RR/MM/DD'),25000,'PAY01');
REM INSERTING into WWW.PAYMENT_PRICE_CODE
SET DEFINE OFF;
Insert into WWW.PAYMENT_PRICE_CODE (PRICE_CODE,PRICE_NAME) values ('PAY00','�������');
Insert into WWW.PAYMENT_PRICE_CODE (PRICE_CODE,PRICE_NAME) values ('PAY01','�����Ϸ�');
REM INSERTING into WWW.STUDY
SET DEFINE OFF;
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (39,'lokjkvv2@daum.net','����ְ� ��ſ� C++ ���͵�','C++�� ��ƴٰ� �������� ������. �׸����� �����ϴ� ���͵� �� �� �ֳ���? ���� ��� �н������� ���ظ� �켱���� ���� ���� �ʴ� ���͵� �����մϴ�. ���� �����ϼ���!',to_date('19/02/01','RR/MM/DD'),to_date('19/02/28','RR/MM/DD'),21000,'P03','SL02','GN','coding5.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (30,'dyddydwnrrptwl@gmail.com','�ǽ����� ���� �ڹ� ���͵�
','�ǽ����� ���� �ڹ� ���͵�	�ǽ��� �������� �߿��ϴٴ� ���� �˰� �ֽ��ϴ�. �׷��ٰ� ������ �������� �ʾƿ�! �ǽ��� ����, �θ��� �䳢�� ��� �ڹٸ� ���������.',to_date('18/10/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),17000,'P01','SL01','HD','coding4.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (31,'dyddydwnrrptwl@gmail.com','�ڹٷ� ��� �ڵ�','�ڹٴ� ���� �츮���󿡼� ���� ���� ���̰� �ִ� ����Դϴ�. �ڹٷ� �����ϸ� �����̵� ����� �����ſ���! ���� �Բ� ���� ���� �����ϼ���. ',to_date('18/08/30','RR/MM/DD'),to_date('18/09/10','RR/MM/DD'),23000,'P01','SL02','SC','coding3.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (40,'lokjkvv2@daum.net','C �̴� ������Ʈ ','C�� ���� ������ �̴� ������Ʈ�� ��������. ���丸 �ƴ� �ͺ��� �ξ� ������� �͵��� �����ſ���. ',to_date('19/03/01','RR/MM/DD'),to_date('19/04/30','RR/MM/DD'),24000,'P02','SL03','NW','coding6.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (41,'lokjkvv2@daum.net','ȥ�ڼ��� ���� ������ C','���͵� �Ŀ��� ȥ�ڼ� C�� �н��� �� �ֵ��� �ڱ��ֵ��н� ���͵� �����մϴ�. ���� ���ִ� ������ ���� �Ϸ簡 �ٸ��� �þ�� �ڽ��� �Ƿ¿� ����� ����������!',to_date('19/06/01','RR/MM/DD'),to_date('19/08/01','RR/MM/DD'),30000,'P02','SL01','GD','codingGenius.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (50,'cjftn77@naver.com','����� �Բ� �ڹٸ� ���','���� �Բ� �ڹٸ� ��ƺ�����. ���峭 �����ôٱ���? �ƴմϴ�. �ڹٸ� ������ ��� �� �� �� �־��! �������Դϴ�. ',to_date('19/02/01','RR/MM/DD'),to_date('19/04/30','RR/MM/DD'),19000,'P01','SL02','BD','matrix.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (51,'cjftn77@naver.com','�ڹٿ� �Բ���� ���� �Ҽ��־�','��ü�������� ������ �ڹٸ� �����ϼ���. �ڹٿ� �Բ���� �ؿ� ���⵵ ����� �ʾƿ�! ���� ���� �н��� �ʿ��ϰ����� ���� �Բ� ���͵� �Ѵٸ� ���� ����� ���� �ƴմϴ�. ',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),23000,'P01','SL02','AY','study2.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (53,'ppopo6@gmail.com','�ڹ��� ���� ���͵�','�� �� �ȿ� �ڹ��� ���� å �� ���� �������غ�����. ���� ���뽺�������� ���� �Ұ����� ���� �ƴ϶��ϴ�. ���� �Բ�����!',to_date('19/01/01','RR/MM/DD'),to_date('19/01/31','RR/MM/DD'),20000,'P01','SL01','IS','study3.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (54,'ppopo6@gmail.com','�߱��ڸ� ���� C ���͵�','C���� ������ ������ ������ ���� �� �ʿ��մϴ�. ������ �������� ���� �� ���� ����, C���� �Բ� �ϼ���.',to_date('19/03/01','RR/MM/DD'),to_date('19/05/01','RR/MM/DD'),24000,'P02','SL02','GN','study5.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (59,'yeon222@naver.com','C �߱� ���͵� ','C���� ���� ���� �԰� �ֽ��ϴ�. C�� ���� ��� ���� ������ �ִ� �л��鿡�� ���� ���� �ִ� ��� ������ ������ �帱�Կ�, ���� �Բ� �ϼ���!',to_date('19/05/01','RR/MM/DD'),to_date('19/05/31','RR/MM/DD'),15000,'P02','SL02','NW','study4.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (60,'yeon222@naver.com','��? C++�� ���� �����ٰ�?','�ǹ� 20��, ���� ���α׷��Ӱ� �ʺ��ڸ� ���� ������! ���� �˷��ִ� C++ ���͵�� �Բ� �ڵ��� �����ϼ���!',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),13000,'P03','SL01','GN','study6.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (61,'yeon222@naver.com','���� C ���α׷����� �⺻','�ǹ� 20��, ���� ���α׷��Ӱ� �ʺ��ڸ� ���� ������! �ǹ����� ����ϰ� ���̴� ����鸸 �н��ϼ���. ',to_date('18/12/01','RR/MM/DD'),to_date('19/01/01','RR/MM/DD'),16000,'P02','SL00','GD','study7.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (66,'javamento@naver.com','�ڹٸ����� ��ſ� �ڹ�','�ڹ�(Java)�� C++���� �޸� ó������ ��ü ���� ���� ���ߵ� ���α׷��� ����Դϴ�. �ڹٴ� �ڹ� ���� �ӽ�(JVM)�� ����Ͽ� ��� �ü�������� ���� ���·� ����� �� �ֽ��ϴ�. ���� ���� �ڹٴ� �� ���迡�� ���� ���� ����ϴ� ���α׷��� ��� �� �ϳ��Դϴ�. �ڹ� ����� �Բ� ��̰� �ڵ��� ��� �Թ��غ�����!',to_date('18/11/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),18000,'P01','SL00','HD','coding.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (67,'javamento@naver.com','�ڹٸ����� �ų��� �ڹ�','�ڹ�(Java)�� C++���� �޸� ó������ ��ü ���� ���� ���ߵ� ���α׷��� ����Դϴ�. �ڹٴ� �ڹ� ���� �ӽ�(JVM)�� ����Ͽ� ��� �ü�������� ���� ���·� ����� �� �ֽ��ϴ�. ���� ���� �ڹٴ� �� ���迡�� ���� ���� ����ϴ� ���α׷��� ��� �� �ϳ��Դϴ�.  �ڹ��� ��� ���ٸ� ���� ���� �ڹٸ� �º��߰���. �ڹ� ����� �Բ� �ų��� �ڹٸ� �����غ�����!',to_date('19/01/01','RR/MM/DD'),to_date('19/02/28','RR/MM/DD'),25000,'P01','SL01','HD','study1.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (68,'javamento@naver.com','�ڹٸ����� Ȱ���� �ڹ� ���','�ڹ� ������ ��� ���� �˰����� �ǹ� ������ �� �ȴٸ�? ���� �Բ� ���͵� �����ϼ���! ���� ������ �ڹٷ� ���� �̴� ������Ʈ�� ����ϴ�. ��Ʈ ������ ������ �Բ� �ǹ� ���赵 �׾ư��� �ϼ� ������ ��ȸ�� �� ���Դϴ�. ��ġ�� ������!',to_date('19/03/01','RR/MM/DD'),to_date('19/05/01','RR/MM/DD'),30000,'P01','SL03','GN','studyTeacher.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (69,'cmento@naver.com','C �Թ� ���͵� ','C���� �ý��� ���α׷��ֿ� ���� �� ��︮����, ���� ���α׷��ֿ��� ���� ���Ǵ� ���α׷��� ����Դϴ�. C���� �ڵ��� ������ �Բ� �ϼ���. ',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),27000,'P02','SL00','GN','coding2.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (70,'cmento@naver.com','�������� �Բ� �ϴ� C ���͵� ','������ �ִٸ� C�� ����� �ʾƿ�! �� ����� �Բ� �ϼ���. ',to_date('19/02/01','RR/MM/DD'),to_date('19/02/08','RR/MM/DD'),21000,'P02','SL01','GN','study8.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (71,'cpmento@naver.com','�ܱ���ó�� ���� C++','�����ڷμ� ���� �ؿ� ������ ���� C++�� ����Ĩ�ϴ�. �ؿ� ����� ������ �ְ� C++�� ������� ������ �е��� ���� �����غ�����.',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),22000,'P02','SL01','HD','studyTeacher2.jpg');
REM INSERTING into WWW.STUDY_LEVEL_CODE
SET DEFINE OFF;
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL00','�Թ�');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL01','�ʱ�');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL02','�߱�');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL03','���');
REM INSERTING into WWW.STUDY_LOC_CODE
SET DEFINE OFF;
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('SC','����');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('HD','ȫ��');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('GN','����');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('NW','���');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('GD','�Ǵ�');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('BD','�д�');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('AY','�Ⱦ�');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('IS','�ϻ�');
REM INSERTING into WWW.STUDY_MEMBER
SET DEFINE OFF;
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('cpmento@naver.com',30);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('ejrqhrdl22@hotmail.com',67);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('hello111@naver.com',68);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('ji@gmail.com',30);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('jisuhyn@naver.com',30);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('kim55182000@naver.com',30);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('kim55182000@naver.com',68);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('skyyao@daum.net',68);
Insert into WWW.STUDY_MEMBER (MEM_EMAIL,STUDY_NUM) values ('yongyong@gmail.com',68);
REM INSERTING into WWW.STUDY_SUBJECT_CODE
SET DEFINE OFF;
Insert into WWW.STUDY_SUBJECT_CODE (SUBJECT_CODE,SUBJECT_NAME) values ('P01','JAVA');
Insert into WWW.STUDY_SUBJECT_CODE (SUBJECT_CODE,SUBJECT_NAME) values ('P02','C');
Insert into WWW.STUDY_SUBJECT_CODE (SUBJECT_CODE,SUBJECT_NAME) values ('P03','C++');
REM INSERTING into WWW.WISHLIST
SET DEFINE OFF;
Insert into WWW.WISHLIST (MEM_EMAIL,STUDY_NUM) values ('kim55182000@naver.com',50);
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_MEMBER" ON "WWW"."MEMBER" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER_GRADE_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_MEMBER_GRADE_CODE" ON "WWW"."MEMBER_GRADE_CODE" ("GRADE_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_MENTO" ON "WWW"."MENTO" ("MENTO_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MENTO_STAUS_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_MENTO_STAUS_CODE" ON "WWW"."MENTO_STAUS_CODE" ("STAUS_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PAYMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_PAYMENT" ON "WWW"."PAYMENT" ("STUDY_NUM", "MEM_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PAYMENT_PRICE_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_PAYMENT_PRICE_CODE" ON "WWW"."PAYMENT_PRICE_CODE" ("PRICE_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_STUDY
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_STUDY" ON "WWW"."STUDY" ("STUDY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_STUDY_LEVEL_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_STUDY_LEVEL_CODE" ON "WWW"."STUDY_LEVEL_CODE" ("LEVEL_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_STUDY_LOC_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_STUDY_LOC_CODE" ON "WWW"."STUDY_LOC_CODE" ("LOC_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_STUDY_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_STUDY_MEMBER" ON "WWW"."STUDY_MEMBER" ("MEM_EMAIL", "STUDY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_STUDY_SUBJECT_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_STUDY_SUBJECT_CODE" ON "WWW"."STUDY_SUBJECT_CODE" ("SUBJECT_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_WISHLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "WWW"."PK_WISHLIST" ON "WWW"."WISHLIST" ("MEM_EMAIL", "STUDY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRIGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "WWW"."COMMENTS_TRIGER" 
   before insert on "WWW"."COMMENTS" 
   for each row 
begin  
   if inserting then 
      if :NEW."COMMENTS_NUM" is null then 
         select COMENTS_SEQ.nextval into :NEW."COMMENTS_NUM" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "WWW"."COMMENTS_TRIGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDY_TRIGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "WWW"."STUDY_TRIGER" 
   before insert on "WWW"."STUDY" 
   for each row 
begin  
   if inserting then 
      if :NEW."STUDY_NUM" is null then 
         select STUDY_SEQ.nextval into :NEW."STUDY_NUM" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "WWW"."STUDY_TRIGER" ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "WWW"."COMMENTS" MODIFY ("COMMENTS_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."COMMENTS" MODIFY ("MENTO_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."COMMENTS" MODIFY ("MEM_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."COMMENTS" MODIFY ("CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."COMMENTS" MODIFY ("COMMENTS_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "WWW"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("PWD" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("HP" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("MEMBER_GRADE_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER" MODIFY ("MEMBER_IMG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_GRADE_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."MEMBER_GRADE_CODE" ADD CONSTRAINT "PK_MEMBER_GRADE_CODE" PRIMARY KEY ("GRADE_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."MEMBER_GRADE_CODE" MODIFY ("GRADE_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MEMBER_GRADE_CODE" MODIFY ("GRADE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENTO
--------------------------------------------------------

  ALTER TABLE "WWW"."MENTO" ADD CONSTRAINT "PK_MENTO" PRIMARY KEY ("MENTO_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."MENTO" MODIFY ("MENTO_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MENTO" MODIFY ("CAREER" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."MENTO" MODIFY ("STAUS_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENTO_STAUS_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."MENTO_STAUS_CODE" ADD CONSTRAINT "PK_MENTO_STAUS_CODE" PRIMARY KEY ("STAUS_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."MENTO_STAUS_CODE" MODIFY ("STAUS_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "WWW"."PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("STUDY_NUM", "MEM_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."PAYMENT" MODIFY ("STUDY_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."PAYMENT" MODIFY ("MEM_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."PAYMENT" MODIFY ("PURCHASE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."PAYMENT" MODIFY ("PAYMENT_PRICE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."PAYMENT" MODIFY ("PRICE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT_PRICE_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."PAYMENT_PRICE_CODE" ADD CONSTRAINT "PK_PAYMENT_PRICE_CODE" PRIMARY KEY ("PRICE_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."PAYMENT_PRICE_CODE" MODIFY ("PRICE_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."PAYMENT_PRICE_CODE" MODIFY ("PRICE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDY
--------------------------------------------------------

  ALTER TABLE "WWW"."STUDY" ADD CONSTRAINT "PK_STUDY" PRIMARY KEY ("STUDY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("MENTO_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_WRITE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("START_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("END_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("PRICE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_SUBJECT_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_LEVEL_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_LOC_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY" MODIFY ("STUDY_IMG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDY_LEVEL_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."STUDY_LEVEL_CODE" ADD CONSTRAINT "PK_STUDY_LEVEL_CODE" PRIMARY KEY ("LEVEL_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."STUDY_LEVEL_CODE" MODIFY ("LEVEL_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY_LEVEL_CODE" MODIFY ("LEVEL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDY_LOC_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."STUDY_LOC_CODE" ADD CONSTRAINT "PK_STUDY_LOC_CODE" PRIMARY KEY ("LOC_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."STUDY_LOC_CODE" MODIFY ("LOC_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY_LOC_CODE" MODIFY ("LOC_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDY_MEMBER
--------------------------------------------------------

  ALTER TABLE "WWW"."STUDY_MEMBER" ADD CONSTRAINT "PK_STUDY_MEMBER" PRIMARY KEY ("MEM_EMAIL", "STUDY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."STUDY_MEMBER" MODIFY ("MEM_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY_MEMBER" MODIFY ("STUDY_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDY_SUBJECT_CODE
--------------------------------------------------------

  ALTER TABLE "WWW"."STUDY_SUBJECT_CODE" ADD CONSTRAINT "PK_STUDY_SUBJECT_CODE" PRIMARY KEY ("SUBJECT_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."STUDY_SUBJECT_CODE" MODIFY ("SUBJECT_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."STUDY_SUBJECT_CODE" MODIFY ("SUBJECT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WISHLIST
--------------------------------------------------------

  ALTER TABLE "WWW"."WISHLIST" ADD CONSTRAINT "PK_WISHLIST" PRIMARY KEY ("MEM_EMAIL", "STUDY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "WWW"."WISHLIST" MODIFY ("MEM_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "WWW"."WISHLIST" MODIFY ("STUDY_NUM" NOT NULL ENABLE);
