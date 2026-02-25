# https://school.programmers.co.kr/learn/courses/30/lessons/120862

def solution(numbers):
    answer = numbers[0] * numbers[1]
    for x in range(len(numbers)):
        for y in range(x + 1, len(numbers)):
            answer = max(numbers[x] * numbers[y], answer)      
    return answer