def solution(n):
    factorial = 1
    for i in range(1, n + 1):
        factorial *= i
        if factorial == n:
            return i
        if factorial > n:
            return i - 1
        
def solution2(n):
    factorial = 1
    i = 1
    while True:
        factorial *= i
        if factorial == n:
            return i
        if factorial > n:
            return i - 1
        i += 1