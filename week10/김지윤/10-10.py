def solution(arr):
    if 2 not in arr:
        return [-1]
    
    f_idx = arr.index(2)
    
    l_idx = arr[::-1].index(2)
    
    return arr[f_idx:len(arr) - l_idx]