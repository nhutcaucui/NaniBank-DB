CREATE DATABASE IF NOT EXISTS nanibank;
USE nanibank;

DROP TABLE IF EXISTS customer_information;
DROP TABLE IF EXISTS customer_receiver;
DROP TABLE IF EXISTS customer_token;
DROP TABLE IF EXISTS customer_message;
DROP TABLE IF EXISTS saving_account;
DROP TABLE IF EXISTS debit_account;
DROP TABLE IF EXISTS transaction_history;
DROP TABLE IF EXISTS transaction_pending;
DROP TABLE IF EXISTS debt;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(32),
    password varchar(128),
    PRIMARY KEY (id)
);

CREATE TABLE customer_information(
    customer_id int NOT NULL,
    email varchar(64),
    name varchar(128),
    phone varchar(12),
    birthdate int
);

CREATE TABLE customer_receiver(
    customer_id int NOT NULL,
    receiver bigint NOT NULL,
    remind_name varchar(128) NOT NULL,
    PRIMARY KEY (customer_id, receiver)
);

CREATE TABLE customer_message (
    message_id int NOT NULL,
    customer_id int NOT NULL,
    title varchar(32),
    message varchar(256),
    time int,
    is_read boolean,
    PRIMARY KEY (message_id)
);

CREATE TABLE customer_token(
    customer_id int NOT NULL,
    access_token varchar(128),
    refresh_token varchar(128),
    PRIMARY KEY (refresh_token)
);

CREATE TABLE transaction_history (
    id int NOT NULL AUTO_INCREMENT,
    from_account bigint,
    to_account bigint,
    amount decimal(15, 2),
    message varchar(64),
    type int,
    PRIMARY KEY (id)
);

CREATE TABLE saving_account (
    name varchar(32),
    owner int NOT NULL,
    balance decimal(15, 2),
    created_date int,
    interest_rate float,
    time int,
    PRIMARY KEY (name, owner)
);

CREATE TABLE debit_account (
    id bigint NOT NULL,
    owner int NOT NULL,
    balance decimal(15, 2),
    issue_date int,
    PRIMARY KEY (id)
);

CREATE TABLE debt (
    id int NOT NULL AUTO_INCREMENT,
    creditor int NOT NULL,
    debtor int NOT NULL,
    name varchar(32),
    description varchar(256),
    due_time int,
    PRIMARY KEY (id)
);

ALTER TABLE customer_information ADD FOREIGN KEY (customer_id) REFERENCES customer(id);
ALTER TABLE customer_receiver ADD FOREIGN KEY (customer_id) REFERENCES customer(id);
ALTER TABLE customer_receiver ADD FOREIGN KEY (receiver) REFERENCES debit_account(id);
ALTER TABLE customer_token ADD FOREIGN KEY (customer_id) REFERENCES customer(id);
ALTER TABLE customer_message ADD FOREIGN KEY (customer_id) REFERENCES customer(id);
ALTER TABLE debit_account ADD FOREIGN KEY (owner) REFERENCES customer (id);
ALTER TABLE saving_account ADD FOREIGN KEY (owner) REFERENCES customer (id);
ALTER TABLE debt ADD FOREIGN KEY (creditor) REFERENCES customer (id);
ALTER TABLE debt ADD FOREIGN KEY (debtor) REFERENCES customer (id);