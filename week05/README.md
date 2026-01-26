# 5주차 스터디

## 2026년 1월 26일 

1. orders 테이블에서 유저(user_id)별로 주문 금액(amount)의 합계를 PIVOT해주세요. 날짜(order_date)를 행(Row)으로, user_id를 열(Column)으로 만들어야 합니다
    
2. orders 테이블에서 날짜(order_date)별로 유저들의 주문 금액(amount)의 합계를 PIVOT 해주세요. user_id를 행(Row)으로, order_date를 열(Column)으로 만들어야 합니다. `2023-05-01` 쓰면 컬럼 이름 가능
    
    
3. orders 테이블에서 사용자(user_id)별, 날짜(order_date)별로 주문이 있다면 1, 없다면 0으로 PIVOT 해주세요. user_id를 행(Row)으로, order_date를 열(Column)로 만들고 주문을 많이 해도 1로 처리합니다

    
4. 앱 로그 데이터를 PIVOT하는 쿼리를 작성해보세요
event_params의 key : 여러가지가 있음
event_parmas의 key의 distinct 값을 찾아서, 피벗을 해주세요
댓글에 있는 쿼리를 참고하셔도 되는데 key에 어떤 것이 있는지 살펴보세요

5. 데일리 리텐션 쿼리(N Day 클래식)

6. 위 데일리 리텐션 쿼리를 위클리 리텐션으로 변경해보세요

7. 앞선 Weekly Retention에서 retention_rate 컬럼을 추가해주세요

8. Weekly Retention을 구하는 쿼리를 직접 처음부터 작성해주세요

9. Core Event를 "click_payment"라고 설정하고 Weekly Retention을 구해주세요

10. WAU의 유저 타입을 쪼개는 쿼리를 작성해주세요

11. 주어진 데이터에서 어떤 사람들이 리텐션이 그나마 높을까요? 찾아보세요
