CREATE DATABASE IF NOT EXISTS commerce;
USE commerce;

CREATE TABLE User(
  id              INT AUTO_INCREMENT NOT NULL,
  first_name      VARCHAR(50) NOT NULL,
  last_name       VARCHAR(50) NOT NULL,
  email           VARCHAR(100) NOT NULL,
  password        VARCHAR(100) NOT NULL,
  role            BIT,
  image           VARCHAR(100),
  CONSTRAINT pk_user PRIMARY KEY(id),
  CONSTRAINT uq_email UNIQUE(email)

)ENGINE=InnoDB;

INSERT INTO User VALUES(NULL, 'Admin', 'Admin', 'admin@admin.com', 'secret', 0, NULL);

CREATE TABLE Category(
  id      INT AUTO_INCREMENT NOT NULL,
  name    VARCHAR(50) NOT NULL,
  CONSTRAINT pk_category PRIMARY KEY(id) 
)ENGINE=InnoDB;

INSERT INTO category VALUES(NULL, 'Sport'), (NULL, 'Electronic');

CREATE TABLE Product(
  id              INT AUTO_INCREMENT NOT NULL,
  category_id     INT NOT NULL,
  name            VARCHAR(100) NOT NULL,
  description     TEXT,
  price           FLOAT(100,2) NOT NULL,
  stock           INT NOT NULL,
  offert          CHAR(2),
  create_date     DATE NOT NULL,
  image           VARCHAR(100),
  CONSTRAINT pk_product PRIMARY KEY(id),
  CONSTRAINT fk_product_category FOREIGN KEY(category_id) REFERENCES Category(id)
)ENGINE=InnoDB;


CREATE TABLE cash_order(
  id           INT AUTO_INCREMENT NOT NULL,
  user_id      INT NOT NULL,
  state        VARCHAR(100) NOT NULL,
  city         VARCHAR(100) NOT NULL,
  direction    VARCHAR(150) NOT NULL,
  cost         FLOAT(200,2) NOT NULL,
  status       VARCHAR(20) NOT NULL,
  create_date  DATETIME,
  CONSTRAINT pk_order PRIMARY KEY(id),
  CONSTRAINT fk_order_user FOREIGN KEY(user_id) REFERENCES User(id)
)ENGINE=InnoDB;

CREATE TABLE cashorder_datail(
  id             INT AUTO_INCREMENT NOT NULL,
  cash_order_id       INT NOT NULL,
  product_id     INT NOT NULL,
  unit           INT NOT NULL,
  CONSTRAINT pk_order_detail PRIMARY KEY(id),
  CONSTRAINT fk_order FOREIGN KEY(cash_order_id) REFERENCES cash_order(id),
  CONSTRAINT fk_order_product FOREIGN KEY(product_id) REFERENCES Product(id)
)ENGINE=InnoDB;
