def solution(n):
    cnt = 0
    for num in range(1, n+1):
        if not is_prime(num):
            cnt += 1
    return cnt

def is_prime(n):
    for num in range(2, n//2 + 1):
        if n % num == 0:
            return False
    return True