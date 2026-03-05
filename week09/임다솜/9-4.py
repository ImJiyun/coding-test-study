# https://school.programmers.co.kr/learn/courses/30/lessons/181879

def solution(num_list):
    answer = 0
    if len(num_list) >= 11:
        answer = sum(num_list)
    else:
        answer = num_list[0]
        for x in num_list[1:]:
            answer *= x
    return answer