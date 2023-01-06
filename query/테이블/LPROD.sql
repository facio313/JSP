--------------------------------------------------------
--  파일이 생성됨 - 금요일-1월-06-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LPROD
--------------------------------------------------------

  CREATE TABLE "LPROD" 
   (	"LPROD_ID" NUMBER(7,0), 
	"LPROD_GU" CHAR(4 BYTE), 
	"LPROD_NM" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into LPROD
SET DEFINE OFF;
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (1,'P101','컴퓨터제품');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (2,'P102','전자제품');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (3,'P201','여성캐주얼');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (4,'P202','남성캐주얼');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (5,'P301','피혁잡화');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (6,'P302','화장품');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (7,'P401','음반/CD');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (8,'P402','도서');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (9,'P403','문구류');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (11,'p501','농산물');
Insert into LPROD (LPROD_ID,LPROD_GU,LPROD_NM) values (12,'P502','수산물');
--------------------------------------------------------
--  DDL for Index PK_LPROD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LPROD" ON "LPROD" ("LPROD_GU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger TG_DELETE_LPROD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TG_DELETE_LPROD" 
    AFTER DELETE ON LPROD
BEGIN
DBMS_OUTPUT.PUT_LINE('자료가 삭제되었습니다.');
END;


















/
ALTER TRIGGER "TG_DELETE_LPROD" ENABLE;
--------------------------------------------------------
--  Constraints for Table LPROD
--------------------------------------------------------

  ALTER TABLE "LPROD" ADD CONSTRAINT "PK_LPROD" PRIMARY KEY ("LPROD_GU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "LPROD" MODIFY ("LPROD_NM" NOT NULL ENABLE);
  ALTER TABLE "LPROD" MODIFY ("LPROD_GU" NOT NULL ENABLE);
  ALTER TABLE "LPROD" MODIFY ("LPROD_ID" NOT NULL ENABLE);
