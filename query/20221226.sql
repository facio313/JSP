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

--comment on column member.mem_id is '회원아이디';

SELECT 'COMMENT ON COLUMN ' || TABLE_NAME || '.' || COLUMN_NAME || ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER';

COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PASS IS '비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.MEM_REGNO1 IS '주민번호1';
COMMENT ON COLUMN MEMBER.MEM_REGNO2 IS '주민번호2';
COMMENT ON COLUMN MEMBER.MEM_BIR IS '생일';
COMMENT ON COLUMN MEMBER.MEM_ZIP IS '우편번호';
COMMENT ON COLUMN MEMBER.MEM_ADD1 IS '주소1';
COMMENT ON COLUMN MEMBER.MEM_ADD2 IS '주소2';
COMMENT ON COLUMN MEMBER.MEM_HOMETEL IS '집전번';
COMMENT ON COLUMN MEMBER.MEM_COMTEL IS '회사전번';
COMMENT ON COLUMN MEMBER.MEM_HP IS '휴대폰';
COMMENT ON COLUMN MEMBER.MEM_MAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEM_JOB IS '직업';
COMMENT ON COLUMN MEMBER.MEM_LIKE IS '취미';
COMMENT ON COLUMN MEMBER.MEM_MEMORIAL IS '기념일';
COMMENT ON COLUMN MEMBER.MEM_MEMORIALDAY IS '기념일자';
COMMENT ON COLUMN MEMBER.MEM_MILEAGE IS '마일리지';
COMMENT ON COLUMN MEMBER.MEM_DELETE IS '탈퇴여부';

--	<tr>
--		<th>아이디</th>
--		<td>${member.memId}</td>
--	</tr>

SELECT SUBSTR(LOWER(COLUMN_NAME), 1, 1) || SUBSTR(REPLACE(INITCAP(COLUMN_NAME), '_', ''), 2)
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';

--String SNAKETOCAMEL(String SNAKE){
--    String tmp // 지역변수
--    method body
--}

CREATE OR REPLACE FUNCTION SNAKETOCAMEL( --만들거나 대체해라 함수를 SNAMEKTOCAMEL
    SNAKE VARCHAR2 -- 매개변수(파라미터)
)
RETURN VARCHAR2    -- 리턴타입
IS                 -- 위는 선언부 / 밑은 실행부
V_TMP VARCHAR2(50); -- 지역변수
BEGIN
    V_TMP := SUBSTR(LOWER(SNAKE), 1, 1) || SUBSTR(REPLACE(INITCAP(SNAKE), '_', ''), 2); -- := 할당연산자
    RETURN V_TMP;
END;

SELECT '<tr><th>' || COMMENTS || '</th>' || '<td>${' || LOWER(TABLE_NAME) || '.' || SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';