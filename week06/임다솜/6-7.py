# https://school.programmers.co.kr/learn/courses/30/lessons/181910

def solution(my_string, n):
    # answer = my_string[len(my_string) - n:]
    answer = my_string[-n:]
    return answer