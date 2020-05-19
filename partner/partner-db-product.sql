CREATE DATABASE IF NOT EXISTS nanibank;

USE nanibank;

DROP TABLE IF EXISTS partner;

CREATE TABLE partner (
    id int(10) NOT NULL AUTO_INCREMENT,
    name varchar(32),
    publicKey varchar(512),
    type varchar(10),
    PRIMARY KEY (id)
);
