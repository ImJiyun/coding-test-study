from collections import defaultdict

def solution(strArr):

    d = defaultdict(list)
    
    for str in strArr:
        d[len(str)].append(str)
    
    return max(len(lst) for lst in d.values())