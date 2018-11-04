--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-28-2018   
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
 

   COMMENT ON COLUMN "WWW"."COMMENTS"."COMMENTS_NUM" IS '후기번호';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."MENTO_EMAIL" IS '멘토이메일';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."MEM_EMAIL" IS '회원이메일';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."CONTENT" IS '후기내용';
 
   COMMENT ON COLUMN "WWW"."COMMENTS"."COMMENTS_DATE" IS '작성일';
 
   COMMENT ON TABLE "WWW"."COMMENTS"  IS '후기';
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
 

   COMMENT ON COLUMN "WWW"."MEMBER"."EMAIL" IS '이메일';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."PWD" IS '비밀번호';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."NAME" IS '이름';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."HP" IS '핸드폰번호';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."MEMBER_IMG" IS '프로필사진';
 
   COMMENT ON COLUMN "WWW"."MEMBER"."MEMBER_GRADE_CODE" IS '회원등급';
 
   COMMENT ON TABLE "WWW"."MEMBER"  IS '회원';
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
 

   COMMENT ON COLUMN "WWW"."MEMBER_GRADE_CODE"."GRADE_CODE" IS '코드번호';
 
   COMMENT ON COLUMN "WWW"."MEMBER_GRADE_CODE"."GRADE_NAME" IS '코드명';
 
   COMMENT ON TABLE "WWW"."MEMBER_GRADE_CODE"  IS '회원등급';
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
 

   COMMENT ON COLUMN "WWW"."MENTO"."MENTO_EMAIL" IS '이메일';
 
   COMMENT ON COLUMN "WWW"."MENTO"."CAREER" IS '경력+자기소개';
 
   COMMENT ON COLUMN "WWW"."MENTO"."STAUS_CODE" IS '코드번호';
 
   COMMENT ON TABLE "WWW"."MENTO"  IS '멘토';
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
 

   COMMENT ON COLUMN "WWW"."MENTO_STAUS_CODE"."STAUS_CODE" IS '코드번호';
 
   COMMENT ON COLUMN "WWW"."MENTO_STAUS_CODE"."STAUS_NAME" IS '코드명';
 
   COMMENT ON TABLE "WWW"."MENTO_STAUS_CODE"  IS '멘토상태코드';
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
 

   COMMENT ON COLUMN "WWW"."PAYMENT"."STUDY_NUM" IS '스터디번호';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."MEM_EMAIL" IS '회원이메일';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PURCHASE_DATE" IS '구매일';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PAYMENT_PRICE" IS '결제가격';
 
   COMMENT ON COLUMN "WWW"."PAYMENT"."PRICE_CODE" IS '코드번호';
 
   COMMENT ON TABLE "WWW"."PAYMENT"  IS '결제';
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
 

   COMMENT ON COLUMN "WWW"."PAYMENT_PRICE_CODE"."PRICE_CODE" IS '코드번호';
 
   COMMENT ON COLUMN "WWW"."PAYMENT_PRICE_CODE"."PRICE_NAME" IS '코드명';
 
   COMMENT ON TABLE "WWW"."PAYMENT_PRICE_CODE"  IS '결제상태코드';
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
 

   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_NUM" IS '스터디번호';
 
   COMMENT ON COLUMN "WWW"."STUDY"."MENTO_EMAIL" IS '멘토이메일';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_NAME" IS '제목';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_WRITE" IS '소개글';
 
   COMMENT ON COLUMN "WWW"."STUDY"."START_DATE" IS '시작날짜';
 
   COMMENT ON COLUMN "WWW"."STUDY"."END_DATE" IS '종료날짜';
 
   COMMENT ON COLUMN "WWW"."STUDY"."PRICE" IS '가격';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_SUBJECT_CODE" IS '과목코드';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_LEVEL_CODE" IS '스터디레벨코드';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_LOC_CODE" IS '지역번호';
 
   COMMENT ON COLUMN "WWW"."STUDY"."STUDY_IMG" IS '스터디사진';
 
   COMMENT ON TABLE "WWW"."STUDY"  IS '스터디목록';
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
 

   COMMENT ON COLUMN "WWW"."STUDY_LEVEL_CODE"."LEVEL_CODE" IS '코드번호';
 
   COMMENT ON COLUMN "WWW"."STUDY_LEVEL_CODE"."LEVEL_NAME" IS '코드명';
 
   COMMENT ON TABLE "WWW"."STUDY_LEVEL_CODE"  IS '스터디레벨';
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
 

   COMMENT ON COLUMN "WWW"."STUDY_LOC_CODE"."LOC_CODE" IS '지역번호';
 
   COMMENT ON COLUMN "WWW"."STUDY_LOC_CODE"."LOC_NAME" IS '지역명';
 
   COMMENT ON TABLE "WWW"."STUDY_LOC_CODE"  IS '지역';
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
 

   COMMENT ON COLUMN "WWW"."STUDY_MEMBER"."MEM_EMAIL" IS '회원이메일';
 
   COMMENT ON COLUMN "WWW"."STUDY_MEMBER"."STUDY_NUM" IS '스터디번호';
 
   COMMENT ON TABLE "WWW"."STUDY_MEMBER"  IS '스터디회원';
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
 

   COMMENT ON COLUMN "WWW"."STUDY_SUBJECT_CODE"."SUBJECT_CODE" IS '코드번호';
 
   COMMENT ON COLUMN "WWW"."STUDY_SUBJECT_CODE"."SUBJECT_NAME" IS '코드명';
 
   COMMENT ON TABLE "WWW"."STUDY_SUBJECT_CODE"  IS '과목코드';
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
 

   COMMENT ON COLUMN "WWW"."WISHLIST"."MEM_EMAIL" IS '회원이메일';
 
   COMMENT ON COLUMN "WWW"."WISHLIST"."STUDY_NUM" IS '스터디번호';
 
   COMMENT ON TABLE "WWW"."WISHLIST"  IS '찜목록';
REM INSERTING into WWW.COMMENTS
SET DEFINE OFF;
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (51,'dyddydwnrrptwl@gmail.com','yongyong@gmail.com','멘토님 그동안 고생많으셨습니다.',to_date('18/08/28','RR/MM/DD'));
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (49,'dyddydwnrrptwl@gmail.com','skyyao@daum.net','멘토님 수업이 너무 지루하지 않고 분위기가 좋았어요.',to_date('18/08/28','RR/MM/DD'));
Insert into WWW.COMMENTS (COMMENTS_NUM,MENTO_EMAIL,MEM_EMAIL,CONTENT,COMMENTS_DATE) values (50,'dyddydwnrrptwl@gmail.com','hello111@naver.com','멘토님 설명이 너무 친절하고 이해가 되서 재미있었어요.',to_date('18/08/28','RR/MM/DD'));
REM INSERTING into WWW.MEMBER
SET DEFINE OFF;
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('jisuhyn94@naver.com','www1004','관리자','010-9968-4491','studyImg2.jpg','M00');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('kim55182000@naver.com','1234','김나나','010-1234-1111','kimtaehee.jpg','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('skyyao@daum.net','dfd12313','이하늘','010-1245-1321','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yongyong@gmail.com','456431','용용','010-4864-4231','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hello111@naver.com','we45312','이연경','010-5365-1387','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ejrqhrdl22@hotmail.com','erv154','박철수','010-5547-4125','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ahdxoddl156@gmail.com','1212213f','이일화','010-5174-1445','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yoloyolo77@naver.com','drer1222','한송이','010-5177-5517','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dyddydwnrrptwl@gmail.com','112sdlrer','수산나','010-1578-4522','bang1.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hong23441@gmail.com','honghong','홍연선','010-7548-6887','a4a9064a2c6748d6b028ee7627e4b0a4.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('vndue@naver.com','enoughefe','변요섭','010-7541-1122','2016111420365314485_1.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('hollywow@gmail.com','ejkfjnv333','송아림','010-7417-1247','649_467x700.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dhffofp@gmail.com','irnvnnj2','김동균','010-6721-2121','kentyann.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('dfinvo2@naver.com','vidno2','서상범','010-5478-1248','parkbo.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('znjflan33@naver.com','fivnke','오우진','010-2118-1257','isdijf.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ghdgheii@gmail.com','eifnvds1','박채원','010-1244-4124','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('gy7ivn22k@hotmail.com','dirnibib1','신재은','010-1575-2571','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('bbuuk98@daum.net','vmfhrmfoa2','김수연','010-5715-1200','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('zeifbbb@naver.com','dkffkqy9','진선애','010-7789-7511','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('lokjkvv2@daum.net','fkfjfhh22','수영호','010-9981-5475','447805_99153_310.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cjftn77@naver.com','eiribn3i','동수림','010-2777-1057','leejaehun.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ppopo6@gmail.com','cpdnrlti6','김하늘','010-5711-2088','yeona.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('yeon222@naver.com','vu2kfnn','연정호','010-2078-1889','parkbo.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('iknmbie9@gmail.com','4ognblwld','이아람','010-6530-5721','null.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('javamento@naver.com','test1234','자바멘토','010-1114-7544','99875C355A3F52EF27.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cmento@naver.com','test1234','씨멘토','010-7214-1877','pi2.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('cpmento@naver.com','test1234','씨플플멘토','010-7516-5788','joyin.jpg','M02');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('jisuhyn@naver.com','aaaaaaaa','임지현','010-1234-1111','im.png','M01');
Insert into WWW.MEMBER (EMAIL,PWD,NAME,HP,MEMBER_IMG,MEMBER_GRADE_CODE) values ('ji@gmail.com','1004','안녕','010-1234-7896','4.jpg','M01');
REM INSERTING into WWW.MEMBER_GRADE_CODE
SET DEFINE OFF;
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M00','관리자');
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M01','일반회원');
Insert into WWW.MEMBER_GRADE_CODE (GRADE_CODE,GRADE_NAME) values ('M02','멘토');
REM INSERTING into WWW.MENTO
SET DEFINE OFF;
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('javamento@naver.com','자바멘토입니다. 즐겁게 자바를 가르쳐요. 저와 함께라면 무엇이든 할 수 있습니다!','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cmento@naver.com','C멘토입니다. 신나게 C를 가르쳐요. 개념과 함께 학습하는 C스터디를 진행합니다.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cpmento@naver.com','C++멘토입니다. 해외에서 개발자로 10년 동안 근무를 했고 현재는 한국에서 활동 중입니다. 개발이 아직도 재미있습니다.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dyddydwnrrptwl@gmail.com','개발 실무 10년 경력을 갖고 있고 현재는 코딩 수업 위주로 생활을 하고 있습니다. 코딩을 쉽고 재미있게 알려드려요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('hong23441@gmail.com','개발뿐만 아니라 회사 생활에도 도움이 될 수 있는 취업 팁을 드려요. 저와 함께 해보세요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('vndue@naver.com','미국 실리콘 밸리에서 개발자로 일을 했고 현재는 프리랜서를 뛰고 있습니다. 배우면 배울수록 끝이 없지만 그만큼 즐거운 것이 코딩인 것 같습니다. 끝까지 함께 할거에요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('hollywow@gmail.com','국내 대기업들에서 개발자로 시작해 현재는 프리랜서로 생활하고 있습니다. 개발에 대한 조언이 필요하다면 저에게 연락을 주세요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dhffofp@gmail.com','개발이 가장 쉬웠어요. 어렸을때부터 코딩 영재로 시작해 지금은 교수가 되었습니다. 코딩 천재와 함께 스터디를 해보세요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('dfinvo2@naver.com','코딩은 함께 배우는 사람이 중요하다고 생각합니다. 저 역시도 회사를 선택할 때 나와 함께 할 동료가 누구인지를 최우선했습니다. 개발 회사 꿀팁을 많이 알고 있어요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('znjflan33@naver.com','누구나 노력을 한다면 배울 수 있는게 코딩이에요. 비전공자로 프로그래밍을 시작했지만 지금까지 굳건히 먹고 살고 있습니다. 꾸준함을 아무것도 이길 수 없어요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('lokjkvv2@daum.net','개발자로 살아온지 어언 20년, 이제는 척 하면 척입니다. 스터디를 통해 많은 친구들에게 저의 정보를 공유하고 싶어요. 화이팅!','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('cjftn77@naver.com','즐겁게 코딩을 합니다. 돈도 많이 벌고 아주 만족하며 생활하고 있습니다.','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('ppopo6@gmail.com','그림으로 그려가면서 코딩을 배웠습니다. 효과가 생각보다 많이 남더라구요! 여러분도 함께 해요. ','MS00');
Insert into WWW.MENTO (MENTO_EMAIL,CAREER,STAUS_CODE) values ('yeon222@naver.com','스타트업 창업을 통해 코딩을 시작했습니다. 스타트업에 관한 많은 조언을 드릴 수 있어요. ','MS00');
REM INSERTING into WWW.MENTO_STAUS_CODE
SET DEFINE OFF;
Insert into WWW.MENTO_STAUS_CODE (STAUS_CODE,STAUS_NAME) values ('MS00','멘토');
Insert into WWW.MENTO_STAUS_CODE (STAUS_CODE,STAUS_NAME) values ('MS01','멘토신청');
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
Insert into WWW.PAYMENT_PRICE_CODE (PRICE_CODE,PRICE_NAME) values ('PAY00','결제취소');
Insert into WWW.PAYMENT_PRICE_CODE (PRICE_CODE,PRICE_NAME) values ('PAY01','결제완료');
REM INSERTING into WWW.STUDY
SET DEFINE OFF;
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (39,'lokjkvv2@daum.net','재미있고 즐거운 C++ 스터디','C++을 어렵다고 생각하지 마세요. 그림으로 접근하는 스터디를 들어본 적 있나요? 연상 기억 학습법으로 이해를 우선시해 잊혀 지지 않는 스터디를 진행합니다. 지금 시작하세요!',to_date('19/02/01','RR/MM/DD'),to_date('19/02/28','RR/MM/DD'),21000,'P03','SL02','GN','coding5.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (30,'dyddydwnrrptwl@gmail.com','실습으로 배우는 자바 스터디
','실습으로 배우는 자바 스터디	실습이 누구보다 중요하다는 것을 알고 있습니다. 그렇다고 개념을 놓히지도 않아요! 실습과 개념, 두마리 토끼를 잡아 자바를 배워보세요.',to_date('18/10/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),17000,'P01','SL01','HD','coding4.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (31,'dyddydwnrrptwl@gmail.com','자바로 잡는 코딩','자바는 현재 우리나라에서 가장 많이 쓰이고 있는 언어입니다. 자바로 시작하면 무엇이든 어렵지 않을거에요! 저와 함께 지금 당장 시작하세요. ',to_date('18/08/30','RR/MM/DD'),to_date('18/09/10','RR/MM/DD'),23000,'P01','SL02','SC','coding3.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (40,'lokjkvv2@daum.net','C 미니 프로젝트 ','C로 팀을 구성해 미니 프로젝트를 만들어보세요. 개념만 아는 것보다 훨씬 배워가는 것들이 많을거에요. ',to_date('19/03/01','RR/MM/DD'),to_date('19/04/30','RR/MM/DD'),24000,'P02','SL03','NW','coding6.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (41,'lokjkvv2@daum.net','혼자서도 쉽게 익히는 C','스터디 후에도 혼자서 C를 학습할 수 있도록 자기주도학습 스터디를 진행합니다. 매주 내주는 과제를 통해 하루가 다르게 늘어가는 자신의 실력에 기쁨을 느껴보세요!',to_date('19/06/01','RR/MM/DD'),to_date('19/08/01','RR/MM/DD'),30000,'P02','SL01','GD','codingGenius.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (50,'cjftn77@naver.com','멘토와 함께 자바를 잡아','저와 함께 자바를 잡아보세요. 말장난 같으시다구요? 아닙니다. 자바를 잡으면 모든 걸 할 수 있어요! 파이팅입니다. ',to_date('19/02/01','RR/MM/DD'),to_date('19/04/30','RR/MM/DD'),19000,'P01','SL02','BD','matrix.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (51,'cjftn77@naver.com','자바와 함께라면 뭐든 할수있어','객체지향언어의 진수인 자바를 공부하세요. 자바와 함께라면 해외 진출도 어렵지 않아요! 물론 많은 학습이 필요하겠지만 저와 함께 스터디를 한다면 절대 어려운 일이 아닙니다. ',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),23000,'P01','SL02','AY','study2.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (53,'ppopo6@gmail.com','자바의 정석 스터디','한 달 안에 자바의 정석 책 한 권을 마스터해보세요. 물론 고통스럽겠지만 절대 불가능한 일은 아니랍니다. 저와 함께라면요!',to_date('19/01/01','RR/MM/DD'),to_date('19/01/31','RR/MM/DD'),20000,'P01','SL01','IS','study3.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (54,'ppopo6@gmail.com','중급자를 위한 C 스터디','C언어는 디지털 콘텐츠 개발을 위해 꼭 필요합니다. 디지털 콘텐츠가 빠질 수 없는 지금, C언어와 함께 하세요.',to_date('19/03/01','RR/MM/DD'),to_date('19/05/01','RR/MM/DD'),24000,'P02','SL02','GN','study5.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (59,'yeon222@naver.com','C 중급 스터디 ','C언어로 밥을 벌어 먹고 있습니다. C에 대해 어느 정도 경험이 있는 학생들에게 제가 갖고 있는 모든 경험을 나누어 드릴게요, 저와 함께 하세요!',to_date('19/05/01','RR/MM/DD'),to_date('19/05/31','RR/MM/DD'),15000,'P02','SL02','NW','study4.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (60,'yeon222@naver.com','뭐? C++이 가장 쉬웠다고?','실무 20년, 현업 프로그래머가 초보자를 위해 열었다! 쉽게 알려주는 C++ 스터디와 함께 코딩을 시작하세요!',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),13000,'P03','SL01','GN','study6.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (61,'yeon222@naver.com','개념 C 프로그래밍의 기본','실무 20년, 현업 프로그래머가 초보자를 위해 열었다! 실무에서 요긴하게 쓰이는 개념들만 학습하세요. ',to_date('18/12/01','RR/MM/DD'),to_date('19/01/01','RR/MM/DD'),16000,'P02','SL00','GD','study7.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (66,'javamento@naver.com','자바멘토의 즐거운 자바','자바(Java)는 C++과는 달리 처음부터 객체 지향 언어로 개발된 프로그래밍 언어입니다. 자바는 자바 가상 머신(JVM)을 사용하여 어느 운영체제에서나 같은 형태로 실행될 수 있습니다. 또한 현재 자바는 전 세계에서 가장 많이 사용하는 프로그래밍 언어 중 하나입니다. 자바 멘토와 함께 즐겁게 코딩의 길로 입문해보세요!',to_date('18/11/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),18000,'P01','SL00','HD','coding.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (67,'javamento@naver.com','자바멘토의 신나는 자바','자바(Java)는 C++과는 달리 처음부터 객체 지향 언어로 개발된 프로그래밍 언어입니다. 자바는 자바 가상 머신(JVM)을 사용하여 어느 운영체제에서나 같은 형태로 실행될 수 있습니다. 또한 현재 자바는 전 세계에서 가장 많이 사용하는 프로그래밍 언어 중 하나입니다.  자바의 길로 들어섰다면 더욱 깊은 자바를 맞봐야겠죠. 자바 멘토와 함께 신나게 자바를 공부해보세요!',to_date('19/01/01','RR/MM/DD'),to_date('19/02/28','RR/MM/DD'),25000,'P01','SL01','HD','study1.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (68,'javamento@naver.com','자바멘토의 활기찬 자바 고급','자바 개념은 어느 정도 알겠지만 실무 적용이 안 된다면? 저와 함께 스터디를 시작하세요! 팀을 구성해 자바로 작은 미니 프로젝트를 만듭니다. 포트 폴리오 구성과 함께 실무 경험도 쌓아가는 일석 이조의 기회가 될 것입니다. 놓치지 마세요!',to_date('19/03/01','RR/MM/DD'),to_date('19/05/01','RR/MM/DD'),30000,'P01','SL03','GN','studyTeacher.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (69,'cmento@naver.com','C 입문 스터디 ','C언어는 시스템 프로그래밍에 가장 잘 어울리지만, 응용 프로그래밍에도 많이 사용되는 프로그래밍 언어입니다. C언어로 코딩의 시작을 함께 하세요. ',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),27000,'P02','SL00','GN','coding2.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (70,'cmento@naver.com','열정으로 함께 하는 C 스터디 ','열정만 있다면 C도 어렵지 않아요! 저 멘토와 함께 하세요. ',to_date('19/02/01','RR/MM/DD'),to_date('19/02/08','RR/MM/DD'),21000,'P02','SL01','GN','study8.jpg');
Insert into WWW.STUDY (STUDY_NUM,MENTO_EMAIL,STUDY_NAME,STUDY_WRITE,START_DATE,END_DATE,PRICE,STUDY_SUBJECT_CODE,STUDY_LEVEL_CODE,STUDY_LOC_CODE,STUDY_IMG) values (71,'cpmento@naver.com','외국어처럼 배우는 C++','개발자로서 쌓은 해외 경험을 토대로 C++을 가르칩니다. 해외 취업에 관심이 있고 C++을 배워보고 싶으신 분들은 지금 시작해보세요.',to_date('18/09/01','RR/MM/DD'),to_date('18/11/01','RR/MM/DD'),22000,'P02','SL01','HD','studyTeacher2.jpg');
REM INSERTING into WWW.STUDY_LEVEL_CODE
SET DEFINE OFF;
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL00','입문');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL01','초급');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL02','중급');
Insert into WWW.STUDY_LEVEL_CODE (LEVEL_CODE,LEVEL_NAME) values ('SL03','고급');
REM INSERTING into WWW.STUDY_LOC_CODE
SET DEFINE OFF;
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('SC','신촌');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('HD','홍대');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('GN','강남');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('NW','노원');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('GD','건대');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('BD','분당');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('AY','안양');
Insert into WWW.STUDY_LOC_CODE (LOC_CODE,LOC_NAME) values ('IS','일산');
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
