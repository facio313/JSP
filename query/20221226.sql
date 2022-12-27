SELECT
    mem_id,    mem_pass,    mem_name,
    mem_regno1,    mem_regno2,    
    to_char(mem_bir, 'YYYY-MM-DD') MEM_BIR,
    mem_zip,    mem_add1,    mem_add2,
    mem_hometel,    mem_comtel,    mem_hp,
    mem_mail,    mem_job,    mem_like,
    mem_memorial,
    TO_CHAR(mem_memorialday, 'YYYY-MM-DD') mem_memorialday,        mem_mileage,
    mem_delete
FROM
    member
WHERE MEM_ID = 'a001';

--comment on column member.mem_id is 'ȸ�����̵�';

SELECT 'COMMENT ON COLUMN ' || TABLE_NAME || '.' || COLUMN_NAME || ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER';

COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_PASS IS '��й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ����';
COMMENT ON COLUMN MEMBER.MEM_REGNO1 IS '�ֹι�ȣ1';
COMMENT ON COLUMN MEMBER.MEM_REGNO2 IS '�ֹι�ȣ2';
COMMENT ON COLUMN MEMBER.MEM_BIR IS '����';
COMMENT ON COLUMN MEMBER.MEM_ZIP IS '�����ȣ';
COMMENT ON COLUMN MEMBER.MEM_ADD1 IS '�ּ�1';
COMMENT ON COLUMN MEMBER.MEM_ADD2 IS '�ּ�2';
COMMENT ON COLUMN MEMBER.MEM_HOMETEL IS '������';
COMMENT ON COLUMN MEMBER.MEM_COMTEL IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_HP IS '�޴���';
COMMENT ON COLUMN MEMBER.MEM_MAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.MEM_JOB IS '����';
COMMENT ON COLUMN MEMBER.MEM_LIKE IS '���';
COMMENT ON COLUMN MEMBER.MEM_MEMORIAL IS '�����';
COMMENT ON COLUMN MEMBER.MEM_MEMORIALDAY IS '�������';
COMMENT ON COLUMN MEMBER.MEM_MILEAGE IS '���ϸ���';
COMMENT ON COLUMN MEMBER.MEM_DELETE IS 'Ż�𿩺�';

--	<tr>
--		<th>���̵�</th>
--		<td>${member.memId}</td>
--	</tr>

SELECT SUBSTR(LOWER(COLUMN_NAME), 1, 1) || SUBSTR(REPLACE(INITCAP(COLUMN_NAME), '_', ''), 2)
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';

--String SNAKETOCAMEL(String SNAKE){
--    String tmp // ��������
--    method body
--}

CREATE OR REPLACE FUNCTION SNAKETOCAMEL( --����ų� ��ü�ض� �Լ��� SNAMEKTOCAMEL
    SNAKE VARCHAR2 -- �Ű�����(�Ķ����)
)
RETURN VARCHAR2    -- ����Ÿ��
IS                 -- ���� ����� / ���� �����
V_TMP VARCHAR2(50); -- ��������
BEGIN
    V_TMP := SUBSTR(LOWER(SNAKE), 1, 1) || SUBSTR(REPLACE(INITCAP(SNAKE), '_', ''), 2); -- := �Ҵ翬����
    RETURN V_TMP;
END;

SELECT '<tr><th>' || COMMENTS || '</th>' || '<td>${' || LOWER(TABLE_NAME) || '.' || SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';