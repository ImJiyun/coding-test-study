def solution(my_string):
    answer = ''
    visited = set()
    for string in my_string:
        if string not in visited:
            answer += string
        visited.add(string)
    return answer