CREATE TABLE product (
    prod_num int(100) primary key auto_increment,
     id varchar(20),
     prod_name varchar(30),
     category varchar(30),
     description text,
     price varchar(30),
     from_d varchar(30),
     to_d varchar(30),
     img varchar(20),
     view int(11) default'0',
     lend_count int(100) default'0',
     foreign key (id)
     references user1(userID) on delete cascade 
)ENGINE=InnoDB;