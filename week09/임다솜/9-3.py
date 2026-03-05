# https://school.programmers.co.kr/learn/courses/30/lessons/181884

def solution(numbers, n):
    answer = 0
    for x in numbers:
        answer += x
        if answer > n:
            break
    return answer