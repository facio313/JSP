--------------------------------------------------------
--  파일이 생성됨 - 금요일-1월-06-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "CART" 
   (	"CART_MEMBER" VARCHAR2(15 BYTE), 
	"CART_NO" CHAR(13 BYTE), 
	"CART_PROD" VARCHAR2(10 BYTE), 
	"CART_QTY" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CART"."CART_MEMBER" IS '회원ID';
   COMMENT ON COLUMN "CART"."CART_NO" IS '주문번호';
   COMMENT ON COLUMN "CART"."CART_PROD" IS '상품코드';
   COMMENT ON COLUMN "CART"."CART_QTY" IS '수량';
   COMMENT ON TABLE "CART"  IS '장바구니 정보 테이블';
REM INSERTING into CART
SET DEFINE OFF;
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P101000001',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P201000018',16);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020040100001','P302000003',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020040100002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020040100002','P101000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P201000019',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P302000005',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P201000020',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020040100003','P101000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P302000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P101000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020040500001','P201000021',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P302000011',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P202000001',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020040500002','P101000005',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020040600001','P101000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020040600001','P202000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P302000013',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P202000003',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020040600002','P102000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P302000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020040800001','P202000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P302000015',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P202000005',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020040800002','P102000003',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P302000016',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P102000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020041000001','P202000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P202000007',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P102000005',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041000002','P302000021',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P302000022',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P202000008',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P102000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041200001','P202000009',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P102000007',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P302000023',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020041200002','P202000010',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041500001','P201000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041500001','P302000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P202000011',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P201000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020041500002','P302000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P302000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P201000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020041600001','P202000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P302000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P201000004',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020041600002','P202000013',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P302000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P201000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020041800001','P202000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P302000006',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P201000006',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020041800002','P202000015',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P302000011',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P201000007',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P202000016',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P202000017',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042000001','P201000008',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000018',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P201000009',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000019',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P201000010',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042000002','P202000020',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P201000011',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P202000021',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020042400001','P201000012',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P301000001',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P201000013',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020042400002','P201000014',13);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042800001','P301000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020042800001','P201000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P302000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P201000016',15);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020042800002','P201000017',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050100001','P201000013',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050100001','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P301000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P201000014',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020050100002','P201000015',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020050300001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020050300001','P302000002',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020050300002','P201000016',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020050300002','P201000017',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P302000003',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P201000018',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020050500001','P302000004',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050500002','P201000019',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P302000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P101000001',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020050700001','P101000002',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P201000020',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P302000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020050700002','P302000011',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P201000021',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P101000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020051000001','P101000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P202000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P302000012',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P302000013',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P101000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020051000002','P202000002',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P101000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P202000003',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P302000014',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P302000015',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020051200001','P102000001',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P202000004',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P202000005',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P302000016',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020051300001','P302000021',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020051500001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020051500001','P202000006',12);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P202000007',17);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051600001','P302000022',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P302000023',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P202000008',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P102000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('k001','2020051600002','P202000009',13);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020051800001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('l001','2020051800001','P302000002',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P102000007',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P202000010',23);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P201000001',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P202000011',25);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P302000003',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('m001','2020051800002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P201000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P202000012',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('o001','2020052100001','P201000003',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P202000013',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P302000005',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P302000006',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P201000004',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('p001','2020052100002','P202000014',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P201000005',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P202000015',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020052400001','P302000011',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P302000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P201000006',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('s001','2020052500001','P202000016',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P201000007',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P202000017',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P201000008',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('t001','2020052500002','P202000018',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('v001','2020052800001','P201000009',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('v001','2020052800001','P202000019',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P201000010',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P202000020',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('w001','2020052900001','P201000011',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P202000021',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P201000012',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('x001','2020052900002','P301000001',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000013',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000014',11);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('a001','2020060500001','P302000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000016',9);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000021',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020060600001','P302000022',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020061200001','P302000023',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020061200001','P302000001',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020061300001','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020061300001','P302000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020061300002','P302000004',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020061300002','P302000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020062100001','P302000006',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020062100001','P302000011',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062100002','P302000012',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000013',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000014',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('f001','2020062500001','P302000015',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020070100001','P201000013',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020070100001','P301000002',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P301000003',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P201000014',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020070100002','P201000015',7);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020070300001','P302000001',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('d001','2020070300001','P302000002',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020070300002','P201000016',8);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('e001','2020070300002','P201000017',21);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020070800001','P101000001',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('g001','2020070800001','P101000002',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020070800002','P101000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('h001','2020071100001','P101000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('r001','2020071100002','P101000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000001',1);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('i001','2020071900001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('u001','2020071900002','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('u001','2020071900002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020072800001','P102000006',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020072800001','P102000003',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020072800002','P102000004',4);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('q001','2020072800002','P102000005',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020072800003','P301000003',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('c001','2020072800003','P201000015',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P302000001',6);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P201000016',15);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P302000002',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('b001','2020072800004','P201000017',2);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('n001','2020072800005','P102000005',3);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051700001','P201000012',5);
Insert into CART (CART_MEMBER,CART_NO,CART_PROD,CART_QTY) values ('j001','2020051800003','P201000012',5);
--------------------------------------------------------
--  DDL for Index PK_CART
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CART" ON "CART" ("CART_NO", "CART_PROD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger TG_CHANGE_CART
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TG_CHANGE_CART" 
    AFTER INSERT OR UPDATE OR DELETE ON CART
    FOR EACH ROW
DECLARE
    V_QTY NUMBER := 0;
    V_PID PROD.PROD_ID%TYPE;
    V_DATE DATE;
    V_MID MEMBER.MEM_ID%TYPE;
    V_MILE NUMBER := 0;
BEGIN
    IF INSERTING THEN
        V_QTY := (:NEW.CART_QTY);
        V_PID := (:NEW.CART_PROD);
        V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO, 1, 8));
        V_MID := (:NEW.CART_MEMBER);
    ELSIF UPDATING THEN
        V_QTY := (:NEW.CART_QTY) - (:OLD.CART_QTY);
        V_PID := (:NEW.CART_PROD);
        V_DATE := TO_DATE(SUBSTR(:NEW.CART_NO, 1, 8));
        V_MID := (:NEW.CART_MEMBER);
    ELSIF DELETING THEN
        V_QTY := (:OLD.CART_QTY);
        V_PID := (:OLD.CART_PROD);
        V_DATE := TO_DATE(SUBSTR(:OLD.CART_NO, 1, 8));
        V_MID := (:OLD.CART_MEMBER);
    END IF;

    UPDATE  REMAIN
    SET     REMAIN_O = REMAIN_O + V_QTY,
            REMAIN_J_99 = REMAIN_J_99 - V_QTY,
            REMAIN_DATE = V_DATE
    WHERE   PROD_ID=V_PID;

    SELECT  V_QTY*PROD_MILEAGE INTO V_MILE
    FROM    PROD
    WHERE   PROD_ID = V_PID;

    UPDATE  MEMBER
    SET     MEM_MILEAGE = MEM_MILEAGE + V_MILE
    WHERE   MEM_ID = V_MID;
END;
/
ALTER TRIGGER "TG_CHANGE_CART" ENABLE;
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY ("CART_NO", "CART_PROD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CART" MODIFY ("CART_QTY" NOT NULL ENABLE);
  ALTER TABLE "CART" MODIFY ("CART_PROD" NOT NULL ENABLE);
  ALTER TABLE "CART" MODIFY ("CART_NO" NOT NULL ENABLE);
  ALTER TABLE "CART" MODIFY ("CART_MEMBER" NOT NULL ENABLE);
