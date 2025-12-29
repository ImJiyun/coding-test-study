# Coding Test Study

LeetCode와 프로그래머스를 활용한 SQL 코딩 테스트 스터디입니다.  
주 2회 오프라인으로 직접 만나 문제를 풀고, 서로의 코드를 리뷰하며 단순 정답 풀이를 넘어 쿼리 설계 사고를 공유하는 것을 목표로 합니다.

---

## 스터디 목표

- SQL 코딩 테스트 실력 향상
- 쿼리를 왜 이렇게 작성했는지 설명하며 사고 과정 정리
- SQL 문제 해결 사고 체득
- 코드 리뷰를 통한 다양한 접근 방식 학습

---

## 진행 방식

- **주 2회 오프라인 스터디**
  - 정해진 장소에서 함께 문제 풀이
  - 개인 풀이 후, 코드 공유 및 리뷰
- 모든 풀이는 GitHub에 기록하여 학습 이력 관리

---

## 일정

1. 스터디 전
   - `weekXX/README.md`에 해당 주차 문제 공지
   - **문제는 오프라인 스터디에서 함께 풉니다.** (사전 풀이 없이 참여합니다.)
2. 오프라인 스터디
   - 문제 함께 풀기
   - 개인별 SQL 작성
   - GitHub에 코드 공유
   - 코드 설명 & 리뷰
3. 스터디 후
   - 리뷰 반영하여 코드 정리
   - (선택) PR 생성 및 추가 코멘트

---

## Repository Structure

```
week01/
  jiyun/
    lc_second_highest_salary.sql
    pg_우유와요거트.sql
  other_member/
week02/
```

---

## 파일명 규칙

- LeetCode SQL: `lc_<problem_name>.sql`
- Programmers SQL: `pg_<problem_name>.sql`

<be></be>

- problem_name은 `snake_case` 사용
- 공백, 특수문자 사용 금지

---

## 브랜치 전략

- 각자 본인 이름의 브랜치에서 작업한다.
- 작업 완료 후 main 브랜치로 병합한다.
- main 브랜치에는 직접 push하지 않는다.

---

## 커밋 메시지 규칙

- 커밋 메시지는 해결한 문제 이름을 작성한다.
- `solve: problem_name`

예:

- `solve: second highest salary`
- `solve: milk and yogurt`
