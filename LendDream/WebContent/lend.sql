CREATE TABLE lend (
    lend_num int(100) primary key auto_increment,
     id varchar(20),
     prod_num int(100),
     from_d varchar(30),
     to_d varchar(30),
     price1 varchar(30),
     price2 varchar(30),
     delivery varchar(10),
     foreign key (id) references user1(userID) on delete cascade on update cascade,
     foreign key (prod_num) references product(prod_num) on delete cascade on update cascade
)ENGINE=InnoDB;