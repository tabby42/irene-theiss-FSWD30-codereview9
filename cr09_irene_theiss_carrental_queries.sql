-- all branch offices with address and phone number
SELECT office_name, email, CONCAT(phone_country_code.country_code, ' ', phone_nr) AS Phone, 
				CONCAT(street, ' ', street_nr) AS Address, CONCAT(zipcode, ' ', city_name, ', ', country.country_code) AS City_Country
FROM branch_office
	JOIN phone_country_code ON branch_office.fk_phone_country_code_id = phone_country_code.id
	JOIN city ON branch_office.fk_city_id = city.id
	JOIN country ON city.fk_country_id = country.id
ORDER BY office_name;

-- all customers under 25
SELECT CONCAT(salutation, ' ', firstname,' ',  lastname) As Name, 
				TIMESTAMPDIFF(YEAR, birthdate ,CURDATE()) AS Age
FROM customer
WHERE TIMESTAMPDIFF(YEAR, birthdate ,CURDATE()) <= 25;

-- all customers with cars that haven't been returned yet, with date and location for return and how many days are left
SELECT CONCAT(salutation, ' ', firstname,' ',  lastname) As Name, 
				license_nr, price_per_day, car_type, brandname, 
                b2.office_name AS pickup_location, 
                b1.office_name AS return_location,
                CONCAT(DATE_FORMAT(return_date, '%d.%m.%Y'), ', ', TIME_FORMAT(return_time, '%H:%i')) AS return_date,
                TIMESTAMPDIFF(DAY, CURDATE(), return_date) AS days_left
FROM customer
	JOIN reservation ON customer.id = reservation.fk_customer_id
    JOIN car ON reservation.fk_car_id = car.id
    JOIN model ON car.fk_model_id = model.id
    JOIN brand ON car.fk_brand_id = brand.id
    JOIN branch_office  AS b1 ON reservation.fk_return_office_id = b1.id 
    JOIN branch_office AS b2 ON reservation.fk_pickup_office_id = b2.id
WHERE is_returned = 'false';

-- all cars and their current location (location is NULL if car is currently rented)
SELECT car.id, license_nr,  EXTRACT(YEAR FROM CURDATE()) - prod_year AS Age, 
				CONCAT(num_seats, '-Sitzer') AS size, car_type, brandname, office_name
FROM car
	LEFT JOIN branch_office ON car.fk_current_office_id = branch_office.id
	JOIN model ON car.fk_model_id = model.id
    JOIN brand ON car.fk_brand_id = brand.id;
    
-- number of available cars at offices
SELECT office_name, COUNT(license_nr)
FROM branch_office
	LEFT JOIN  car ON branch_office.id = car.fk_current_office_id
GROUP BY office_name;

-- offices with available minibusses and their count
SELECT office_name, COUNT(license_nr)
FROM branch_office
	LEFT JOIN  car ON branch_office.id = car.fk_current_office_id
    JOIN model ON car.fk_model_id = model.id
WHERE car_type = 'Minibus'
GROUP BY office_name;

-- invoice information for customer 1
SELECT  reservation.id, invoice.id, CONCAT(salutation, ' ', firstname,' ',  lastname) As Name, 
				b1.office_name AS pickup_location , 
                CONCAT(DATE_FORMAT(pickup_date, '%d.%m.%Y'), ', ', TIME_FORMAT(pickup_time, '%H:%i')) AS pickup_date,
                b2.office_name AS return_location,
                CONCAT(DATE_FORMAT(return_date, '%d.%m.%Y'), ', ', TIME_FORMAT(return_time, '%H:%i')) AS return_date,
                CONCAT(license_nr, ', ', brandname, ' ', car_type, ', ', CONCAT(ps, ' PS')) AS rented_car, 
                price_per_day, SUM(extra.price) AS extras, CONCAT(discount * 100, '%') AS discount,
                ROUND( (price_per_day + SUM(extra.price)) - ((price_per_day + SUM(extra.price)) * discount), 2) AS total
FROM customer
	JOIN reservation ON customer.id  =  reservation.fk_customer_id
    JOIN branch_office AS b1 ON reservation.fk_pickup_office_id = b1.id
    JOIN branch_office AS b2 ON reservation.fk_return_office_id = b2.id
    JOIN car ON reservation.fk_car_id = car.id
    JOIN model on car.fk_model_id = model.id
    JOIN brand ON car.fk_brand_id = brand.id
    JOIN reservation_extra ON reservation.id = reservation_extra.fk_reservation_id
    JOIN extra ON reservation_extra.fk_extra_id = extra.id
    JOIN invoice ON reservation.id = invoice.fk_reservation_id
WHERE customer.id = 1
GROUP BY reservation.id;

