def solution(my_string, indices):
    ms_list = list(my_string)
    for i in indices:
        ms_list[i] = ""
    return "".join(ms_list)