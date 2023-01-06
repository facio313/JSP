-- prodId �����
SELECT 'P101' || LPAD(SERIAL + 1, 6, '0') prod_id
FROM (
    SELECT SUBSTR(PROD_ID, 5) SERIAL, RANK() OVER (ORDER BY SUBSTR(PROD_ID, 4) DESC) CUR
    FROM PROD
    WHERE SUBSTR(PROD_ID, 1, 4) = 'P101'
)
WHERE CUR = 1
-- ����Ʈ ������ ���� �� Ŀ���� ����, ���� ���� �ƴ�(��)
SELECT PROD_LGU || LPAD(TO_NUMBER(SUBSTR(MAX(PROD_ID), 5)) + 1, 6, '0')
FROM PROD
WHERE PROD_LGU = 'P101'
GROUP BY PROD_LGU;

SELECT 'P909' || LPAD((NVL(TO_NUMBER(SUBSTR(MAX(PROD_ID), 5)), 0) + 1), 6, '0')
FROM PROD
WHERE PROD_LGU = 'P909'

-- �ζ��� �Ķ����
SELECT ', #(' || SNAKETOCAMEL(COLUMN_NAME) || ',' || 'jdbcType=' ||
    CASE    
        WHEN DATA_TYPE = 'VARCHAR2' THEN 'VARCHAR'
        WHEN DATA_TYPE = 'NUMBER' THEN 'NUMERIC'
        ELSE DATA_TYPE
    END || '}'
FROM COLS
WHERE TABLE_NAME = 'PROD';

-- insert
INSERT INTO prod (
    prod_id,
    prod_name,
    prod_lgu,
    prod_buyer,
    prod_cost,
    prod_price,
    prod_sale,
    prod_outline,
    prod_detail,
    prod_img,
    prod_totalstock,
    prod_insdate,
    prod_properstock,
    prod_size,
    prod_color,
    prod_delivery,
    prod_unit,
    prod_qtyin,
    prod_qtysale,
    prod_mileage1
) VALUES (
    #{prodId,jdbcType=VARCHAR}
    , #{prodName,jdbcType=VARCHAR}
    , #{prodLgu,jdbcType=CHAR}
    , #{prodBuyer,jdbcType=CHAR}
    , #{prodCost,jdbcType=NUMERIC}
    , #{prodPrice,jdbcType=NUMERIC}
    , #{prodSale,jdbcType=NUMERIC}
    , #{prodOutline,jdbcType=VARCHAR}
    , #{prodDetail,jdbcType=CLOB}
    , #{prodImg,jdbcType=VARCHAR}
    , #{prodTotalstock,jdbcType=NUMERIC}
    , TO_DATE(#{prodInsdate,jdbcType=DATE}, 'YYYY-MM-DD')
    , #{prodProperstock,jdbcType=NUMERIC}
    , #{prodSize,jdbcType=VARCHAR}
    , #{prodColor,jdbcType=VARCHAR}
    , #{prodDelivery,jdbcType=VARCHAR}
    , #{prodUnit,jdbcType=VARCHAR}
    , #{prodQtyin,jdbcType=NUMERIC}
    , #{prodQtysale,jdbcType=NUMERIC}
    , #{prodMileage,jdbcType=NUMERIC}
);

-- �ڸ�Ʈ
--comment on column member.mem_id is 'ȸ�����̵�';

SELECT 'COMMENT ON COLUMN ' || TABLE_NAME || '.' || COLUMN_NAME || ' IS '''';'
FROM COLS
WHERE TABLE_NAME = 'PROD';

COMMENT ON COLUMN PROD.PROD_ID IS '��ǰ���̵�';
COMMENT ON COLUMN PROD.PROD_NAME IS '��ǰ��';
COMMENT ON COLUMN PROD.PROD_LGU IS '��ǰ�з�';
COMMENT ON COLUMN PROD.PROD_BUYER IS '�ŷ�ó��';
COMMENT ON COLUMN PROD.PROD_COST IS '���Ű�';
COMMENT ON COLUMN PROD.PROD_PRICE IS '�ǸŰ�';
COMMENT ON COLUMN PROD.PROD_SALE IS '���ϰ�';
COMMENT ON COLUMN PROD.PROD_OUTLINE IS '��ǰ���';
COMMENT ON COLUMN PROD.PROD_DETAIL IS '��ǰ��';
COMMENT ON COLUMN PROD.PROD_IMG IS '��ǰ�̹���';
COMMENT ON COLUMN PROD.PROD_TOTALSTOCK IS '���';
COMMENT ON COLUMN PROD.PROD_INSDATE IS '�԰���';
COMMENT ON COLUMN PROD.PROD_PROPERSTOCK IS '�������';
COMMENT ON COLUMN PROD.PROD_SIZE IS 'ũ��';
COMMENT ON COLUMN PROD.PROD_COLOR IS '����';
COMMENT ON COLUMN PROD.PROD_DELIVERY IS '��۹��';
COMMENT ON COLUMN PROD.PROD_UNIT IS '����';
COMMENT ON COLUMN PROD.PROD_QTYIN IS '�԰�';
COMMENT ON COLUMN PROD.PROD_QTYSALE IS '���';
COMMENT ON COLUMN PROD.PROD_MILEAGE IS '���ϸ���';

-- �Է¾�� ui
SELECT '<tr><th>' || COMMENTS || '</th><td>' ||
    '<input class="form-control" type="' ||
    CASE
    WHEN DATA_TYPE = 'DATE' OR DATA_TYPE = 'NUMBER' THEN LOWER(DATA_TYPE)
    ELSE 'text'
    END || '" ' ||
    DECODE(NULLABLE, 'N', 'required ', '') ||
    'name="' || SNAKETOCAMEL(A.COLUMN_NAME) || '" VALUE="${' ||
    LOWER(A.TABLE_NAME) || '.' || SNAKETOCAMEL(A.COLUMN_NAME) || '}" />' ||
    '<span class="text-danger">${errors.' || SNAKETOCAMEL(A.COLUMN_NAME) ||
    '}</span></td></tr>'
FROM COLS A LEFT OUTER JOIN USER_COL_COMMENTS B
        ON (A.TABLE_NAME = B.TABLE_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
WHERE A.TABLE_NAME = 'PROD';

-- ����
INSERT INTO PROD (
    PROD_ID,
    PROD_NAME,
    PROD_LGU,
    PROD_BUYER,
    PROD_COST,
    PROD_PRICE,
    PROD_SALE,
    PROD_OUTLINE,
    PROD_DETAIL,
    PROD_IMG,
    PROD_TOTALSTOCK,
    PROD_INSDATE,
    PROD_PROPERSTOCK,
    PROD_SIZE,
    PROD_COLOR,
    PROD_DELIVERY,
    PROD_UNIT,
    PROD_QTYIN,
    PROD_QTYSALE,
    PROD_MILEAGE
) VALUES (
    (SELECT 'P101' || LPAD(SERIAL + 1, 6, '0') prod_id
    FROM (
        SELECT SUBSTR(PROD_ID, 5) SERIAL, RANK() OVER (ORDER BY SUBSTR(PROD_ID, 4) DESC) CUR
        FROM PROD
        WHERE SUBSTR(PROD_ID, 1, 4) = 'P101'
    )
    WHERE CUR = 1)
	    , #{prodName,jdbcType=VARCHAR}
	    , #{prodLgu,jdbcType=CHAR}
	    , #{prodBuyer,jdbcType=CHAR}
	    , #{prodCost,jdbcType=NUMERIC}
	    , #{prodPrice,jdbcType=NUMERIC}
	    , #{prodSale,jdbcType=NUMERIC}
	    , #{prodOutline,jdbcType=VARCHAR}
	    , #{prodDetail,jdbcType=CLOB}
	    , #{prodImg,jdbcType=VARCHAR}
	    , #{prodTotalstock,jdbcType=NUMERIC}
	    , TO_DATE(#{prodInsdate,jdbcType=DATE}, 'YYYY-MM-DD')
	    , #{prodProperstock,jdbcType=NUMERIC}
	    , #{prodSize,jdbcType=VARCHAR}
	    , #{prodColor,jdbcType=VARCHAR}
	    , #{prodDelivery,jdbcType=VARCHAR}
	    , #{prodUnit,jdbcType=VARCHAR}
	    , #{prodQtyin,jdbcType=NUMERIC}
	    , #{prodQtysale,jdbcType=NUMERIC}
	    , #{prodMileage,jdbcType=NUMERIC}
)

-- update
UPDATE prod
    SET prod_name = #{prodName,jdbcType=VARCHAR}
    , prod_lgu = #{prodLgu,jdbcType=CHAR}
    , prod_buyer = #{prodBuyer,jdbcType=CHAR}
    , prod_cost = #{prodCost,jdbcType=NUMERIC}
    , prod_price = #{prodPrice,jdbcType=NUMERIC}
    , prod_sale = #{prodSale,jdbcType=NUMERIC}
    , prod_outline = #{prodOutline,jdbcType=VARCHAR}
    , prod_detail = #{prodDetail,jdbcType=CLOB}
    , prod_img = #{prodImg,jdbcType=VARCHAR}
    , prod_totalstock = #{prodTotalstock,jdbcType=NUMERIC}
    , prod_insdate = TO_DATE(#{prodInsdate,jdbcType=DATE}, 'YYYY-MM-DD')
    , prod_properstock = #{prodProperstock,jdbcType=NUMERIC}
    , prod_size = #{prodSize,jdbcType=VARCHAR}
    , prod_color = #{prodColor,jdbcType=VARCHAR}
    , prod_delivery = #{prodDelivery,jdbcType=VARCHAR}
    , prod_unit = #{prodUnit,jdbcType=VARCHAR}
    , prod_qtyin = #{prodQtyin,jdbcType=NUMERIC}
    , prod_qtysale = #{prodQtysale,jdbcType=NUMERIC}
    , prod_mileage = #{prodMileage,jdbcType=NUMERIC}
WHERE
    prod_id = #{prodId,jdbcType=VARCHAR}
    
--------------------------------------------------------------------------------------
--(�ܲ�)
SELECT 'P909' || LPAD((NVL(TO_NUMBER(SUBSTR(MAX(PROD_ID), 5)), 0) + 1), 6, '0')
FROM PROD
WHERE PROD_LGU = 'P909'

INSERT INTO PROD (
    PROD_ID
    , PROD_NAME
    , PROD_LGU
    , PROD_BUYER
    , PROD_COST
    , PROD_PRICE
    , PROD_SALE
    , PROD_OUTLINE
    , PROD_DETAIL
    , PROD_IMG
    , PROD_TOTALSTOCK
    , PROD_INSDATE
    , PROD_PROPERSTOCK
    , PROD_SIZE
    , PROD_COLOR
    , PROD_DELIVERY
    , PROD_UNIT
    , PROD_QTYIN
    , PROD_QTYSALE
    , PROD_MILEAGE
)
SELECT #{prodLgu,jdbcType=CHAR} || LPAD((NVL(TO_NUMBER(SUBSTR(MAX(PROD_ID), 5)), 0) + 1), 6, '0')
    , #{prodName,jdbcType=VARCHAR}
    , #{prodLgu,jdbcType=CHAR}
    , #{prodBuyer,jdbcType=CHAR}
    , #{prodCost,jdbcType=NUMERIC}
    , #{prodPrice,jdbcType=NUMERIC}
    , #{prodSale,jdbcType=NUMERIC}
    , #{prodOutline,jdbcType=VARCHAR}
    , #{prodDetail,jdbcType=CLOB}
    , #{prodImg,jdbcType=VARCHAR}
    , #{prodTotalstock,jdbcType=NUMERIC}
    , TO_DATE(#{prodInsdate,jdbcType=DATE}, 'YYYY-MM-DD')
    , #{prodProperstock,jdbcType=NUMERIC}
    , #{prodSize,jdbcType=VARCHAR}
    , #{prodColor,jdbcType=VARCHAR}
    , #{prodDelivery,jdbcType=VARCHAR}
    , #{prodUnit,jdbcType=VARCHAR}
    , #{prodQtyin,jdbcType=NUMERIC}
    , #{prodQtysale,jdbcType=NUMERIC}
    , #{prodMileage,jdbcType=NUMERIC}
FROM PROD
WHERE PROD_LGU = #{prodLgu,jdbcType=CHAR}
------------------------------------------------------------------------------
;


ALTER TABLE MEMBER
ADD (MEM_ROLE VARCHAR2(20) DEFAULT 'ROLE_USER');

SELECT MEM_ID, MEM_ROLE
FROM MEMBER;

UPDATE MEMBER
SET MEM_ROLE = 'ROLE_USER'
WHERE MEM_ID = 'c001';

COMMIT;