# https://school.programmers.co.kr/learn/courses/30/lessons/120836

import math
def solution(n):
    answer = 0
    for x in range(1, math.isqrt(n) + 1):
        if x * x == n:
            answer += 1
        elif n % x == 0:
            answer += 2
    return answer