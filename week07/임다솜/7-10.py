# https://school.programmers.co.kr/learn/courses/30/lessons/120896?language=python3

def solution(s):
    answer = ''
    for x in s:
        if s.count(x) == 1:
            answer += x
    return ''.join(sorted(answer))