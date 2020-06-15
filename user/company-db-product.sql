CREATE DATABASE IF NOT EXISTS nanibank;
USE nanibank;


DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS admin;


CREATE TABLE employee(
    id int NOT NULL AUTO_INCREMENT,
    username varchar(32),
    password varchar(256),
    PRIMARY KEY (id)
);

CREATE TABLE admin(
    id int NOT NULL AUTO_INCREMENT,
    username varchar(32),
    password varchar(256),
    PRIMARY KEY (id)
);

