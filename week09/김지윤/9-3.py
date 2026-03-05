def solution(numbers, n):
    total = 0
    for number in numbers:
        total += number
        if total > n:
            return total