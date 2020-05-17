DROP DATABASE IF EXISTS user;
CREATE DATABASE user;

USE user;

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS user_information;
DROP TABLE IF EXISTS trade_history;

CREATE TABLE account (
    id int(20),
    name varchar(32),
    balance float,
    issueDate date,
    PRIMARY KEY (id)
);

CREATE TABLE user_information(
    id int(20)
);

CREATE TABLE trade_history (
    id int(20),
    from_account int(20),
    to_account int(20),
    message varchar(64),
    amount float
);
