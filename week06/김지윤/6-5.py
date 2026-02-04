# 문자열
    # immutable
    # += 할 때마다 새 문자열 생성
    # 길어질수록 비용 증가

# join
    # 한 번에 길이 계산
    # 한 번에 메모리 할당
    # 효율적

def solution(arr):
    answer = ''
    
    for c in arr:
        answer += c
        
    return answer

def solution2(arr):
    return ''.join(arr)