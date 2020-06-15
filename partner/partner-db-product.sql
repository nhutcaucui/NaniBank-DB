CREATE DATABASE IF NOT EXISTS nanibank;

USE nanibank;

DROP TABLE IF EXISTS partner;
DROP TABLE IF EXISTS partner_transaction_history;

CREATE TABLE partner (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(32),
    publicKey varchar(512),
    hashMethod varchar(128),
    PRIMARY KEY (id)
);

CREATE TABLE partner_transaction_history (
    id int NOT NULL AUTO_INCREMENT,
    from_account bigint,
    to_account bigint,
    amount float,
    partner_id int,
    message varchar(64),
    time int,
    PRIMARY KEY (id)
);