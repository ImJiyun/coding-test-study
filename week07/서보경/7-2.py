def solution(numLog):
    answer = ""
    for i in range(1, len(numLog)):
        diff = numLog[i] - numLog[i-1]
        if diff == 1:
            answer += "w"
        if diff == -1:
            answer += "s"
        if diff == 10:
            answer += "d"
        if diff == -10:
            answer += "a"    
    return answer