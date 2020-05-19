CREATE DATABASE IF NOT EXISTS nanibank;
USE nanibank;

CREATE TABLE employee(
    id int(10) NOT NULL AUTO_INCREMENT,
    username varchar(32),
    password varchar(128)

);

CREATE TABLE admin(
    id int(10) NOT NULL,
    username varchar(32),
    password varchar(128)
);

