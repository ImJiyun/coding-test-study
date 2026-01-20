-- 컬럼 : ITEM_ID, ITEM_NAME, RARITY
-- 테이블 : ITEM_INFO, ITEM_TREE
-- USING KEY : ITEM_ID
-- 조건 : 더이상 업그레이드 할 수 없는 아이템
-- 정렬 : ITEM_ID 내림차순

WITH BASE AS(
    SELECT
        A.ITEM_ID,
        COUNT(B.ITEM_ID) AS child_count
    FROM ITEM_TREE A
    LEFT JOIN ITEM_TREE B
        ON A.ITEM_ID = B.PARENT_ITEM_ID
    GROUP BY
        A.ITEM_ID
    HAVING
        child_count = 0
)
SELECT 
    ITEM_ID,
    ITEM_NAME, 
    RARITY
FROM BASE base
JOIN ITEM_INFO
USING (ITEM_ID)
GROUP BY
    ITEM_ID, 
    ITEM_NAME, 
    RARITY
ORDER BY ITEM_ID DESC