select r.rental_id, rental_date from rental r
join payment p on p.rental_id = r.rental_id
except
select rental_id, return_date from rental
where rental_id in (select rental_id from payment)

select * from film
natural join inventory

select distinct f1.rental_duration, f2.replacement_cost
from film f1, film f2
where f1.rental_duration > 4
and f2.replacement_cost > 29


select rental_rate, rental_duration, avg(rental_duration) over(partition by rental_rate) as avg_duration
from film




with distinct_months as (select distinct extract(month from payment_date) AS month from payment),

time_series_table as (select ct.city, extract(month from p.payment_date) as month, 0 as total_payment
from city ct, payment p
join customer c on p.customer_id = c.customer_id
group by ct.city, extract(month from p.payment_date)
order by city, month)

select * from time_series_table
union
select ct.city , d.month, 0 as total_payment
from city ct, distinct_months d
where (ct.city, d.month) not in (select city, month from time_series_table)



