# https://school.programmers.co.kr/learn/courses/30/lessons/120850?language=python3

import re

def solution(my_string):
    answer = sorted(map(int, re.findall(r'\d', my_string)))
    return answer