def solution(my_string, indices):
    new_string = ""
    indices.sort()
    for i in range(len(my_string)):
        if i not in indices:
            new_string += my_string[i]
    return new_string