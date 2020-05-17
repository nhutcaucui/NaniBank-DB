DROP DATABASE IF EXISTS partner;
CREATE DATABASE partner;

USE partner;

DROP TABLE IF EXISTS partner;

CREATE TABLE partner (
    id int(10) NOT NULL AUTO_INCREMENT,
    name varchar(32),
    publicKey varchar(512),
    type int(2),
    PRIMARY KEY (id)
);
