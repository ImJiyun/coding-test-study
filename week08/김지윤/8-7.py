def solution(order):
    return sum(1 for ch in str(order) if ch in '369')