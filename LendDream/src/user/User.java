package user;

public class User {
   
   private String userName; // 이름
   private String userNickname; 
   private String userID;            // 아이디
   private String userPassword1; // 비밀번호
   private String userPassword2;
   private String userMail1;        // 이메일 - @ 앞부분
   private String userMail2;        // 이메일 - @ 뒷부분
   private String userPhone;  // 전화    
   private String userAddress;
   private String userdibs ; //찜
   private String img; 
    
    
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getUserNickname() {
      return userNickname;
   }
   public void setUserNickname(String userNickname) {
      this.userNickname = userNickname;
   }
   public String getUserID() {
      return userID;
   }
   public void setUserID(String userID) {
      this.userID = userID;
   }
   public String getUserPassword1() {
      return userPassword1;
   }
   public void setUserPassword1(String userPassword1) {
      this.userPassword1 = userPassword1;
   }
   public String getUserPassword2() {
      return userPassword2;
   }
   public void setUserPassword2(String userPassword2) {
      this.userPassword2 = userPassword2;
   }
   public String getUserMail1() {
      return userMail1;
   }
   public void setUserMail1(String userMail1) {
      this.userMail1 = userMail1;
   }
   public String getUserMail2() {
      return userMail2;
   }
   public void setUserMail2(String userMail2) {
      this.userMail2 = userMail2;
   }
   public String getUserPhone() {
      return userPhone;
   }
   public void setUserPhone(String userPhone) {
      this.userPhone = userPhone;
   }
   public String getUserAddress() {
      return userAddress;
   }
   public void setUserAddress(String userAddress) {
      this.userAddress = userAddress;
   }
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getUserdibs() {
	return userdibs;
}
public void setUserdibs(String userdibs) {
	this.userdibs = userdibs;
}
    

}