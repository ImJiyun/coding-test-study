def solution(arr, queries):
    answer = []
    for s, e, k in queries:
        basket = []
        for i in range(s, e+1):
            if arr[i] > k:
                basket.append(arr[i])
        if basket:
            answer.append(min(basket))
        else:
            answer.append(-1)
    return answer