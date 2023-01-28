--------------------------------------------------------
--  파일이 생성됨 - 토요일-1월-28-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_MEMO
--------------------------------------------------------

  CREATE TABLE "TBL_MEMO" 
   (	"CODE" NUMBER(5,0), 
	"WRITER" VARCHAR2(10 CHAR), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TBL_MEMO
SET DEFINE OFF;
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (42,'재작성','하이루',to_date('2022/12/27','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (2,'이쁜이','이쁜이이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (3,'신용환','신용환이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (4,'성윤미','성윤미이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (5,'이혜나','이혜나이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (6,'신영남','신영남이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (7,'송경희','송경희이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (8,'라준호','라준호이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (9,'최지현','최지현이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (10,'김윤희','김윤희이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (11,'오철희','오철희이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (12,'구길동','구길동이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (13,'박지은','박지은이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (14,'탁원재','탁원재이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (15,'배인정','배인정이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (16,'오성순','오성순이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (17,'육평회','육평회이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (18,'정은실','정은실이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (19,'안은정','안은정이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (20,'성원태','성원태이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (21,'김성욱','김성욱이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (22,'이진영','이진영이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (23,'김형모','김형모이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (24,'진현경','진현경이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (41,'최경수aa','asd',to_date('2022/12/27','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (43,'작성자4','asdasd',to_date('2022/12/27','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (27,'수역수','수역수이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
Insert into TBL_MEMO (CODE,WRITER,CONTENT,"DATE") values (28,'간나경','간나경이 작성한 메모',to_date('2022/12/23','YYYY/MM/DD'));
--------------------------------------------------------
--  DDL for Index PK_TBL_MEMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TBL_MEMO" ON "TBL_MEMO" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TBL_MEMO
--------------------------------------------------------

  ALTER TABLE "TBL_MEMO" ADD CONSTRAINT "PK_TBL_MEMO" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TBL_MEMO" MODIFY ("WRITER" NOT NULL ENABLE);
