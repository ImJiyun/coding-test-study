# INS : 동물 보호소에 들어온 동물의 정보
# OUTS : 동물 보호소에서 입양 보낸 동물의 정보
# 아직 입양을 못 간 동물: INS 테이블에는 존재, OUTS 테이블에는 없음
    # LEFT JOIN 후 ANIMAL_OUTS ANIMAL_ID IS NULL
# 가장 오래 보호소에 있었던 동물 3마리 구하기
    # INS 테이블에 있는 동물 중 DATETIME 빠른 것


SELECT 
    i.NAME, 
    i.DATETIME
FROM 
    ANIMAL_INS i
LEFT JOIN 
    ANIMAL_OUTS o
  ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE 
    o.ANIMAL_ID IS NULL
ORDER BY 
    i.DATETIME ASC
LIMIT 
    3    