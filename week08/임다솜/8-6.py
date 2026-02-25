# https://school.programmers.co.kr/learn/courses/30/lessons/120904

def solution(num, k):
    snum = str(num)
    answer = snum.find(str(k))
    return answer + 1 if answer != -1 else -1
