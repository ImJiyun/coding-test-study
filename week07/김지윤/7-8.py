def solution(emergency):
    answer = []
    priority = sorted(emergency, reverse=True)
    
    for person in emergency:
        answer.append(priority.index(person) + 1)
    return answer