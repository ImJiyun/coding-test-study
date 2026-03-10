def solution(strArr):
    lens = [len(x) for x in strArr]
    return max(lens.count(length) for length in set(lens))