# https://school.programmers.co.kr/learn/courses/30/lessons/120897

import math

def solution(n):
    answer = []
    for x in range(1, int(math.sqrt(n)) + 1):
        if n % x == 0:
            answer.append(x)
            if (n != x * x):
                answer.append(n//x)
    answer.sort()
    return answer