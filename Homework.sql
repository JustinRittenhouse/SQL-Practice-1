--WEEK 5 MONDAY QUESTIONS

--1. How many actors are there with the last name 'Wahlberg'?
select last_name
from actor
where last_name = 'Wahlberg'
There are two actors named Wahlberg.

--2. How many payments were made between $3.99 and $5.99?
--select amount
--from payment
--where amount between 3.99 and 5.99 (This was just experimenting.)

--select amount as "amount", count(payment) as "No. of each payment"
--from payment
--where amount between 3.99 and 5.99
--group by amount (This was how I got the number first, by adding these. But Hamilton helped me get the sum straight up.)

select count(payment)
from public.payment
where amount between 3.99 and 5.99
--There are 5,607 payments between $3.99 and $5.99

--3. What film does the store have the most of? (search in inventory)
select inventory.film_id as "film_id", film.title, count(inventory_id) as "No. of each film"
from inventory
join film on inventory.film_id = film.film_id
group by inventory.film_id, film.title

--Each of these movies are tied for "most" with 8 inventory each.
--Grit Clockwork
--Lose Inch
--Curtain Videotape
--Dynamite Tarzan
--Loathing Legally
--Dogma Family
--Goodfellas Salute
--Invasion Cyclone
--Juggler Hardly
--Married Go
--Rush Goodfellas
--Zorro Ark
--Pulp Beverly
--Network Peak
--Butterfly Chocolat
--Wife Turn
--Kiss Glory
--Confidential Interview
--Trip Newton
--Rugrats Shakespeare
--Dancing Fever
--Ridgemont Submarine
--Heavyweights Beast
--Moon Bunch
--Sweethearts Suspects
--Shock Cabin
--Swarm Gold
--Torque Bound
--Innocent Usual
--Frost Head
--Greatest North
--Forward Temple
--Cat Coneheads
--Dinosaur Secretary
--Streetcar Intentions
--Sting Personal
--Operation Operation
--Rocketeer Mother
--Mockingbird Hollywood
--Bound Cheaper
--Pity Bound
--Bucket Brotherhood
--Harry Idaho
--Cupboard Sinners
--Roses Treasure
--Muscle Bright
--Seabiscuit Punk
--Crossroads Casualties
--Storm Happiness
--Beverly Outlaw
--Academy Dinosaur
--Expendable Stallion
--Virginian Pluto
--Hustler Party
--Scalawag Duck
--Spy Mile
--Gilmore Boiled
--Apache Divine
--Deer Virginian
--Family Sweet
--Garden Island
--Gleaming Jawbreaker
--Metropolis Coma
--Horror Reign
--Titans Jerk
--Telemark Heartbreakers
--Bingo Talented
--Primary Glass
--Saturday Lambs
--Hobbit Alien
--Boogie Amelie
--Giant Troopers

--5. What store employee (get the id) sold the most rentals?
select *
from customer 
where last_name = "William"
--There are no customers with the last name William, but there is 1 Williams and 1 Williamson.

--6. How many different disctrict names are there?
select address.district
from address
group by address.district
There are 378 disctricts.

--7. What film has the most actors in it? (use film_actor and get film_id)
select film.title, film_actor.film_id, count(actor_id)
from film_actor
join film on film_actor.film_id = film.film_id 
group by film_actor.film_id, film.title
--The film that has the most actors in it is Lambs Cincinatti with 15 actors.

--8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
select *
from customer
where last_name 
like '%es'
and store_id = 1
--There are 13 customers in store 1 that have a last name ending with 'es'.

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--   with ids between 380 and 430? (use group by and having > 250)
select amount, count(amount) as AmountAmount
from payment
where customer_id < 430
and customer_id > 380
group by amount
having count(amount) > 250
--Only three amounts fall in that category. $0.99, $2.99, and $4.99.

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
select rating, count(rating) 
from film
group by rating 
--There are 5 categories, and PG-13 has the highest rating of 223 movies.