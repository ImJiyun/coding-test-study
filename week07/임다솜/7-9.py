# https://school.programmers.co.kr/learn/courses/30/lessons/120883?language=python3

def solution(id_pw, db):
    answer = 'fail'
    for l in db:
        if id_pw[0] == l[0]:
            if id_pw[1] == l[1]:
                answer = "login"
                break
            else:
                answer = "wrong pw"
                break
    return answer