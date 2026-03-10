def solution(x1, x2, x3, x4):
    answer1 = False

    if not (not x1 and not x2):
        answer1 = True

    answer2 = False
    if not (not x3 and not x4):
        answer2 = True
        
    return True if (answer1 and answer2) else False