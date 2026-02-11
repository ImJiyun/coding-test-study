# https://school.programmers.co.kr/learn/courses/30/lessons/181925?language=python3

def solution(numLog):
    ret = ''
    for i in range(len(numLog) - 1):
        gap = numLog[i + 1] - numLog[i]
        if gap == 1:
            ret += "w"
        elif gap == -1:
            ret += "s"
        elif gap == 10:
            ret += "d"
        elif gap == -10: 
            ret += "a"
    return ret