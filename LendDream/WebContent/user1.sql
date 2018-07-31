CREATE TABLE user1 (
  userName varchar(20) DEFAULT NULL,
  userNickname varchar(20) DEFAULT NULL,
  userID varchar(20) NOT NULL,
  userPassword1 varchar(20) DEFAULT NULL,
  userPassword2 varchar(20) DEFAULT NULL,
  userMail1 varchar(20) DEFAULT NULL,
  userMail2 varchar(20) DEFAULT NULL,
  userPhone varchar(20) DEFAULT NULL,
  userAddress varchar(50) DEFAULT NULL,
  PRIMARY KEY (userID)
) ENGINE=InnoDB;