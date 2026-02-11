def solution(n, control):
    for ch in control:
        if ch == "w":
            n += 1
        elif ch == "s":
            n -= 1
        elif ch == "d":
            n += 10
        else:
            n -= 10
    return n

def solution2(n, control):
    d = {
        'w': 1,
        's': -1,
        'd': 10,
        'a' : -10
    }

    for ch in control:
        n += d[ch]
    
    return n