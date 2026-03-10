# https://school.programmers.co.kr/learn/courses/30/lessons/181868

def solution(my_string):
    lst = my_string.split(' ')
    answer = [x for x in lst if x != '']
    return answer