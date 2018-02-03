DROP DATABASE IF EXISTS cr09_irene_theiss_carrental;

CREATE DATABASE IF NOT EXISTS cr09_irene_theiss_carrental DEFAULT CHARACTER SET utf8;

USE cr09_irene_theiss_carrental;

-- create tables
CREATE TABLE IF NOT EXISTS unit (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name NVARCHAR(20) NOT NULL,
    fk_floor_id INT unsigned NOT NULL,
    fk_doctor_code NVARCHAR(8) NOT NULL,
    CONSTRAINT pk_unit PRIMARY KEY(id)
);