def solution(str_list):
    basket = []
    while str_list:
        now = str_list.pop(0)
        if now == "l":
            return basket
        elif now == 'r':
            return str_list
        else:
            basket.append(now)
    return []