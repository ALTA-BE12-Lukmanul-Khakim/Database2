
USE DATABASE altera_shop
--drop 
DROP TABLE shipping
DROP TABLE user_payment_method_detail

DROP TABLE detail_transaction
DROP TABLE product_description
-- create


CREATE DATABASE altera_shop;




CREATE TABLE `user`(
    ID_user VARCHAR (5) primary key,
    nama_user VARCHAR (255)  not NULL,
    hp VARCHAR (13)  not NULL,
    create_at TIMESTAMP default current_timestamp()
);

CREATE TABLE `alamat_user`(
   -- id int auto_increment primary key,
    alamat VARCHAR (255),
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_alamat_user_user foreign key (alamat) references user(ID_user) on delete cascade,
    primary key (alamat)
);

CREATE TABLE `type_product`(
    ID_type_product VARCHAR (5) primary key,
    nama_type_product VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp()
);

CREATE TABLE `product`(
    ID_product VARCHAR (5) primary key,
    nama_product VARCHAR (255) not NULL,
    product_type VARCHAR (5),
    merk VARCHAR (5),
    product_description VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_product_type foreign key (product_type) references type_product(ID_type_product) on delete cascade,
    constraint fk_product_merk foreign key (merk) references merk(ID_merk) on delete cascade
);

CREATE TABLE `merk`(
    ID_merk VARCHAR (5) primary key,
    nama_merk VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp()
);

CREATE TABLE `product_description`(
    id int auto_increment primary key,
    merk VARCHAR (5) ,
    product VARCHAR (5),
    deskrpsi VARCHAR (255)  not NULL,
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_product_description_product foreign key (product) references product(ID_product) on delete cascade,
    constraint fk_product_description_merk foreign key (merk) references merk(ID_merk) on delete cascade
);

CREATE TABLE `payment_method`(
    ID_payment VARCHAR (5) primary key,
    create_at TIMESTAMP default current_timestamp()
);

CREATE TABLE `payment_description`(
    payment VARCHAR (5) ,
    deskrpsi_payment VARCHAR (255) not NULL,
    create_at TIMESTAMP default current_timestamp(),
    foreign key (payment) references payment_method(ID_payment) on delete cascade,
    primary key (payment)
);


CREATE TABLE `transaction`(
    ID_transaction VARCHAR (5) primary key,
    user VARCHAR (5),
    payment VARCHAR (5),
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_transaction_user foreign key (user) references user(ID_user) on delete cascade,
    constraint fk_transaction_payment foreign key (payment) references payment_method(ID_payment) on delete cascade
);

CREATE TABLE `detail_transaction`(
    id int auto_increment primary key,
    nama_transaction VARCHAR (5) ,
    product VARCHAR (5),
    total_product VARCHAR (255) not NULL,
    total_payment VARCHAR (255) not NULL,
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_detail_transaction foreign key (nama_transaction) references transaction(ID_transaction) on delete cascade,
    constraint fk_detail_transaction_product foreign key (product) references product(ID_product) on delete cascade
);

CREATE TABLE `user_payment_method_detail`(
    id int auto_increment primary key,
    payment VARCHAR (5) ,
    user VARCHAR (5),
    payment_method_detail VARCHAR (255) not NULL,
    create_at TIMESTAMP default current_timestamp(),
    constraint fk_user_payment_method_detail_payment foreign key (payment) references payment_method(ID_payment) on delete cascade,
    constraint fk_user_payment_method_detail_user foreign key (user) references user(ID_user) on delete cascade
);


CREATE TABLE `kurir`(
    ID_kurir VARCHAR (5) primary key,
    nama_kurir VARCHAR (255) not NULL,
    updated_at datetime not NULL,
    create_at TIMESTAMP default current_timestamp()
);

--alter

ALTER TABLE kurir add ongkos_dasar VARCHAR (255) not NULL;
ALTER TABLE kurir RENAME TO shipping

ALTER TABLE user add alamat VARCHAR (255);



