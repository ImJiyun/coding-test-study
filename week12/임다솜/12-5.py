# https://school.programmers.co.kr/learn/courses/30/lessons/181890

def solution(str_list):
    answer = []
    if "l" not in str_list and "r" not in str_list:
        return []
    f_l = str_list.index("l") if "l" in str_list else len(str_list)
    f_r = str_list.index("r") if "r" in str_list else len(str_list)
    if f_l < f_r:
        return str_list[:f_l]
    return str_list[f_r + 1 :]