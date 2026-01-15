SELECT 
    CONCAT('/home/grep/src/', t1.BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
FROM 
    USED_GOODS_BOARD t1
JOIN 
    USED_GOODS_FILE t2
ON
    t1.BOARD_ID = t2.BOARD_ID
WHERE 
    t1.BOARD_ID = (
        SELECT 
            BOARD_ID
        FROM 
            USED_GOODS_BOARD
        ORDER BY 
            VIEWS DESC
        LIMIT 1
    )
ORDER BY 
    FILE_ID DESC