--#{memId, jdbcType=VARCHAR}

SELECT ', #(' || SNAKETOCAMEL(COLUMN_NAME) || ',' || 'jdbcType=' ||
    CASE    
        WHEN DATA_TYPE = 'VARCHAR2' THEN 'VARCHAR'
        WHEN DATA_TYPE = 'NUMBER' THEN 'NUMERIC'
        ELSE DATA_TYPE
    END || '}'
FROM COLS
WHERE TABLE_NAME = 'MEMBER';



--member.setMemId(memId);
SELECT LOWER(TABLE_NAME) || '.set' ||  REPLACE( INITCAP( COLUMN_NAME ), '_', '') || 
       '(' || SNAKETOCAMEL(COLUMN_NAME) || ');' 
  FROM COLS
 WHERE TABLE_NAME = 'MEMBER'