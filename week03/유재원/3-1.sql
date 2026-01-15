# ¿À´ä

WITH BASE AS (
    SELECT
        FILE_ID,
        BOARD_ID,
        FILE_NAME,
        FILE_EXT,
        MAX(VIEWS) AS MAX_VIEW
    FROM USED_GOODS_BOARD
    LEFT JOIN USED_GOODS_FILE
    USING (BOARD_ID)
    GROUP BY
        FILE_ID,
        BOARD_ID,
        FILE_NAME,
        FILE_EXT
    ORDER BY
        MAX_VIEW DESC,
        FILE_ID DESC
    LIMIT 1
    
        
        
)

SELECT
    CONCAT("/home/grep/src/",BOARD_ID,'/',FILE_ID,FILE_NAME,FILE_EXT) AS FILE_PATH
FROM BASE