# https://school.programmers.co.kr/learn/courses/30/lessons/181871?language=python3

def solution(myString, pat):
    answer = 0;
    x = 0;
    while x != -1:
        ret = myString.find(pat, x)
        if ret != -1:
            answer += 1
            x = ret + 1
        else:
            x = -1
    return answer