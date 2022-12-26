CREATE TABLE TBL_MEMO(
    CODE NUMBER(5), 
    WRITER VARCHAR2(10 CHAR) NOT NULL,
    CONTENT VARCHAR2(2000),
    "DATE" DATE DEFAULT SYSDATE,
    CONSTRAINT PK_TBL_MEMO PRIMARY KEY(CODE)
);

CREATE SEQUENCE MEMO_SEQ;

INSERT INTO tbl_memo (
    code, writer, content
) select memo_seq.nextval, mem_name, mem_name||'이 작성한 메모' from member;

commit;

select * from tbl_memo;

INSERT INTO tbl_memo (code, writer, content, "DATE")
VALUES ( memo_seq.nextval, mem_name, content, sysdate);

UPDATE tbl_memo
SET writer = '하이', content = '뿡뿡', "DATE" = sysdate
WHERE code = 34



-----------------------system--------------------------------
select *
from V$RESOURCE_LIMIT;

alter system set sessions = 300 scope = spfile;
alter system set processes = 300 scope = spfile;