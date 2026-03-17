# https://school.programmers.co.kr/learn/courses/30/lessons/120842

def solution(num_list, n):
    answer = []
    cnt = int(len(num_list))
    for x in range(0,cnt,n):
        answer.append(num_list[x:x + n])
    return answer