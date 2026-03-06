-- https://leetcode.com/problems/dna-pattern-recognition/

SELECT
    sample_id,
    dna_sequence,
    species,
    IF(dna_sequence LIKE 'ATG%', 1, 0) AS has_start,
    IF((dna_sequence LIKE '%TAA') OR (dna_sequence LIKE '%TAG') OR (dna_sequence LIKE '%TGA'), 1, 0) AS has_stop,
    IF(dna_sequence LIKE '%ATAT%', 1, 0) AS has_atat,
    IF(dna_sequence LIKE '%GGG%', 1, 0) AS has_ggg
FROM Samples
ORDER BY
    sample_id;

// 더 좋은 버전
SELECT
    sample_id,
    dna_sequence,
    species,
    dna_sequence REGEXP '^ATG' AS has_start,
    dna_sequence REGEXP 'TAA$|TAG$|TGA$' AS has_stop,
    dna_sequence REGEXP 'ATAT' AS has_atat,
    dna_sequence REGEXP 'GGG' AS has_ggg
FROM Samples
ORDER BY
    sample_id;