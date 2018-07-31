create table reply(
    -> re_num int(11) not null primary key auto_increment,
    -> prod_num int(11) not null,
    -> userID varchar(20) not null,
    -> DATE datetime,
    -> message varchar(20) not null,
    -> foreign key (prod_num) references product(prod_num))ENGINE=InnoDB;