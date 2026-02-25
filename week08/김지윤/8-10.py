from collections import deque

def solution(numbers, direction):
    d = deque(numbers)
    if direction == "right":
        d.appendleft(d.pop())
    else:
        d.append(d.popleft())
    return list(d)