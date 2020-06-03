CREATE DATABASE IF NOT EXISTS nanibank;
USE nanibank;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_information;
DROP TABLE IF EXISTS customer_receiver;
DROP TABLE IF EXISTS customer_token;
DROP TABLE IF EXISTS customer_message;
DROP TABLE IF EXISTS saving_account;
DROP TABLE IF EXISTS debit_account;
DROP TABLE IF EXISTS transaction_history;
DROP TABLE IF EXISTS transaction_pending;
DROP TABLE IF EXISTS debt;

CREATE TABLE customer (
    id int(20) NOT NULL AUTO_INCREMENT,
    username varchar(32),
    password varchar(128),
    PRIMARY KEY (id, username)
);

CREATE TABLE customer_information(
    id int(20) NOT NULL,
    nation varchar(5),
    name varchar(128),
    phone varchar(12),
    birthdate date
);

CREATE TABLE customer_receiver(
    id int(20) NOT NULL,
    receiver int(20) NOT NULL,
    remind_name varchar(128) NOT NULL,
    PRIMARY KEY (id, receiver)
);

CREATE TABLE customer_message (
    id int(20) NOT NULL,
    owner int(20) NOT NULL,
    title varchar(32),
    message varchar(256),
    time date,
    is_read boolean,
    PRIMARY KEY (id)
);

CREATE TABLE customer_token(
    id int(20) NOT NULL,
    access_token varchar(128),
    refresh_token varchar(128),
    PRIMARY KEY (refresh_token)
);

CREATE TABLE transaction_pending(
    id int(20),
    from_account int(20),
    to_account int(20),
    otp varchar(8),
    time_out date,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_history (
    id int(20),
    from_account int(20),
    to_account int(20),
    message varchar(64),
    amount float
);

CREATE TABLE saving_account (
    id int(20),
    name varchar(32),
    owner int(20) NOT NULL,
    balance float,
    created_date date,
    interest_rate float,
    time int(10),
    PRIMARY KEY (id)
);

CREATE TABLE debit_account (
    id int(20) NOT NULL,
    owner int(20) NOT NULL,
    balance float,
    issue_date date,
    PRIMARY KEY (owner)
);

CREATE TABLE debt (
    creditor int(20) NOT NULL,
    debtor int(20) NOT NULL,
    name varchar(32),
    description varchar(256),
    due_time date
);

ALTER TABLE customer_information ADD FOREIGN KEY (id) REFERENCES customer(id);
ALTER TABLE customer_receiver ADD FOREIGN KEY fk_user (id) REFERENCES customer(id);
ALTER TABLE customer_receiver ADD FOREIGN KEY fk_receiver (receiver) REFERENCES customer(id);
ALTER TABLE customer_token ADD FOREIGN KEY fk_user (id) REFERENCES customer(id);
ALTER TABLE customer_message ADD FOREIGN KEY fk_user (owner) REFERENCES customer(id);
ALTER TABLE debit_account ADD FOREIGN KEY  fk_user (owner) REFERENCES customer (id);
ALTER TABLE save_account ADD FOREIGN KEY  fk_user (owner) REFERENCES customer (id);
ALTER TABLE debt ADD FOREIGN KEY  fk_creditor (creditor) REFERENCES customer (id);
ALTER TABLE debt ADD FOREIGN KEY  fk_debtor (debtor) REFERENCES customer (id);