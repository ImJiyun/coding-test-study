def solution(my_string, queries):
    ms_list = list(my_string)
    for s, e in queries:
        ms_list[s:e+1] = ms_list[s:e+1][::-1]
    return "".join(ms_list)