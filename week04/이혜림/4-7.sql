-- 7. [Find Emotionally Consistent Users](https://leetcode.com/problems/find-emotionally-consistent-users/description/)
-- 문제 : 다음 요구 사항을 기반으로 감정적으로 일관된 사용자를 식별할 수 있는 솔루션을 작성합니다.
-- 각 사용자가 받은 총 반응 횟수를 세어 보세요.
-- 최소 5개의 다른 콘텐츠 항목에 반응한 사용자만 포함됩니다.
-- 사용자의 반응 중 최소 60%가 동일한 유형이라면 감정적으로 일관된 것으로 간주됩니다.
-- 결과 테이블을 내림차순으로 reaction_ratio 순서대로, 그리고 오름차순으로 user_id 순서대로 반환합니다.

-- 컬럼 : user_id, dominant_reaction, reaction_ratio
-- ㄴ 조건 : reaction_ratio 소수점 이하 두자리 반올림
-- 정렬 : reaction_ratio DESC, user_id