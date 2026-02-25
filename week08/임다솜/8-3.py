# https://school.programmers.co.kr/learn/courses/30/lessons/120895

def solution(my_string, num1, num2):
    lst = list(my_string)
    # temp = my_string[num1]
    lst[num1] = my_string[num2]
    lst[num2] = my_string[num1]
    return ''.join(lst)