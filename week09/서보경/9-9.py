def solution(myString):
    answer = []
    after_splits = myString.split("x")
    for c in after_splits:
        answer.append(len(c))
    return answer