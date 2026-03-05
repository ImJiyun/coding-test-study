# https://school.programmers.co.kr/learn/courses/30/lessons/181867

def solution(myString):
    answer = [len(x) for x in myString.split('x')]
    return answer