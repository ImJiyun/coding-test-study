SELECT
    distinct(car_id)
from CAR_RENTAL_COMPANY_CAR as a
left join CAR_RENTAL_COMPANY_RENTAL_HISTORY as b
using (car_id)
where car_type = "세단" and start_date >= "2022-10-01"
order by
    car_id desc