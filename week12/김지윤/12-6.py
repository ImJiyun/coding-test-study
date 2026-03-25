def solution(myStr):
    for ch in ["a", "b", "c"]:
        myStr = myStr.replace(ch, " ") 
    arr = myStr.split()
    return arr if len(arr) != 0 else ["EMPTY"]