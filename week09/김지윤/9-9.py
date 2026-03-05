def solution(myString):
    new_arr = myString.split("x")
    return [len(arr) for arr in new_arr]