# 틀린 코드
# def solution(before, after):
#     return 1 if "".join(list(reversed(before))) == after else 0

def solution(before, after):
    # 파이썬에서 == 은 내부 원소까지 검사한다고 함
    return 1 if sorted(before) == sorted(after) else 0