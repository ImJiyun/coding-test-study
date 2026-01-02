-- https://school.programmers.co.kr/learn/courses/30/lessons/273710

SELECT
    root.ITEM_ID AS ITEM_ID,
    info.ITEM_NAME AS ITEM_NAME
FROM (
SELECT
    *
FROM ITEM_TREE
WHERE
    PARENT_ITEM_ID IS NULL
) AS root
LEFT JOIN ITEM_INFO AS info
ON root.ITEM_ID = info.ITEM_ID
ORDER BY
    ITEM_ID