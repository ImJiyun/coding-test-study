# https://school.programmers.co.kr/learn/courses/30/lessons/181937

def solution(num, n):
    answer = 0
    isMultiple = num % n
    if isMultiple == 0:
        answer = 1
    else:
        answer = 0
    return answer