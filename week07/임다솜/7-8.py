# https://school.programmers.co.kr/learn/courses/30/lessons/120835?language=python3

def solution(emergency):
    answer = []
    s = sorted(emergency, reverse=True)
    for x in emergency:
        answer.append(s.index(x) + 1)
    return answer