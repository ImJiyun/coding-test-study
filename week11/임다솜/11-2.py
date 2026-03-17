# https://school.programmers.co.kr/learn/courses/30/lessons/181860

def solution(arr, flag):
    answer = []
    for x in range(len(arr)):
        if flag[x]:
            for y in range(arr[x] * 2):
                answer.append(arr[x])
        else:
            n = arr[x]
            answer = answer[:-n]
    return answer