def solution(strArr):
    answer = []
    for c in strArr:
        if "ad" not in c:
            answer.append(c)
    return answer