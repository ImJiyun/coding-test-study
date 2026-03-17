# a, b, c = slicer
# 파이썬에서 등호(=)를 기준으로 오른쪽에 있는 값을 왼쪽 변수에 담는다는 원칙을 기억해야 함.
#이미 값이 들어있는 slicer에서 a, b, c를 꺼내려고 하는 상황

def solution(n, slicer, num_list):
    a, b, c = slicer
    if n == 1:
        return num_list[:b+1]
    elif n == 2:
        return num_list[a:]
    elif n == 3:
        return num_list[a:b+1]
    elif n == 4:
        return num_list[a:b+1:c]