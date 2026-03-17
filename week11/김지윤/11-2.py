# pop 반복
    # 시간 복잡도 : pop -> O(1)
    # arr[i]번 반복 -> O(k)
    # O(Σ arr[i])
# 성능이 더 좋다.
def solution(arr, flag):
    answer = []
    for i in range(len(arr)):
        if flag[i]:
            answer.extend([arr[i]] * arr[i] * 2)
        else:
            for i in range(arr[i]):
                answer.pop()
    return answer

# 슬라이싱 방식
    # 시간 복잡도 : 슬라이싱은 새 리스트를 생성
    # 길이가 n이면 O(n)
    # 한 번 할 때마다 O(len(answer))
def solution2(arr, flag):
    answer = []
    for i in range(len(arr)):
        if flag[i]:
            answer.extend([arr[i]] * arr[i] * 2)
        else:
            answer = answer[:-arr[i]]
    return answer