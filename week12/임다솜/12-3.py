# https://school.programmers.co.kr/learn/courses/30/lessons/181883

def solution(arr, queries):
    for x in range(len(queries)):
        s, e = queries[x]
        for i in range(s,e + 1):
            arr[i] = arr[i] + 1
    return arr