def solution(sides):
    sides.sort(reverse=False)
    largest = sides[-1]
    sum_two_sides = sides[0] + sides[1]
    return 1 if largest < sum_two_sides else 2