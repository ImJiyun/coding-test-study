def solution(n):
    answer = 0
    for (int i = 1; i <= n; i++)   
        if (n % 2 == 0):
            answer += (i * 2) * 2
        else:
            answer += (i + 1) / 2
    return answer

//미완성