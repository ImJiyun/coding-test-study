def solution(array, n):
    tmp = []
    
    for num in array:
        tmp.append((num, abs(num - n)))
        
    return sorted(tmp, key=lambda x: (x[1], x[0]))[0][0]