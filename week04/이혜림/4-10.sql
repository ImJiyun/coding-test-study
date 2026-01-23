-- 10. [Movie Rating](https://leetcode.com/problems/movie-rating/description/)
-- 문제 : 가장 많은 영화를 평가한 사용자의 이름을 찾아보세요. 동점일 경우 사전적으로 작은 사용자 이름을 반환합니다.
-- 2020년 2월에 평균 평점이 가장 높은 영화 이름을 찾아보세요. 동점일 경우 사전적으로 작은 영화 이름을 반환합니다.
-- 컬럼 : results
-- 테이블 : MovieRating, Movies, Users
-- KEY : movie_id, user_id

-- 각각 구하긴 했는데 어떻게 results라는 한 컬럼에 넣지? : UNION ALL
(
    SELECT
        name AS results
    FROM (
        SELECT 
            u.name,
            COUNT(*) AS cnt
        FROM movierating mr
        JOIN users u 
        USING (user_id)
        GROUP BY 
            mr.user_id, 
            u.name
    ) a
    ORDER BY cnt DESC, name
    LIMIT 1
)
UNION ALL
(
    SELECT
        title AS results
    FROM (
        SELECT
            m.title,
            AVG(mr.rating) AS avg_rating
        FROM movierating mr
        JOIN movies m 
            USING (movie_id)
        WHERE mr.created_at >= DATE '2020-02-01'
          AND mr.created_at <  DATE '2020-03-01'
        GROUP BY 
            m.movie_id, 
            m.title
    ) b
    ORDER BY avg_rating DESC, title
    LIMIT 1
)