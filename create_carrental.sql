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
	phone_nr INT unsigned NOT NULL,
	fk_city_id INT unsigned NOT NULL,
	street NVARCHAR(100),
    street_nr NVARCHAR(6),
    drivers_license_nr NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS phone_country_code (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    country_code NVARCHAR(6) NOT NULL,
    country_name NVARCHAR(55) NOT NULL,
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
	phone_nr INT unsigned NOT NULL,
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
	CONSTRAINT pk_car PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS model (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    car_type NVARCHAR(20) NOT NULL,
    fk_brand_id INT unsigned NOT NULL,
    CONSTRAINT pk_model PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS brand (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    brandname NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_brand PRIMARY KEY(id)
);
