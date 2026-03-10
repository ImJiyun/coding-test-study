# https://school.programmers.co.kr/learn/courses/30/lessons/181880

def solution(num_list):
    answer = 0
    for x in num_list:
        while x != 1:
            x = x // 2
            answer += 1
    return answer
