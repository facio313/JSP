-----------아파서 안 나왔을 때, 시윤이꺼

SELECT
    mem_id,    mem_pass,    mem_name,
    mem_regno1,    mem_regno2,    to_char(mem_bir, 'YYYY-MM-DD')  mem_bir,
    mem_zip,    mem_add1,    mem_add2,
    mem_hometel,    mem_comtel,    mem_hp,
    mem_mail,   mem_job,    mem_like,
    mem_memorial,    to_char(mem_memorialday, 'YYYY-MM-DD') mem_memorialday,    mem_mileage,
    mem_delete
FROM    member
where mem_id = 'a001'
;

--comment on column member.mem_id is '회원아이디';
comment on column MEMBER.MEM_ID is '회원아이디';
comment on column MEMBER.MEM_PASS is '비밀번호';
comment on column MEMBER.MEM_NAME is '회원명';
comment on column MEMBER.MEM_REGNO1 is '주민번호1';
comment on column MEMBER.MEM_REGNO2 is '주민번호2';
comment on column MEMBER.MEM_BIR is '생일';
comment on column MEMBER.MEM_ZIP is '우편번호';
comment on column MEMBER.MEM_ADD1 is '주소1';
comment on column MEMBER.MEM_ADD2 is '주소2';
comment on column MEMBER.MEM_HOMETEL is '집전번';
comment on column MEMBER.MEM_COMTEL is '회사전번';
comment on column MEMBER.MEM_HP is '휴대폰';
comment on column MEMBER.MEM_MAIL is '이메일';
comment on column MEMBER.MEM_JOB is '직업';
comment on column MEMBER.MEM_LIKE is '취미';
comment on column MEMBER.MEM_MEMORIAL is '기념일';
comment on column MEMBER.MEM_MEMORIALDAY is '기념일자';
comment on column MEMBER.MEM_MILEAGE is '마일리지';
comment on column MEMBER.MEM_DELETE is '탈퇴여부';


select SUBSTR(LOWER(COLUMN_NAME),1,1) || SUBSTR(REPLACE(INITCAP(COLUMN_NAME),'_',''), 2) from USER_COL_COMMENTS
where TABLE_NAME = 'MEMBER';


CREATE OR REPLACE FUNCTION SNAKETOCAMEL(
    snake varchar2
) 
return varchar2
is
v_tmp varchar2(50);
begin
    v_tmp := SUBSTR(LOWER(snake),1,1) || SUBSTR(REPLACE(INITCAP(snake),'_',''), 2);
    return v_tmp;
end;

select '<tr><th>' || COMMENTS || '</th>' || '<td>${' || LOWER(TABLE_NAME) || '.' || SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
from USER_COL_COMMENTS
where TABLE_NAME = 'MEMBER';

------------------------------------------------------------------------------------------------------------------
    
--#{memId, jdbcType=VARCHAR}
select ', ' || 
        COLUMN_NAME || ' = #{' SNAKETOCAMEL(COLUMN_NAME) || ', jdbcType=' || 
    CASE
        WHEN DATA_TYPE = 'VARCHAR2' THEN 'VARCHAR'
        WHEN DATA_TYPE = 'NUMBER' THEN 'NUMERIC'
        ELSE DATA_TYPE
    END || '}'
from COLS
where TABLE_NAME='MEMBER';


--<tr>
--    <th>회원아이디</th>
--    <td>
--        <input class="form-control" type="text" name="memId" value="${member.memId}" />
--        <span class="text-danger">${errors.memId }</span>
--    </td>
--</tr>

SELECT  '<tr><th>' || COMMENTS || '</th><td>' ||
    '<input class="form-control" type="' ||
    CASE 
    WHEN DATA_TYPE='DATE' OR DATA_TYPE='NUMBER' THEN LOWER(DATA_TYPE)
    ELSE 'text'
    END || '" ' ||
    DECODE(NULLABLE, 'N', ' required ', '') || 
    'name="' || SNAKETOCAMEL(A.COLUMN_NAME) || '" value="${' ||
    LOWER(A.TABLE_NAME) || '.' || SNAKETOCAMEL(A.COLUMN_NAME) || '}" />' ||
    '<span class="text-danger">${errors.' || SNAKETOCAMEL(A.COLUMN_NAME) || 
    '}</span></td></tr>'
FROM    COLS A  LEFT OUTER JOIN  USER_COL_COMMENTS B
                ON(A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
WHERE   A.TABLE_NAME='MEMBER' ;

-- a001 사용자의 이름, 휴대폰, 이메일과 구매기록(상품명, 분류명, 거래처명, 구매가, 판매가, 마일리지)
-- 중첩 쿼리
--from    - inline view
--select  - scala query
--where   - nested query(sub query)
with cartview as (
    select  distinct cart_member, cart_prod     -- inline view
    from    cart
), prodview as (
    select  prod.* , lprod_nm, buyer_name
    from    prod inner join lprod on (prod_lgu = lprod_gu)
                 inner join buyer on (prod_buyer = buyer_id)
), cartprod as (
    select  cart_member, prod_id, prod_name, prod_lgu, prod_buyer, prod_cost, prod_price, prod_mileage, lprod_nm, buyer_name
    from    cartview inner join prodview on (cart_prod = prod_id)
)
select  mem_name, mem_hp, mem_mail,
        prod_id, prod_name, prod_lgu, prod_buyer, prod_cost, prod_price, prod_mileage,
        lprod_nm, buyer_name
from  member left outer join cartprod on (mem_id = cart_member)   -- cart는 있을수도 없을수도                
where mem_id = 'a001';

select  mem_id, prod_name, lprod_nm, buyer_name
from     member left outer join cart on (mem_id = cart_member)
                left outer join prod on (cart_prod = prod_id)
                left outer join lprod on (prod_lgu = lprod_gu)
                left outer join buyer on (prod_buyer = buyer_id)
where mem_id = 'a001';
        
-- 사용자들의 (이름과 휴대폰 이메일, 구매건수)
with cartview as (
    select  count(distinct cart_prod) as cnt, cart_member
    from    cart
    group by cart_member
)
select  mem_id, mem_hp, mem_mail, nvl(cnt, 0)
from    member left outer join cartview on ( mem_id = cart_member);

-- scala query -- record 1개 , column 1개일때만
select  mem_id, mem_hp, mem_mail
        , (
            select  count(distinct cart_prod)
            from    cart
            where   cart_member = mem_id
        )
from    member;

-- 구매기록이 있는 사용자들의 (이름과 휴대폰 이메일, 구매건수)
with cartview as (
    select  count(distinct cart_prod) as cnt, cart_member
    from    cart
    group by cart_member
)
select  mem_id, mem_hp, mem_mail, nvl(cnt, 0)
from    member left outer join cartview on ( mem_id = cart_member)
--where   cart_count is not null
where   mem_id in (             
            select  distinct cart_member
            from    cart
);

select  mem_name, mem_hp, mem_mail
from    member
where   mem_id in (
    select  distinct cart_member
    from    cart
);

SELECT  'private '||
    DECODE( DATA_TYPE , 'NUMBER', 'Integer ', 'String ') ||
    LOWER(SUBSTR(COLUMN_NAME, 1, 1)) ||
    SUBSTR( REPLACE( INITCAP(COLUMN_NAME) , '_', ''), 2) || ';'
FROM COLS
WHERE TABLE_NAME = 'BUYER';


-- * 상품 상세 조회 시 해당 거래처의 모든 정보 함께 조회함
-- * 상품 상세 조회 시 구매자 리스트 (구매자 id, 회원이름, 회원 전화번호, 이메일 ,마일리지) 함께 조회
-- * 분류명도 함께 조회

with cartmember as (
    select  distinct mem_id, mem_name, mem_hp, mem_mail, mem_mileage, cart_prod
    from    cart  inner join member on (cart_member = mem_id)
)
select  prod.*
        , (
            select  distinct lprod_nm
            from    lprod
            where   lprod_gu = prod_lgu
        )
        , cartmember.*
        , buyer.*
from    prod    left outer join cartmember on (prod_id = cart_prod)
                left outer join buyer on (prod_buyer = buyer_id)
where   prod_id = 'P101000001';

-- 정답
-- prod, buyer, lprod, cart, member
-- prod:buyer = 1:1, prod:(lprod) = 1:1, prod:(cart) = 1:n, (cart):member = 1:1, prod:member = 1:n
-- lprod와 cart 는 관계를 위한 테이블일뿐

-- 자주 사용하는 뷰 생성
create  or replace view prodview as (
    SELECT	PROD.*
            , LPROD_NM
            , BUYER.*
    FROM	PROD INNER JOIN LPROD ON (PROD_LGU = LPROD_GU) 
                 INNER JOIN BUYER ON (PROD_BUYER = BUYER_ID)
);

with cartview as(
    select  cart_prod
            , mem_id, mem_name, mem_hp, mem_mail, mem_mileage
    from    cart inner join member on(cart_member = mem_id)
)
select  PROD_ID, PROD_NAME, PROD_LGU, 
        PROD_BUYER, PROD_COST, PROD_PRICE, 
        PROD_SALE, PROD_OUTLINE, PROD_DETAIL, 
        PROD_IMG, PROD_TOTALSTOCK, PROD_INSDATE, 
        PROD_PROPERSTOCK, PROD_SIZE, PROD_COLOR, 
        PROD_DELIVERY, PROD_UNIT, PROD_QTYIN, 
        PROD_QTYSALE, PROD_MILEAGE
        , lprod_nm
        , buyer_name, buyer_add1, buyer_charger
        , cartview.*
from    prodview left outer join cartview on (prod_id = cart_prod)
where   prod_id ='P101000001';

-- 또는

select  distinct prod_name
        , lprod_nm
        , buyer_name
        , cart_member
        , mem_name        
from    prod inner join lprod on (prod_lgu = lprod_gu)
             inner join buyer on (prod_buyer = buyer_id)
             left outer join cart on (prod_id = cart_prod)
             left outer join member on (cart_member = mem_id);

--comment on column member.mem_id is '회원아이디';
SELECT 'COMMENT ON COLUMN ' ||
    TABLE_NAME || '.' || COLUMN_NAME ||
    ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'PROD';
COMMENT ON COLUMN PROD.PROD_ID IS '상품아이디';
COMMENT ON COLUMN PROD.PROD_NAME IS '상품명';
COMMENT ON COLUMN PROD.PROD_LGU IS '상품분류';
COMMENT ON COLUMN PROD.PROD_BUYER IS '거래처';
COMMENT ON COLUMN PROD.PROD_COST IS '구매가';
COMMENT ON COLUMN PROD.PROD_PRICE IS '판매가';
COMMENT ON COLUMN PROD.PROD_SALE IS '세일가';
COMMENT ON COLUMN PROD.PROD_OUTLINE IS '상품요약';
COMMENT ON COLUMN PROD.PROD_DETAIL IS '상품상세';
COMMENT ON COLUMN PROD.PROD_IMG IS '상품이미지';
COMMENT ON COLUMN PROD.PROD_TOTALSTOCK IS '재고';
COMMENT ON COLUMN PROD.PROD_INSDATE IS '입고일';
COMMENT ON COLUMN PROD.PROD_PROPERSTOCK IS '적정재고';
COMMENT ON COLUMN PROD.PROD_SIZE IS '크기';
COMMENT ON COLUMN PROD.PROD_COLOR IS '색상';
COMMENT ON COLUMN PROD.PROD_DELIVERY IS '배송방법';
COMMENT ON COLUMN PROD.PROD_UNIT IS '단위';
COMMENT ON COLUMN PROD.PROD_QTYIN IS '입고량';
COMMENT ON COLUMN PROD.PROD_QTYSALE IS '출고량';
COMMENT ON COLUMN PROD.PROD_MILEAGE IS '마일리지';
--<tr>
--		<th>회원아이디</th>
--		<td>${member.memId }</td>
--	</tr>

SELECT '<tr><th>' || COMMENTS ||'</th>' ||
    '<td>${' || LOWER(TABLE_NAME) || '.' ||
    SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'PROD';

------------------------------------------------------------------------------------------------------------------
select  b.*
from    (
        select  rownum as rnum, a.*
        from    (
            select mem_id, mem_name -- ÀÇ»çÄÃ·³ : rownum
            from member
            order by rowid desc) a
) b
where   rnum >= 11 and rnum <= 20;

WITH CARTVIEW AS(
    SELECT  count(mem_id) as cnt, cart_prod
    FROM    CART INNER JOIN MEMBER ON(CART_MEMBER = MEM_ID)
    group   by cart_prod
)
select  b.*
from    (
        select  rownum as rnum
                , a.*
        from    (
                SELECT  PROD_ID, PROD_NAME, PROD_PRICE, PROD_COST
                        , BUYER_NAME
                        , LPROD_NM
                        , nvl(cnt, 0)
                FROM    PRODVIEW LEFT OUTER JOIN CARTVIEW ON (PROD_ID = CART_PROD)
                order   by prod_id) a
        ) b
where  rnum >= 11 and rnum <= 20;

WITH CARTVIEW AS(
    SELECT  count(mem_id) as cnt, cart_prod
    FROM    CART INNER JOIN MEMBER ON(CART_MEMBER = MEM_ID)
    group   by cart_prod
)
SELECT  count(*)
FROM    PRODVIEW LEFT OUTER JOIN CARTVIEW ON (PROD_ID = CART_PROD);

--<tr>
--		<th>È¸¿ø¾ÆÀÌµð</th>
--		<td>${member.memId }</td>
--	</tr>

SELECT '<tr><th>' || COMMENTS ||'</th>' ||
    '<td>${' || LOWER(TABLE_NAME) || '.' ||
    SNAKETOCAMEL(COLUMN_NAME) || '}</td></tr>'
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'PRODVIEW';