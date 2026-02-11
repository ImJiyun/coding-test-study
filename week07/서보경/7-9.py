def solution(id_pw, db):
    user_id = id_pw[0]
    user_pw = id_pw[1]
    id_match = False
    for i in db:
        db_id = i[0]
        db_pw = i[1]
        if user_id == db_id:
            id_match = True
            if user_pw == db_pw:
                return "login"
            else:
                continue
    if id_match:
        return "wrong pw"
    else:
        return "fail"
