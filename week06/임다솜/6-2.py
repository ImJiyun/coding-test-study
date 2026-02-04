# https://school.programmers.co.kr/learn/courses/30/lessons/181938

def solution(a, b):
    answer = 0
    join = ''.join([str(a), str(b)])
    cal = 2 * a * b
    answer = max(int(join), cal)
    return answer