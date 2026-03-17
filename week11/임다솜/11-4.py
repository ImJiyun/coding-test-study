# https://school.programmers.co.kr/learn/courses/30/lessons/181872

def solution(myString, pat):
    answer = ''
    loc = myString.rfind(pat)
    if loc != -1:
        answer = myString[:loc + len(pat)]
    return answer