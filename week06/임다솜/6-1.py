# https://school.programmers.co.kr/learn/courses/30/lessons/181933?language=python3

def solution(a, b, flag):
    answer = 0
    if flag:
        answer = a + b
    else:
        answer = a - b
    return answer