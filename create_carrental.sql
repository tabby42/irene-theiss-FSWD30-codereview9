DROP DATABASE IF EXISTS cr09_irene_theiss_carrental;

CREATE DATABASE IF NOT EXISTS cr09_irene_theiss_carrental DEFAULT CHARACTER SET utf8;

USE cr09_irene_theiss_carrental;

-- create tables
CREATE TABLE IF NOT EXISTS customer (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    salutation ENUM('Ms', 'Mr', 'Mrs', 'Co'),
    firstname NVARCHAR(55) NOT NULL,
    lastname NVARCHAR(55) NOT NULL,
    birthdate DATE NOT NULL,
    email NVARCHAR(100) NOT NULL,
    fk_phone_country_code_id INT unsigned NOT NULL,
	phone_nr NVARCHAR(20) NOT NULL,
	fk_city_id INT unsigned NOT NULL,
	street NVARCHAR(100),
    street_nr NVARCHAR(6),
    drivers_license_nr NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS phone_country_code (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    country_code NVARCHAR(6) NOT NULL,
    CONSTRAINT pk_phone_country_code PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS city (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    zipcode NVARCHAR(16) NOT NULL,
    city_name NVARCHAR(55) NOT NULL,
    fk_country_id INT unsigned NOT NULL,
    CONSTRAINT pk_city PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS country (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    country_code NVARCHAR(8) NOT NULL,
    country_name NVARCHAR(55) NOT NULL,
    CONSTRAINT pk_country PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS branch_office (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    office_name NVARCHAR(20) NOT NULL,
    email NVARCHAR(100) NOT NULL,
	fk_phone_country_code_id INT unsigned NOT NULL,
	phone_nr NVARCHAR(20) NOT NULL,
    fk_city_id INT unsigned NOT NULL,
	street NVARCHAR(100),
    street_nr NVARCHAR(6),
    CONSTRAINT pk_branch_office PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS reservation (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    fk_customer_id INT unsigned NOT NULL,
    fk_car_id INT unsigned NOT NULL,
    fk_pickup_office_id INT unsigned NOT NULL,
    fk_return_office_id INT unsigned NOT NULL,
    pickup_date DATE NOT NULL,
    return_date DATE NOT NULL,
    pickup_time TIME NOT NULL,
    return_time TIME NOT NULL,
    cancel_date DATE ,
    is_returned ENUM('true', 'false') DEFAULT 'false',
    CONSTRAINT pk_reservation PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS extra (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    extra_name NVARCHAR(55) NOT NULL,
    price DOUBLE NOT NULL,
    CONSTRAINT pk_extra PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS reservation_extra (
	fk_reservation_id INT unsigned NOT NULL,
    fk_extra_id INT unsigned NOT NULL,
    CONSTRAINT pk_reservation_extra PRIMARY KEY(fk_reservation_id, fk_extra_id)
);

CREATE TABLE IF NOT EXISTS car (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    license_nr NVARCHAR(20) NOT NULL,
    kilometer_status INT unsigned NOT NULL,
    ps INT unsigned NOT NULL,
	circuit ENUM('hand', 'automatic') DEFAULT 'hand',
    prod_year YEAR(4) NOT NULL,
    navigation_system ENUM('true', 'false') DEFAULT 'false',
    air_condition ENUM('true', 'false') DEFAULT 'false',
    num_seats TINYINT(10) NOT NULL,
    num_doors TINYINT(5) NOT NULL,
    price_per_day DOUBLE NOT NULL,
    fk_model_id INT unsigned NOT NULL,
	fk_brand_id INT unsigned NOT NULL,
	CONSTRAINT pk_car PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS model (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    car_type NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_model PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS brand (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    brandname NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_brand PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS invoice (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	fk_reservation_id INT unsigned NOT NULL,
    discount DOUBLE,
    CONSTRAINT pk_invoice PRIMARY KEY(id)
);

-- create foreign keys
ALTER TABLE customer 
ADD CONSTRAINT fk_customer__phone_country_code
FOREIGN KEY ( fk_phone_country_code_id) REFERENCES phone_country_code (id);

ALTER TABLE customer 
ADD CONSTRAINT fk_customer_city
FOREIGN KEY ( fk_city_id) REFERENCES city (id);

ALTER TABLE city 
ADD CONSTRAINT fk_city_country
FOREIGN KEY ( fk_country_id) REFERENCES country (id);

ALTER TABLE branch_office 
ADD CONSTRAINT fk_branch_office__phone_country_code
FOREIGN KEY ( fk_phone_country_code_id) REFERENCES phone_country_code (id);

ALTER TABLE branch_office 
ADD CONSTRAINT fk_branch_office_city
FOREIGN KEY ( fk_city_id) REFERENCES city (id);

ALTER TABLE reservation_extra 
ADD CONSTRAINT fk_reservation_extra__reseravtion
FOREIGN KEY ( fk_reservation_id) REFERENCES reservation (id);

ALTER TABLE reservation_extra 
ADD CONSTRAINT fk_reservation_extra__extra
FOREIGN KEY ( fk_extra_id) REFERENCES extra (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation_customer
FOREIGN KEY ( fk_customer_id) REFERENCES customer (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation_car
FOREIGN KEY ( fk_car_id) REFERENCES car (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation__branch_office_pickup
FOREIGN KEY ( fk_pickup_office_id) REFERENCES branch_office (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation__branch_office_return
FOREIGN KEY ( fk_return_office_id) REFERENCES branch_office (id);

ALTER TABLE car
ADD CONSTRAINT fk_car_model
FOREIGN KEY ( fk_model_id) REFERENCES model (id);

ALTER TABLE car
ADD CONSTRAINT fk_model_brand
FOREIGN KEY ( fk_brand_id) REFERENCES brand (id);

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_reservation
FOREIGN KEY ( fk_reservation_id) REFERENCES reservation (id);
