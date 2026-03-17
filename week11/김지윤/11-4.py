def solution(myString, pat):
    reversed_str = myString[::-1]
    reversed_pat = pat[::-1]
    f_idx = reversed_str.index(reversed_pat)
    return reversed_str[f_idx:][::-1]