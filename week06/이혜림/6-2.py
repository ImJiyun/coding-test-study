def solution(a, b):
    answer = 0
    num1 = str(a)+str(b)
    num2 = 2*int(a)*int(b)
    if int(num1) >= int(num2):
        answer = int(num1)
    else:
        answer = int(num2)
    return answer