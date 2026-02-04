# https://school.programmers.co.kr/learn/courses/30/lessons/181939

def solution(a, b):
    answer = 0
    a, b = str(a), str(b)
    norm = ''.join([a, b])
    rev = ''.join([b, a])
    answer = max(int(norm), int(rev))
    return answer