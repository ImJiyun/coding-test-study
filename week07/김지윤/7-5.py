def solution(my_string):
    answer = []
    for char in my_string:
        if char.isdigit():
            answer.append(int(char))
    answer.sort()
    return answer

def solution2(my_string):
    return sorted(int(char) for char in my_string if char.isdigit())

# sorted vs sort
# sorted
    # 파이썬 내장함수
    # 원본을 변경하지 않음
    # 새 리스트를 반환함
    # iterable 전부에 사용 가능
# sort
    # 리스트의 메서드
    # 원본을 변경함
    # 반환값은 None (파이썬에서 모든 함수는 반드시 어떤 값을 반환. return을 쓰지 않아도 자동으로 None을 반환)
    # list에만 사용 가능