def solution(chicken):
    service = 0
    coupon = chicken
    
    while coupon >= 10:
        new = coupon // 10
        service += new
        coupon = coupon % 10 + new
        
    return service