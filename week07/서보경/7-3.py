def solution(sides):
    long_side = max(sides)
    short_sides = sum(sides) - long_side
    if short_sides > long_side:
        return 1
    else:
        return 2