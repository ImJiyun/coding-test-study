# https://school.programmers.co.kr/learn/courses/30/lessons/181928

def solution(num_list):
    answer = 0
    odd, even = '', ''
    for x in range(len(num_list)):
        if num_list[x] % 2:
            odd += str(num_list[x])
        else:
            even += str(num_list[x])
    answer = int(even) + int(odd)
    return answer