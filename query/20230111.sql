--member.memId=ȸ�����̵�

SELECT LOWER(TABLE_NAME)||'.'||SNAKETOCAMEL(COLUMN_NAME)||'='|| COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';

SELECT LOWER(TABLE_NAME)||'.'||SNAKETOCAMEL(COLUMN_NAME)||'='||COLUMN_NAME
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';


�̰� �Է¾�� UI ���� �ڵ������̶� ��ġ�� ��