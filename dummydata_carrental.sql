USE cr09_irene_theiss_carrental;

INSERT INTO country (country_code, country_name) VALUES ('A', 'Austria'); -- 1
INSERT INTO country (country_code, country_name) VALUES ('D', 'Germany'); -- 2

INSERT INTO city (zipcode, city_name, fk_country_id) VALUES ('2103', 'Langenzersdorf', 1); -- 1
INSERT INTO city (zipcode, city_name, fk_country_id) VALUES ('8010', 'Graz', 1); -- 2
INSERT INTO city (zipcode, city_name, fk_country_id) VALUES ('1030', 'Wien Landstraße', 1); -- 3
INSERT INTO city (zipcode, city_name, fk_country_id) VALUES ('80331', 'München', 2); -- 4
INSERT INTO city (zipcode, city_name, fk_country_id) VALUES ('1050', 'Wien Margareten', 1); -- 5

INSERT INTO phone_country_code (country_code) VALUES ('+43'); -- 1
INSERT INTO phone_country_code (country_code) VALUES ('+49'); -- 2

INSERT INTO branch_office (office_name, email, fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr)
VALUES ('Office Wien 3', 'carrental_v3@carrental.com', 1, '0699/129867', 3, 'Baumgasse', '4a' ); -- 1
INSERT INTO branch_office (office_name, email, fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr)
VALUES ('Office LE', 'carrental_le@carrental.com', 1, '0699/1298312', 1, 'Scheibenmais', '20' ); -- 2
INSERT INTO branch_office (office_name, email, fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr)
VALUES ('Office Graz Gösting', 'carrental_gg@carrental.com', 1, '0699/986512', 2, 'Annagasse', '14' ); -- 3

INSERT INTO customer (salutation, firstname, lastname, birthdate, email, 
						fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr, drivers_license_nr)
VALUES ('Ms', 'Maria', 'Muster', '1970-12-13', 'test@gmail.com', 1, '0650/676767', 2, 'Herrengasse', '5b/3', '12341234B'); -- 1
INSERT INTO customer (salutation, firstname, lastname, birthdate, email, 
						fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr, drivers_license_nr)
VALUES ('Mr', 'Herbert', 'Herbst', '1966-04-09', 'test2@gmail.com', 1, '0676/8654', 5, 'Margaretenstraße', '120/5', '43214321A'); -- 2
INSERT INTO customer (salutation, firstname, lastname, birthdate, email, 
						fk_phone_country_code_id, phone_nr, fk_city_id, street, street_nr, drivers_license_nr)
VALUES ('Mrs', 'Ludmilla', 'Lodenmantel', '1993-10-31', 'test3@gmail.com', 1, '0676/098707', 1, 'Hauptstraße', '45/7', '98769876C'); -- 3

INSERT INTO brand (brandname) VALUES ('VW'); -- 1
INSERT INTO brand (brandname) VALUES ('Opel'); -- 2
INSERT INTO brand (brandname) VALUES ('BMW'); -- 3

INSERT INTO model (car_type) VALUES ('Limousine'); -- 1
INSERT INTO model (car_type) VALUES ('Kombi'); -- 2
INSERT INTO model (car_type) VALUES ('SUV'); -- 3
INSERT INTO model (car_type) VALUES ('Minibus'); -- 4

INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, navigation_system, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_current_office_id )
VALUES ('W1234', 12000, 100, 'hand', '2000', 'true', 'false', 5, 5, 85.7, 1, 1, 3);  -- 1
INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, navigation_system, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_current_office_id )
VALUES ('KO4321', 45000, 110, 'automatic', '2010', 'true', 'true', 4, 3, 99.7, 2, 2, NULL);  -- 2
INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, navigation_system, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_current_office_id)
VALUES ('G9807', 8000, 130, 'hand', '2012', 'true', 'true', 5, 5, 105.7, 3, 3, NULL);  -- 3
INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, navigation_system, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_current_office_id )
VALUES ('W9807', 14000, 100, 'automatic', '2014', 'true', 'false', 5, 5, 99.8, 4, 1, 1);  -- 3
INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, navigation_system, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_current_office_id )
VALUES ('W7765', 25000, 200, 'automatic', '2015', 'true', 'true', 5, 3, 110.8, 1, 3, 1);  -- 4

INSERT INTO extra (extra_name, price) VALUES ('young driver fee', 12.99);  -- 1
INSERT INTO extra (extra_name, price) VALUES ('limitation of liability', 10.99);  -- 2
INSERT INTO extra (extra_name, price) VALUES ('additional driver', 8.99);  -- 3
INSERT INTO extra (extra_name, price) VALUES ('personal accident protection', 12.89);  -- 4
INSERT INTO extra (extra_name, price) VALUES ('gasoline fee', 25.89);  -- 5
INSERT INTO extra (extra_name, price) VALUES ('late return', 49.50);  -- 6
INSERT INTO extra (extra_name, price) VALUES ('border crossing fee', 39.50);  -- 7
INSERT INTO extra (extra_name, price) VALUES ('cancellation fee', 25.50);  -- 8

INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date, is_returned)
VALUES (1, 1, 3, 3, '2018-01-21', '2018-01-22', '09:00', '12:00', NULL, 'true'); -- 1
INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date, is_returned)
VALUES (2, 2, 1, 2, '2018-02-02', '2018-02-06', '10:00', '13:00', NULL, 'false'); -- 2
INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date, is_returned)
VALUES (3, 3, 2, 3, '2018-04-02', '2018-02-07', '08:00', '10:00', NULL, 'false'); -- 3

INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (1, 2); -- 1
INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (1, 5); -- 2
INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (2, 3); -- 3
INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (2, 4); -- 4
INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (3, 1); -- 5
INSERT INTO reservation_extra (fk_reservation_id, fk_extra_id) VALUES (3, 2); -- 6

INSERT INTO invoice (fk_reservation_id, discount) VALUES (1, 0.3); -- 1




