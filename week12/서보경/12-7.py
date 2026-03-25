def solution(my_string, s, e):
    ms_list = list(my_string)
    ms_list[s:e+1] = ms_list[s:e+1][::-1]
    return "".join(ms_list)