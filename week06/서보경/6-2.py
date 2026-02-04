def solution(a, b):
    symbol1 = int(str(a) + str(b))
    symbol2 = 2*a*b
    if symbol1 >= symbol2:
        return symbol1
    else: 
        return symbol2