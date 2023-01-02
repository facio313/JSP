WITH    ORDEREDPROD AS (
    SELECT  PROD_ID, PROD_NAME, PROD_COST, PROD_PRICE
            , LPROD_NM, BUYER_NAME "buyer.buyerName"
            , (
                SELECT COUNT(DISTINCT CART_MEMBER) FROM CART
                WHERE CART_PROD = PROD_ID
            ) MEM_COUNT
    FROM    PRODVIEW
    ORDER BY PROD_LGU, ROWID DESC
)
SELECT  A.*
FROM    (
    SELECT  ROWNUM RNUM, ORDEREDPROD.*
    FROM ORDEREDPROD
) A
WHERE RNUM BETWEEN 11 AND 20