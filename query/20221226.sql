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