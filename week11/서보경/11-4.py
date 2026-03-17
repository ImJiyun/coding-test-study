def solution(myString, pat):
    last_app = 0
    for i in range(len(myString)):
        if myString[i:i+len(pat)] == pat:
            last_app = i
    return myString[:last_app + len(pat)]