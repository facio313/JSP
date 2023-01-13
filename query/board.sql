select *
from freeboard a left outer join attach b on (a.bo_no = b.bo_no)

select count(*)
from freeboard

WITH    ORDERED AS (
    select *
    from freeboard a left outer join attach b on (a.bo_no = b.bo_no)
    ORDER BY a.BO_NO DESC, a.rowid;
)
SELECT  A.*
FROM    (
    SELECT  ROWNUM RNUM, ORDERED.*
    FROM ORDERED
) A
WHERE RNUM BETWEEN 1 AND 5

WITH ORDEREDBOARD AS (
    SELECT BO_NO, BO_TITLE, BO_WRITER, BO_MAIL, BO_DATE, BO_HIT
            ,(
                SELECT COUNT(ATT_NO)
                FROM ATTACH
                WHERE ATTACH.BO_NO = FREEBOARD.BO_NO
            ) ATT_COUNT
    FROM FREEBOARD
    ORDER BY BO_NO DESC
)
SELECT A.*
FROM (
    SELECT ROWNUM RNUM, ORDEREDBOARD.*
    FROM ORDEREDBOARD
) A 
WHERE RNUM BETWEEN 11 AND 20

SELECT COUNT(ATT_NO) -- SCHOLAR DATA
FROM ATTACH
WHERE BO_NO = 100;

-- ÁßÃ¸Äõ¸® 3°¡Áö ÇüÅÂ
-- INLINE VIEW
-- SELECTÀý -> SCHOLAR DATA