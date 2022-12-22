SELECT 'private ' ||
    DECODE( DATA_TYPE, 'NUMBER', 'Integer ', 'String ') ||
    LOWER(SUBSTR((COLUMN_NAME), 1, 1)) ||
    SUBSTR(REPLACE(INITCAP(COLUMN_NAME) , '_', ''), 2) || ';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER';