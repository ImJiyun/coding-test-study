def solution(n):
    answer = 0
    
    if n % 2 == 1:
        for num in range(1, n+1):
            if num % 2 == 1:
                answer += num
    else:
        for num in range(2, n+1):
            if num % 2 == 0:
                answer += num ** 2
            
    return answer


def solution2(n):
    if n % 2 == 0:
        return sum(i * i for i in range(1, n+1) if i % 2 == 0)
    else:
        return sum(i for i in range(1, n+1) if i % 2 == 1)