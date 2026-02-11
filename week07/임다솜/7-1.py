# https://school.programmers.co.kr/learn/courses/30/lessons/181926?language=python3

def solution(n, control):
    for x in control:
        if x == "w":
            n += 1
        elif x =="s":
            n -= 1
        elif x == "d":
            n += 10
        elif x == "a":
            n -= 10
    return n