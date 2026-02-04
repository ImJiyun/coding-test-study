def solution(num_list):
    odd_sum = ''
    even_sum = ''
    
    for num in num_list:
        if num % 2 == 1:
            odd_sum += str(num)
        else:
            even_sum += str(num)
            
    return int(odd_sum) + int(even_sum)

def solution2(num_list):
    odd_num = []
    even_num = []

    for num in num_list:
        is_even = num % 2 == 0
        odd_num.append(str(num)) if is_even else even_num.append(str(num))

    return int(''.join(odd_num)) + int(''.join(even_num))