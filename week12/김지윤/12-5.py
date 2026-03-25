def solution(str_list):
    try:
        l_idx = str_list.index("l")
    except ValueError:
        l_idx = float('inf')
        
    try:
        r_idx = str_list.index("r")
    except ValueError:
        r_idx = float('inf')
    
    if l_idx == float('inf') and r_idx == float('inf'):
        return []
    
    return str_list[:l_idx] if l_idx <= r_idx else str_list[r_idx+1:]