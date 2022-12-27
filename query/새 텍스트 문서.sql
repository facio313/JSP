--member.setMemId(memId);
SELECT LOWER(TABLE_NAME) || '.set' ||  REPLACE( INITCAP( COLUMN_NAME ), '_', '') || 
       '(' || SNAKETOCAMEL(COLUMN_NAME) || ');' 
  FROM COLS
 WHERE TABLE_NAME = 'MEMBER'