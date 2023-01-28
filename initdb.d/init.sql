CREATE DATABASE IF NOT EXISTS sample;
USE sample;

CREATE TABLE IF NOT EXISTS users
(
  `id`       int(11) NOT NULL AUTO_INCREMENT,
  `name`     text,
  PRIMARY KEY (`id`)
);

INSERT INTO users (name) VALUES ("hiroaki"),("rirazou");

CREATE TABLE IF NOT EXISTS items
(
  `id`       int(11) NOT NULL AUTO_INCREMENT,
  `name`     text,
  PRIMARY KEY (`id`)
);

INSERT INTO items (name) VALUES ("商品１"),("商品２");
