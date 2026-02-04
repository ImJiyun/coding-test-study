def solution(a, b):
    plus_first = int(str(a) + str(b))
    plus_second = int(str(b) + str(a))
    
    return plus_first if plus_first >= plus_second else plus_second