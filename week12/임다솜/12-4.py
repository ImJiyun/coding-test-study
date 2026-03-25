# https://school.programmers.co.kr/learn/courses/30/lessons/181859

def solution(arr):
    stk = []
    for i in range(len(arr)):
        if i == 0:
            stk.append(arr[i])
        elif stk and stk[-1] == arr[i]:
            stk.pop()
        else:
            stk.append(arr[i])
            
    if stk == []:
        return [-1]
    return stk