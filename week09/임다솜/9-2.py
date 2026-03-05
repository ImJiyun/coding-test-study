# https://school.programmers.co.kr/learn/courses/30/lessons/181886

def solution(names):
    answer = [x for i, x in enumerate(names) if i % 5 == 0]
    return answer