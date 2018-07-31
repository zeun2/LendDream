package sns;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.util.*;

import user.UserDAO;



public class replyBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/lenddream";
	
	//데이터베이스 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//댓글 저장하기 
	public boolean reply_db(reply reply) {
		connect();
		String sql = "insert into reply(prod_num,userID,message,date) values(?,?,?,now())";
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reply.getProd_num());
				pstmt.setString(2, reply.getUserID());
				pstmt.setString(3, reply.getMessage());
				pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 해당 prod_num에 해당하는 댓글가져오기 
		public ArrayList<reply> getReply(int prod_num){
			connect();
			ArrayList<reply> datas = new ArrayList<reply>();
			
			String sql = "select * from reply where prod_num=? order by date desc";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,prod_num);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					reply reply = new reply();
					reply.setUserID(rs.getString("userID"));
					reply.setDate(rs.getDate("Date")+"/"+rs.getTime("Date"));
					reply.setMessage(rs.getString("message"));
					datas.add(reply);
				}
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return datas;
		}
		
}
