# https://school.programmers.co.kr/learn/courses/30/lessons/120889?language=python3

def solution(sides):
    answer = 0
    m = max(sides)
    sides.remove(m)
    a, b = sides
    
    return 1 if m < a + b else 2