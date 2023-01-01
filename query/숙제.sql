-- 1. 남녀 성별 인원수 조회

SELECT
	COUNT(CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('1', '3') THEN 1 END) MALE,
	COUNT(CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4') THEN 1 END) FEMALE
FROM MEMBER

-- 2. 지금까지 한번도 상품을 구매한 적이 없는 회원의 인적사항 조회(아이디, 이름, 이메일)

SELECT
	A.MEM_ID	아이디,
	A.MEM_NAME	이름,
	A.MEM_MAIL	메일
FROM	MEMBER A
LEFT OUTER JOIN	CART B  ON	A.MEM_ID = B.CART_MEMBER
WHERE	B.CART_MEMBER IS NULL

-- 3. 등록된 상품이 한건도 없는 상품분류 조회(상품분류코드, 분류명)

SELECT
    LPROD_GU    상품분류코드,
    LPROD_NM    분류명
FROM    LPROD A
LEFT OUTER JOIN PROD B  ON  A.LPROD_GU = B.PROD_LGU
WHERE   B.PROD_ID IS NULL  

-- 4. 지금까지 가장 많이 팔린 상품 조회(상품코드, 상품명, 상품분류명, 거래처명, 마일리지)

SELECT  *
FROM    (
    WITH CARTVIEW AS (
        SELECT 
            CART_PROD,
            SUM(CART_QTY) CNT
        FROM    CART
        INNER JOIN PROD ON  (CART_PROD = PROD_ID)
        INNER JOIN MEMBER ON (CART_MEMBER = MEM_ID)
        GROUP BY CART_PROD
        ORDER BY 1 ASC
    )
    SELECT
        PROD_ID 상품코드,
        PROD_NAME   상품명,
        LPROD_NM    상품분류명,
        BUYER_NAME  거래처명,
        PROD_MILEAGE    마일리지,
        CARTVIEW.CNT
    FROM   PRODVIEW
    LEFT OUTER JOIN CARTVIEW ON (PROD_ID = CART_PROD)
    WHERE CNT IS NOT NULL
    ORDER BY 6 DESC
)
WHERE ROWNUM = 1

-- 5. 지금까지 가장 적게 팔린 상품 조회(상품코드, 상품명, 상품분류명, 거래처명, 마일리지)

SELECT  *
FROM    (
    WITH CARTVIEW AS (
        SELECT 
            CART_PROD,
            SUM(CART_QTY) CNT
        FROM    CART
        INNER JOIN PROD ON  (CART_PROD = PROD_ID)
        INNER JOIN MEMBER ON (CART_MEMBER = MEM_ID)
        GROUP BY CART_PROD
        ORDER BY 1 ASC
    )
    SELECT
        PROD_ID 상품코드,
        PROD_NAME   상품명,
        LPROD_NM    상품분류명,
        BUYER_NAME  거래처명,
        PROD_MILEAGE    마일리지,
        CARTVIEW.CNT
    FROM   PRODVIEW
    LEFT OUTER JOIN CARTVIEW ON (PROD_ID = CART_PROD)
    WHERE CNT IS NOT NULL
    ORDER BY 6 ASC
)
WHERE ROWNUM = 1

-- 6. 거래처 중 거래 품목 수가 가장 많은 거래처 조회(거래처코드, 거래처명, 거래처분류명, 담당자명)
--SELECT
--    BUYER_ID,
--    BUYER_NAME,
--    BUYER_LGU,
--    BUYER_CHARGER
--FROM BUYER
--WHERE BUYER_ID = (
--    SELECT BUYER_ID
--    FROM (
--        SELECT
--            B.BUYER_ID,
--            COUNT(A.PROD_ID)
--        FROM    PROD A
--        INNER JOIN  BUYER B ON (A.PROD_BUYER = B.BUYER_ID)
--        GROUP BY    B.BUYER_ID
--        ORDER BY    2 DESC
--    )
--    WHERE ROWNUM = 1
--)

SELECT
    BUYER_ID    거래처코드,
    BUYER_NAME  거래처명,
    BUYER_LGU   거래처분류명,
    BUYER_CHARGER   담당자명
FROM    (
    SELECT
        B.BUYER_ID,
        B.BUYER_NAME,
        B.BUYER_LGU,
        B.BUYER_CHARGER,
        DENSE_RANK() OVER (ORDER BY COUNT(A.PROD_ID) DESC) RNK
    FROM    PROD A
    INNER JOIN  BUYER B ON (A.PROD_BUYER = B.BUYER_ID)
    GROUP BY    B.BUYER_ID,  B.BUYER_NAME, B.BUYER_LGU, B.BUYER_CHARGER
)
WHERE RNK = 1

-- 7.   거래처 중 거래 품목 수가 가장 적은 거래처 조회(거래처코드, 거래처명, 거래처분류명, 담당자명)

SELECT
    BUYER_ID    거래처코드,
    BUYER_NAME  거래처명,
    BUYER_LGU   거래처분류명,
    BUYER_CHARGER   담당자명
FROM    (
    SELECT
        B.BUYER_ID,
        B.BUYER_NAME,
        B.BUYER_LGU,
        B.BUYER_CHARGER,
        DENSE_RANK() OVER (ORDER BY COUNT(A.PROD_ID) ASC) RNK
    FROM    PROD A
    INNER JOIN  BUYER B ON (A.PROD_BUYER = B.BUYER_ID)
    GROUP BY    B.BUYER_ID,  B.BUYER_NAME, B.BUYER_LGU, B.BUYER_CHARGER
)
WHERE RNK = 1

-- 8. 남녀 성별 각각 구매율이 높은 상품 조회(성별, 상품코드, 상품명, 분류명)
SELECT
    CASE WHEN MCNT > FCNT THEN '남' ELSE '여' END 성별,
    C.PROD_ID 상품코드,
    C.PROD_NAME 상품명,
    C.LPROD_NM 분류명
FROM (
SELECT
        CART_PROD MC,
        MSEX,
        SUM(CART_QTY) MCNT
    FROM(
        SELECT
            CART_PROD,
            CART_QTY,
            CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('1', '3') THEN '남' WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4') THEN '여' ELSE 'OTHER' END MSEX
        FROM    CART
        INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
        ORDER BY CART_PROD
    )
    WHERE MSEX = '남'
    GROUP BY  CART_PROD, MSEX
    ORDER BY CART_PROD ASC, MCNT DESC
) A, (
    SELECT
        CART_PROD FC,
        FSEX,
        SUM(CART_QTY) FCNT
    FROM(
        SELECT
            CART_PROD,
            CART_QTY,
            CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('1', '3') THEN '남' WHEN SUBSTR(MEM_REGNO2, 1, 1) IN ('2', '4') THEN '여' ELSE 'OTHER' END FSEX
        FROM    CART
        INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
        ORDER BY CART_PROD
    )
    WHERE FSEX = '여'
    GROUP BY  CART_PROD, FSEX
    ORDER BY CART_PROD ASC, FCNT DESC
) B, PRODVIEW C
WHERE A.MC = B.FC
AND A.MC = PROD_ID
-- 9. 각 회원별 구매 총액 조회(회원아이디, 회원명, 구매총액)

SELECT
    CART_MEMBER,
    MEM_NAME,
    SUM(CART_QTY * PROD_SALE) 구매총액
FROM CART
INNER JOIN PROD ON CART_PROD = PROD_ID
INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
GROUP BY    CART_MEMBER, MEM_NAME
ORDER BY CART_MEMBER

-- 10. 각 상품별 구매왕 조회(구매왕아이디, 회원명, 구매총액)
SELECT
    DISTINCT A.PROD_ID,
    A.CART_MEMBER,
    A.MEM_NAME,
    A.TOTAL
FROM (
    SELECT
        PROD_ID,
        CART_MEMBER,
        MEM_NAME,
        SUM(CART_QTY * PROD_SALE) TOTAL
    FROM CART
    INNER JOIN PROD ON CART_PROD = PROD_ID
    INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
    GROUP BY    PROD_ID, CART_MEMBER, MEM_NAME
) A, (
    SELECT
        PROD_ID,
        MAX(TOTAL) MAXX
    FROM (
        SELECT
            PROD_ID,
            CART_MEMBER,
            MEM_NAME,
            SUM(CART_QTY * PROD_SALE) TOTAL
        FROM CART
        INNER JOIN PROD ON CART_PROD = PROD_ID
        INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
        GROUP BY    PROD_ID, CART_MEMBER, MEM_NAME
        ORDER BY PROD_ID ASC, TOTAL DESC
    )
    GROUP BY PROD_ID
) B
WHERE A.TOTAL = B.MAXX
ORDER BY PROD_ID

-- WITH로 하면 깔끔하게 할 수 있을 듯?

--SELECT
--    PROD_ID,
--    MAX(TOTAL)
--FROM (
--    SELECT
--        PROD_ID,
--        CART_MEMBER,
--        MEM_NAME,
--        SUM(CART_QTY * PROD_SALE) TOTAL
--    FROM CART
--    INNER JOIN PROD ON CART_PROD = PROD_ID
--    INNER JOIN MEMBER ON CART_MEMBER = MEM_ID
--    GROUP BY    PROD_ID, CART_MEMBER, MEM_NAME
--    ORDER BY PROD_ID ASC, TOTAL DESC
--)
--GROUP BY PROD_ID
--ORDER BY PROD_ID
