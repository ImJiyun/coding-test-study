def solution(chicken):
    answer = 0
    coupons = chicken
    while coupons >= 10:
        service = coupons // 10
        answer += service
        coupons = (coupons % 10) + service
    return answer