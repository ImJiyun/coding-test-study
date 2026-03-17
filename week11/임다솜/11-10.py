# https://school.programmers.co.kr/learn/courses/30/lessons/120843

def solution(numbers, k):
    answer = 0
    next = 1 + 2 * (k - 1)
    answer = next % len(numbers)
    return numbers[answer - 1]