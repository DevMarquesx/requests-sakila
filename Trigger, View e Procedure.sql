-- Triggers

/*1- tualizar a data de devolução do filme automaticamente
DELIMITER $$

CREATE TRIGGER update_return_date
AFTER INSERT ON rental
FOR EACH ROW
BEGIN
    UPDATE rental
    SET return_date = DATE_ADD(rental_date, INTERVAL 7 DAY)
    WHERE rental_id = NEW.rental_id;
END $$

DELIMITER ;*/

/*2-Impedir que o cliente alugue mais filmes se a quantidade de filmes não devolvidos for maior que 5
DELIMITER $$

CREATE TRIGGER prevent_rental_if_not_returned
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    DECLARE not_returned_count INT;
    
    SELECT COUNT(*) INTO not_returned_count
    FROM rental
    WHERE customer_id = NEW.customer_id AND return_date IS NULL;

    IF not_returned_count >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cliente não pode alugar mais de 5 filmes não devolvidos.';
    END IF;
END $$

DELIMITER ;*/

/*3-Atualizar o número de locações de um cliente quando um aluguel é retornado

DELIMITER $$

CREATE TRIGGER update_customer_rental_count
AFTER UPDATE ON rental
FOR EACH ROW
BEGIN
    IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
        UPDATE customer
        SET rental_count = rental_count + 1
        WHERE customer_id = NEW.customer_id;
    END IF;
END $$

DELIMITER ;*/

-- Views

/*1- Filmes e suas respectivas categorias

CREATE VIEW films_with_categories AS
SELECT film.title AS film_title, category.name AS category_name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

SELECT * FROM films_with_categories;*/

/*2- Clientes e o total gasto com locação

CREATE VIEW customers_with_total_spent AS
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_spent
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id;

SELECT * FROM customers_with_total_spent;*/

/*3- Filmes alugados por ano

CREATE VIEW films_rented_per_year AS
SELECT YEAR(rental_date) AS rental_year, COUNT(*) AS rental_count
FROM rental
GROUP BY rental_year;

SELECT * FROM films_rented_per_year;*/

-- Procedures

/*1- Calcular a média de duração dos filmes por categoria

DELIMITER $$

CREATE PROCEDURE avg_duration_by_category(IN category_name VARCHAR(255))
BEGIN
    SELECT AVG(film.length) AS avg_duration
    FROM film
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    WHERE category.name = category_name;
END $$

DELIMITER ;

CALL avg_duration_by_category('Action');*/

/*2- Retorna o total de receita gerada por locações em um período especificado.


DELIMITER $$

CREATE PROCEDURE GetTotalRevenueByDate(
    IN start_date DATE,
    IN end_date DATE,
    OUT total_revenue DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(p.amount)
    INTO total_revenue
    FROM payment p
    WHERE p.payment_date BETWEEN start_date AND end_date;
END$$

DELIMITER ;


CALL GetTotalRevenueByDate('2005-05-01', '2005-05-31', @revenue);
SELECT @revenue AS TotalRevenue;*/

/*3- Lista de filmes alugados por um cliente específico, identificando os detalhes dos filmes.

DELIMITER $$

CREATE PROCEDURE GetCustomerRentalHistory(
    IN customer_id INT
)
BEGIN
    SELECT 
        f.film_id,
        f.title AS FilmTitle,
        r.rental_date AS RentalDate,
        r.return_date AS ReturnDate,
        c.first_name AS CustomerFirstName,
        c.last_name AS CustomerLastName
    FROM rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN customer c ON r.customer_id = c.customer_id
    WHERE r.customer_id = customer_id
    ORDER BY r.rental_date DESC;
END$$

DELIMITER ;

CALL GetCustomerRentalHistory(5);*/



