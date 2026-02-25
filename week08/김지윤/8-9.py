# a의 아스키 코드가 97이기 때문에 97을 더해주면 된다.
def solution(age):
    return ''.join(chr(int(i) + 97) for i in str(age))