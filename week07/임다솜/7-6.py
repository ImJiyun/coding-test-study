# https://school.programmers.co.kr/learn/courses/30/lessons/120888?language=python3

def solution(my_string):
    # s = set(my_string) 순서 보존 안됨
    answer = ''
    for x in my_string:
        if x in answer:
            continue
        answer += x
    return answer
