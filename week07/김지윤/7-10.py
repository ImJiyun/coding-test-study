def solution(s):
    answer = ''
    for ch in s:
        if s.count(ch) == 1:
            answer += ch
    return "".join(sorted(answer))


def solution2(s):
    from collections import Counter

    counter = Counter(s)
    result = [ch for ch in counter if counter[ch] == 1]
    return ''.join(sorted(result))