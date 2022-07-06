CREATE DATABASE IF NOT EXISTS cho_tot;
USE cho_tot;

CREATE TABLE IF NOT EXISTS users
(
    id        INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username  NVARCHAR(50) NOT NULL UNIQUE,
    passwd    VARCHAR(50)  NOT NULL,
    address   VARCHAR(255),
    email     VARCHAR(50) UNIQUE,
    phone     VARCHAR(12) UNIQUE,
    user_role BOOLEAN DEFAULT 0
);

CREATE TABLE IF NOT EXISTS products
(
    id           INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name NVARCHAR(255) NOT NULL,
    user_id      INT,
    cat_id       VARCHAR(10),
    type_id      VARCHAR(10),
    price        DOUBLE(15, 2),
    state        BOOLEAN,
    created_time DATETIME,
    expired_time DATETIME,
    address      NVARCHAR(255),
    content      NVARCHAR(255)
);

CREATE TABLE IF NOT EXISTS categories
(
    id       VARCHAR(10)  NOT NULL PRIMARY KEY,
    cat_name NVARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS sub_categories
(
    id        VARCHAR(10)  NOT NULL PRIMARY KEY,
    type_name NVARCHAR(50) NOT NULL,
    cat_id    VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS photos
(
    id         VARCHAR(10) NOT NULL PRIMARY KEY,
    product_id INT,
    link       VARCHAR(255)
);

ALTER TABLE products
    ADD CONSTRAINT FK_Products_Users_UserId FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE products
    ADD CONSTRAINT FK_Products_Users_CatId FOREIGN KEY (cat_id) REFERENCES categories (id);
ALTER TABLE products
    ADD CONSTRAINT FK_Products_Users_TypeId FOREIGN KEY (type_id) REFERENCES sub_categories (id);
ALTER TABLE sub_categories
    ADD CONSTRAINT FK_SubCategories_Categories_CatId FOREIGN KEY (cat_id) REFERENCES categories (id);
ALTER TABLE photos
    ADD CONSTRAINT FK_Photos_Products_ProductId FOREIGN KEY (product_id) REFERENCES products (id);