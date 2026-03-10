# https://school.programmers.co.kr/learn/courses/30/lessons/181855

# from collections import Counter

def solution(strArr):
    lst = [len(x) for x in strArr]
    dit = {}
    for x in lst:
        if x in dit:
            dit[x] += 1
        else:
            dit[x] = 1
    answer = max(dit, key = dit.get)
    # answer = max(Counter(lst).values())
    return dit[answer]