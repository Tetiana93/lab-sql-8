select title, length, rank() over(order by length) as 'Rank' from film
where length <> 0 or length <> null;
select title, length, rating, rank() over (partition by rating order by length) as 'Rank'
from film
where length <> 0 or length <> null;
select c.name, count(fc.film_id) as film_count from film_category fc
join category c on fc.category_id = c.category_id
group by c.name;
select a.first_name, a.last_name, count(a.actor_id) from actor a
join film_actor fa on a.actor_id=fa.actor_id
group by a.last_name, a.first_name
order by count(a.actor_id) desc;
select c.first_name, c.last_name, count(r.rental_id) from customer c
join rental r on c.customer_id=r.customer_id
group by c.first_name, c.last_name
order by count(r.rental_id) desc;
select f.title, count(r.rental_id)
from film f
join inventory i on f.film_id=i.film_id
join rental r on i.inventory_id=r.inventory_id
group by f.title
order by count(r.rental_id) desc;