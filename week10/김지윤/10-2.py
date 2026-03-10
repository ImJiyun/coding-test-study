def solution(num_list):
    answer = 0
    def operate(num):
        if num % 2 == 0:
            return num / 2
        else:
            return (num-1) / 2
    
    for num in num_list:
        cnt = 0
        while num != 1:
            num = operate(num)
            cnt += 1
        answer += cnt
    return answer