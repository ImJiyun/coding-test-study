# https://school.programmers.co.kr/learn/courses/30/lessons/120892

def solution(cipher, code):
    answer = ''
    x = code
    y = 1
    while x <= len(cipher):
        answer += cipher[x - 1]
        y += 1
        x = y * code   
    return answer