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

-- all customers with cars that haven't been returned yet, with date and location for return
SELECT CONCAT(salutation, ' ', firstname,' ',  lastname) As Name, 
				license_nr, price_per_day, car_type, brandname, 
                b2.office_name AS pickup_location, 
                b1.office_name AS return_location,
                CONCAT(DATE_FORMAT(return_date, '%d.%m.%Y'), ', ', TIME_FORMAT(return_time, '%H:%i'))AS return_date,
                TIMESTAMPDIFF(DAY, CURDATE(), return_date) AS days_left
FROM customer
	JOIN reservation ON customer.id = reservation.fk_customer_id
    JOIN car ON reservation.fk_car_id = car.id
    JOIN model ON car.fk_model_id = model.id
    JOIN brand ON car.fk_brand_id = brand.id
    JOIN branch_office  AS b1 ON reservation.fk_return_office_id = b1.id 
    JOIN branch_office AS b2 ON reservation.fk_pickup_office_id = b2.id
WHERE is_returned = 'false';

-- all cars and their current location

-- invoice for customer 1

