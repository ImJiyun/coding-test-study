def solution(rsp):
    # 가위는 2 바위는 0 보는 5
    answer = ''
    for choice in rsp:
        if choice == "2":
            answer += "0"
        elif choice == "0":
            answer += "5"
        else:
            answer += "2"
    return answer

def solution2(rsp):
    d = {
        "2" : "0",
        "0" : "5",
        "5" : "2"
    }

    # d[choice] for choice in rsp : generator 반환
    # join은 iterable을 받는다 (list, tuple, generator)    
    return ''.join(d[choice] for choice in rsp)