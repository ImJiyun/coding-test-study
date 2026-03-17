def solution(intStrs, k, s, l):
    result = [int(string[s:s+l]) for string in intStrs]
    
    return [num for num in result if num > k]