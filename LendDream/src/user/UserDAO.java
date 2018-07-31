package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
   
   private static Connection conn;
   private static PreparedStatement pstmt;
   private ResultSet rs; //정보를 담을 수 있는 객체
   
   public UserDAO() {
      try {
         String dbURL = "jdbc:mysql://127.0.0.1:3306/lenddream";
         String dbID = "root";
         String dbPassword = "1234";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public int login(String userID, String userPassword1) {
      String SQL = "SELECT userPassword1 FROM user1 WHERE userID = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userID);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            if(rs.getString(1).equals(userPassword1)) {
   
               
               return 1; //로그인 성공
            }
            else
               return 0; // 비밀번호 불일치
         }
         return -1; //아이디가 없음
      }catch (Exception e) {
         e.printStackTrace();
      }
      return -2; //데이터베이스 오류
   }
   
public int join(User user) {
   String SQL = "INSERT INTO user1 VALUES (?,?,?,?,?,?,?,?,?,?,?)";
   try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1,  user.getUserName());
      pstmt.setString(2,  user.getUserNickname());
      pstmt.setString(3,  user.getUserID());
      pstmt.setString(4,  user.getUserPassword1());
      pstmt.setString(5,  user.getUserPassword2());
      pstmt.setString(6,  user.getUserMail1());
      pstmt.setString(7,  user.getUserMail2());
      pstmt.setString(8,  user.getUserPhone());
      pstmt.setString(9,  user.getUserAddress());
      pstmt.setString(10, user.getImg());
      pstmt.setString(11, "");
      return pstmt.executeUpdate();
   } catch(Exception e) {
      e.printStackTrace();
   }
   return -1; //데이터베이스 오류
}

public String findpw(String userID) {
   String userPassword1="비밀번호 불일치";
   String SQL = "SELECT * FROM user1 WHERE userID = ?";
   try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
         if(rs.getString("userID").equals(userID)) {
            userPassword1 = rs.getString("userPassword1");
         }
         else {
            
         } 
      }
   
   }catch (Exception e) {
      e.printStackTrace();
   }
   return userPassword1;
}

public String findid(String userName) {
   String userID="사용자 이름 불일치";
   String SQL = "SELECT * FROM user1 WHERE userName = ?";
   try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1, userName);
      rs = pstmt.executeQuery();
      if (rs.next()) {
         if(rs.getString("userName").equals(userName)) {
            userID = rs.getString("userID");
         }
         else {
            
         } 
      }
   
   }catch (Exception e) {
      e.printStackTrace();
   }
   return userID;
}

//사용자 정보 가져오기
public User user_inform(String userID) {
 String sql = "select * from user1 where userID=?";
 User user = new User();
 
 try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    ResultSet rs = pstmt.executeQuery();
    
    // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
    rs.next();
    user.setUserName(rs.getString("userName"));
    user.setUserNickname(rs.getString("userNickname"));
    user.setUserID(rs.getString("userID"));
    user.setUserPassword1(rs.getString("userPassword1"));
    user.setUserMail1(rs.getString("userMail1"));
    user.setUserMail2(rs.getString("userMail2"));
    user.setUserPhone(rs.getString("userPhone"));
    user.setUserAddress(rs.getString("userAddress"));
    user.setImg(rs.getString("img"));
    rs.close();
 } catch (SQLException e) {
    e.printStackTrace();
 }
 return user;
}

public int confirmId(String userID)throws Exception {
	   int x=-1;
	   String SQL = "SELECT userID FROM user1 WHERE userID = ?";
	   try {
	      pstmt = conn.prepareStatement(SQL);
	      pstmt.setString(1, userID);
	      rs = pstmt.executeQuery();
	      if (rs.next()) 
	         x= 1;
	      else
	         x= -1;
	            
	   }catch (Exception e) {
	      e.printStackTrace();
	   }
	   return x; //데이터베이스 오류
	}


}
