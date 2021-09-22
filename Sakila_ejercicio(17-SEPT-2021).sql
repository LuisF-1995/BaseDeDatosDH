use sakila;

select * from staff;

select * from store;

select first_name, last_name, st.store_id from staff sf inner join store st on sf.store_id = st.store_id;

select st.store_id, CONCAT(sf.first_name, ' ',sf.last_name) Manager 
from store st 
inner join staff sf on st.manager_staff_id = sf.staff_id;

select first_name, last_name, st.store_id 
from staff sf 
left join store st on sf.staff_id = st.manager_staff_id where st.manager_staff_id is null ;

select * from customer;

select * from rental;
select * from payment; 

select * from rental r left join payment p on r.rental_id = p.rental_id where p.rental_id is null;

select c.customer_id, c.first_name, c.last_name, r.rental_date, sum(p.amount) pay 
from customer c 
left join rental r on c.customer_id = r.customer_id
left join payment p on p.rental_id = r.rental_id
group by customer_id, r.rental_date;

select distinct rating from film;

select  
case rating 
	when 'R' then 'Restrngido'
	when 'PG-13' then 'Mayores de 13'
	when 'PG' then 'Necesita guia paternal'
	when 'NC-17' then 'Mayores de 17'
	when 'G' then 'Audiencia General' 
    else 'Otro'
    end as Clasificacion,
case 
	when length >= 90 then 'Largometraje'
	when length < 90 and length >= 60 then 'pelicula'
    else 'cortometraje' end as tipo_duracion,
count(*) as cant_peliculas
from film
group by clasificacion,tipo_duracion
order by clasificacion;
 
