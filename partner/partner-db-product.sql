DROP DATABASE IF EXISTS partner;
CREATE DATABASE partner;

USE partner;

DROP TABLE IF EXISTS partner;

CREATE TABLE partner (
    id int(10),
    name varchar(32),
    key varchar(512),
    PRIMARY KEY (id)
);
