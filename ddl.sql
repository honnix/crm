drop table cart_order ;
drop table company; 
drop table customer; 
drop table product ; 
drop table line_item;

CREATE TABLE product (
                id IDENTITY NOT NULL,
                name VARCHAR NOT NULL, 
				version integer not null,
                description VARCHAR(1000) NOT NULL,
                price DOUBLE NOT NULL,
                CONSTRAINT id PRIMARY KEY (id)
);

CREATE TABLE company (
                id IDENTITY NOT NULL,				
				version integer not null,
                name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (id)
);

CREATE TABLE customer (
                id IDENTITY NOT NULL,
                last_name VARCHAR NOT NULL,				
				version integer not null,
                first_name VARCHAR NOT NULL, 
				email VARCHAR not null, 
				birthday date ,
                company_id BIGINT NOT NULL,
                CONSTRAINT id PRIMARY KEY (id)
);

-- Comment for table [customer]: holds customer information;


CREATE TABLE cart_order (
                id IDENTITY NOT NULL,
                date_of_order DATE NOT NULL,		
				version integer not null,
                customer_id BIGINT NOT NULL,
                in_cart BOOLEAN NOT NULL,
                CONSTRAINT id PRIMARY KEY (id)
);

CREATE TABLE line_item (
                id IDENTITY NOT NULL,
				version integer not null,
                product_id BIGINT NOT NULL,
                quantity BIGINT DEFAULT 1 NOT NULL,
                cart_order_id BIGINT NOT NULL,
                CONSTRAINT id PRIMARY KEY (id )
);

ALTER TABLE line_item ADD CONSTRAINT line_item_product_fk
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customer ADD CONSTRAINT customer_company_fk
FOREIGN KEY (company_id)
REFERENCES company (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cart_order ADD CONSTRAINT order_customer_fk
FOREIGN KEY (customer_id)
REFERENCES customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE line_item ADD CONSTRAINT line_item_cart_order_fk
FOREIGN KEY (cart_order_id)
REFERENCES cart_order (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
