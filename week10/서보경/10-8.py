def solution(array, n):
    array.sort()
    return min(array, key=lambda x: abs(x-n))