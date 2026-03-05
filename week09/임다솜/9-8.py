# https://school.programmers.co.kr/learn/courses/30/lessons/181870

def solution(strArr):
    answer = [x for x in strArr if x.find('ad') == -1]
    return answer