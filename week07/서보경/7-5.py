def solution(my_string):
    answer = []
    for i in my_string:
        if i.isdigit():
            answer = answer + [int(i)]
    return sorted(answer)