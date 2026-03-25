# https://school.programmers.co.kr/learn/courses/30/lessons/181900?language=python3

def solution(my_string, indices):
    answer = ''
    for x in range(len(my_string)):
        if x not in indices:
            answer += my_string[x]
    return answer