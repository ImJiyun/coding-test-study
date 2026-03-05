def solution(rny_string):
    temp = []
    for c in rny_string:
        if c == 'm':
            temp.append("rn")
        else:
            temp.append(c)
    return "".join(temp)

# def solution(rny_string):
#     return rny_string.replace('m', 'rn')