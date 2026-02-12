# https://school.programmers.co.kr/learn/courses/30/lessons/120912?language=python3

def solution(array):
    answer = 0
    s = ''.join(map(str, array))
    return s.count("7")
