def solution(myString, pat):
    whole = len(myString) 
    part = len(pat)
    
    cnt = 0
    for i in range(0, whole - part + 1):
        if myString[i: i + part] == pat:
            cnt += 1
    return cnt