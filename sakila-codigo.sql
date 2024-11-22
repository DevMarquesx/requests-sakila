/*1-
SELECT DISTINCT country FROM country;*/

/*2-
SELECT COUNT(*) FROM country;*/

/*3- 
SELECT COUNT(*) FROM country
WHERE country LIKE '%A';*/

/*4- 
SELECT DISTINCT release_year FROM film;*/

/*5- 
UPDATE film
SET release_year = 2007
WHERE title LIKE 'B%';*/
/*6-
SELECT title
FROM film
WHERE length > 100 AND rating = 'G';*/

/*7-
UPDATE film
SET release_year = 2008
WHERE rental_duration < 4 AND rating = 'PG';*/

/*8- 
SELECT COUNT(*)
FROM film
WHERE rating = 'PG-13' AND rental_rate > 2.40;*/
/*9-
SELECT DISTINCT language_id
FROM film;*/

/*10-
update filme
set ano_de_lancamento = 2007
where titulo like 'b%';

select * from filme;*/

/*11- 
update filme
set ano_de_lancamento = '2008'
where duracao_da_locacao < 4 and classificacao = 'PG';
select ano_de_lancamento, classificacao, duracao_da_locacao from filme;
set SQL_SAFE_UPDATES = 0;*/

/*12-
 UPDATE filme
set idioma_id = 6
where preco_da_locacao > 4;

select idioma_id, preco_da_locacao from filme;*/

/*13- 
UPDATE filme
set idioma_id = 3
where preco_da_locacao = 0.99;

select idioma_id, preco_da_locacao from filme;*/

/*14- 
select distinct preco_da_locacao from filme;*/

/*15-
 select preco_da_locacao, count(filme_id) from filme group by preco_da_locacao;*/

/*16- 
select preco_da_locacao from filme group by preco_da_locacao > 340;*/

/*17- 
select filme_id, count(ator_id) as quantidade_ator from filme_ator group by filme_id order by filme_id desc;*/

/*18- 
select filme_id, count(ator_id) as quantidade_ator from filme_ator group by filme_id having quantidade_ator > 5 order by quantidade_ator desc;*/

/*19-
 select f.titulo, fa.filme_id, count(ator_id) as quantidade_de_atores from idioma i, filme f, filme_ator fa
where f.filme_id = fa.filme_id and f.idioma_id = 3
group by fa.filme_id having count(fa.ator_id) > 10
order by quantidade_de_atores desc;

select * from idioma;*/

/*20- 
SELECT COUNT(*)
FROM film
WHERE rental_duration = (SELECT MAX(rental_duration) FROM film);*/

/*21-
SELECT COUNT(*)
FROM film
JOIN language ON film.language_id = language.language_id
WHERE (language.name = 'Japanese' OR language.name = 'German')
AND rental_duration = (SELECT MAX(rental_duration) FROM film);*/
/*22-
SELECT rating, rental_rate, COUNT(*)
FROM film
GROUP BY rating, rental_rate;*/

/*23-
SELECT category.name, MAX(film.length) AS max_length
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;*/

/*24-
SELECT category.name, COUNT(*)
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;*/

/*25-
select count(f.titulo), c.nome from filme as f, categoria c, filme_categoria fc
where f.classificacao ='G' and f.filme_id = fc.filme_id 
and fc.categoria_id = c.categoria_id
group by c.categoria_id*/

/*26-
select count(filme.titulo), categoria.nome from filme, categoria, filme_categoria
where (filme.classificacao = 'G' or filme.classificacao='PG') and filme.filme_id = filme
and filme_categoria.categoria_id = categoria.categoria_id
group by caegoria.categoria_id*/

/*27-
select count(filme.titulo), categoria.nome , filme.classificacao from filme, categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and filme_categoria.categoria_id = categoria.categoria_id
group by categoria.categoria_id, filme.classificacao*/ 

/*28-
SELECT actor.first_name, actor.last_name, COUNT(*) AS film_count
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
ORDER BY film_count DESC;*/

/*29-
SELECT release_year, COUNT(*) AS film_count
FROM film
GROUP BY release_year
ORDER BY film_count ASC;*/

/*30-
SELECT release_year
FROM film
GROUP BY release_year
HAVING COUNT(*) > 400;*/

/*31-
select ano_de_lancamento, count(titulo)
from filme f, filme_categoria fc
where preco_da_locacao > 2.98 and f.filme_id = fc.filme_id
and categoria_id = 3 
group by ano_de_lancamento
having count(titulo) > 100*/

/*32-
select cidade, pais from cidade c, pais p
where c.pais_id = p.pais_id
AND pais like 'A%'
group by pais;
*/

/*33-
select count(cidade), pais 
from cidade c, pais p 
where p.pais_id = c.pais_id
group by p.pais
order by 1 desc;
*/

/*34-
select count(cidade), p.pais 
from cidade c, pais p
where p.pais_id = c.pais_id
AND pais like 'A%'
group by p.pais
order by p.pais asc;
*/

/*35- 
select pais, cidade 
from cidade c, pais p
where p.pais_id = c.pais_id
AND pais like 'A%'
group by p.pais
having count(cidade_id) > 3;
*/

/*36- 
select pais, cidade 
from cidade c, pais p
where p.pais_id = c.pais_id
AND (cidade like 'A%'
or cidade like '%R%')
group by p.pais
having count(cidade_id) > 3;
*/

/*37- 
select primeiro_nome, pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
and pais = "United States";
*/

/*38-
select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
and pais = "Brazil";
*/
/*39- 
select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
group by pais
*/

/*40-
select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
group by pais
Having count(primeiro_nome) >= 10
*/

/*41-
select avg(duracao_do_filme), nome
from filme f, idioma i
where f.idioma_id = i.idioma_id
group by nome;
*/

/*42-SELECT COUNT(DISTINCT actor.actor_id)
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN language ON film.language_id = language.language_id
WHERE language.name = 'English';
*/

/*43-
SELECT actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.title = 'Blanket Beverly';*/

/*44-
SELECT category.name
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
HAVING COUNT(film_category.film_id) > 60;*/

/*45-
SELECT DISTINCT film.title
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN film ON rental.film_id = film.film_id
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Argentina';*/

/*46-
SELECT COUNT(*)
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Chile';*/

/*47-
SELECT staff.first_name, staff.last_name, COUNT(*) AS rental_count
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id;*/

/*48-
SELECT staff.first_name, staff.last_name, category.name, COUNT(*) AS rental_count
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
JOIN film ON rental.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY staff.staff_id, category.name;*/

/*49-
SELECT title
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);*/

/*50-
SELECT category.name, SUM(film.length) AS total_length
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;*/

/*51-
SELECT YEAR(rental_date) AS rental_year, MONTH(rental_date) AS rental_month, COUNT(*) AS rental_count
FROM rental
GROUP BY rental_year, rental_month
ORDER BY rental_year, rental_month;*/

/*52-
SELECT film.rating, SUM(payment.amount) AS total_payment
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
JOIN film ON rental.film_id = film.film_id
WHERE YEAR(rental.rental_date) = 2006
GROUP BY film.rating;*/

/*53-
SELECT MONTH(rental_date) AS rental_month, AVG(payment.amount) AS avg_payment
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE YEAR(rental.rental_date) = 2005
GROUP BY rental_month
ORDER BY rental_month;*/

/*54-
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_payment
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE YEAR(rental.rental_date) = 2006 AND MONTH(rental.rental_date) = 6
GROUP BY customer.customer_id;*/