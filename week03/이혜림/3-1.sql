-- 컬럼 FILE_PATH
-- 테이블 : USED_GOODS_BOARD(->BASE), USED_GOODS_FILE
-- USING KEY : BOARD_ID
-- 조건 : 조회수가 가장 높은 게시물
-- 문제 : 게시물에 대한 첨부파일 경로 조회
-- 정렬 : FILE_ID 기준 내림차순

WITH BASE AS(
    SELECT
        BOARD_ID
    FROM USED_GOODS_BOARD
    GROUP BY
        BOARD_ID
    ORDER BY VIEWS DESC
    LIMIT 1
 )       
    
SELECT
    CONCAT(
        '/home/grep/src/',
        F.BOARD_ID, '/',
        F.FILE_ID,
        F.FILE_NAME,
        F.FILE_EXT
    ) AS FILE_PATH
FROM BASE B
JOIN USED_GOODS_FILE F
USING(BOARD_ID)
ORDER BY F.FILE_ID DESC