def solution(numbers, k):
    n = len(numbers)
    idx = 0
    for _ in range(k-1):
        idx = (idx + 2) % n
    return numbers[idx]
    