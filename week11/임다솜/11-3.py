# https://school.programmers.co.kr/learn/courses/30/lessons/181912

def solution(intStrs, k, s, l):
    answer = []
    for x in intStrs:
        n = int(x[s:s+l])
        if n > k:
            answer.append(n)
    return answer