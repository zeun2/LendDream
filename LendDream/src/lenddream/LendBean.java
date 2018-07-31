package lenddream;

import java.io.*;
import java.sql.*;
import java.util.*;


public class LendBean {
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

	
	//신규 상품 메시지 추가 메서드
	public boolean insertDB(LendProduct lendproduct) {
		connect();
		String sql = "insert into product(id,prod_name,category,description,price,from_d,to_d,img) values(?,?,?,?,?,?,?,?)";
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, lendproduct.getId());
				pstmt.setString(2, lendproduct.getProd_name());
				pstmt.setString(3, lendproduct.getCategory());
				pstmt.setString(4, lendproduct.getDescription());
				pstmt.setString(5, lendproduct.getPrice());
				pstmt.setString(6, lendproduct.getFrom_d());
				pstmt.setString(7, lendproduct.getTo_d());
				pstmt.setString(8, lendproduct.getImg());
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
	
	//제품 등록한 뒤, 상세페이지에 대한 메서드
	  public int getlastNum() {
		connect();
		
		String sql = "select max(prod_num) as prod_num from product";
		int i=0;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			i = rs.getInt("prod_num");
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return i;
	}
	
	
	
	// 전체 상품 목록을 가져오는 메서드
	public ArrayList<LendProduct> getDBList() {
		connect();
		ArrayList<LendProduct> datas = new ArrayList<LendProduct>();
		
		String sql = "select * from product order by prod_num desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LendProduct lendproduct = new LendProduct();
				
				lendproduct.setProd_num(rs.getInt("prod_num"));
				lendproduct.setProd_name(rs.getString("prod_name"));
				lendproduct.setCategory(rs.getString("category"));
				lendproduct.setDescription(rs.getString("description"));
				lendproduct.setPrice(rs.getString("price"));
				lendproduct.setFrom_d(rs.getString("from_d"));
				lendproduct.setTo_d(rs.getString("to_d"));
				lendproduct.setImg(rs.getString("img"));
				lendproduct.setId(rs.getString("id"));
				lendproduct.setView(rs.getInt("view"));
				datas.add(lendproduct);
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
	//조회수 업데이트 
	public boolean updateView(int prod_num) {
		connect();
		String sql  = " UPDATE product";
		sql += " SET view = view + 1";
		sql += " WHERE prod_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,prod_num);
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
	
	//특정 물품 게시글 가져오는 메서드
		public LendProduct getDB(int prod_num) {
			connect();
			
			
			String sql = "select * from product where prod_num=?";
			LendProduct lendproduct = new LendProduct();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,prod_num);
				ResultSet rs = pstmt.executeQuery();
				updateView(prod_num);
				// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
				rs.next();
				lendproduct.setProd_name(rs.getString("prod_name"));
				lendproduct.setCategory(rs.getString("category"));
				lendproduct.setDescription(rs.getString("description"));
				lendproduct.setPrice(rs.getString("price"));
				lendproduct.setFrom_d(rs.getString("from_d"));
				lendproduct.setTo_d(rs.getString("to_d"));
				lendproduct.setImg(rs.getString("img"));
				lendproduct.setId(rs.getString("id"));
				lendproduct.setView(rs.getInt("view"));
				lendproduct.setProd_num(rs.getInt("prod_num"));
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				
				disconnect();
			}
			return lendproduct;
		}
		// User가 올린 상품 목록을 가져오는 메서드
		public ArrayList<LendProduct> getMysell(String userid) {
			connect();
			ArrayList<LendProduct> datas = new ArrayList<LendProduct>();
			
			String sql = "select * from product where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userid);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					LendProduct lendproduct = new LendProduct();
					
					lendproduct.setProd_num(rs.getInt("prod_num"));
					lendproduct.setProd_name(rs.getString("prod_name"));
					lendproduct.setCategory(rs.getString("category"));
					lendproduct.setDescription(rs.getString("description"));
					lendproduct.setPrice(rs.getString("price"));
					lendproduct.setFrom_d(rs.getString("from_d"));
					lendproduct.setTo_d(rs.getString("to_d"));
					lendproduct.setImg(rs.getString("img"));
					lendproduct.setId(rs.getString("id"));
					lendproduct.setView(rs.getInt("view"));
					datas.add(lendproduct);
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
		//게시글 수정 
		public boolean updateDB(LendProduct lendproduct) {
			connect();
			
			String sql ="update product set prod_name=?,category=?, description=?, price=?, to_d=?, img=? where prod_num=?";		
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,lendproduct.getProd_name());
				pstmt.setString(2, lendproduct.getCategory());
				pstmt.setString(3, lendproduct.getDescription());
				pstmt.setString(4, lendproduct.getPrice());
				pstmt.setString(5, lendproduct.getTo_d());
				pstmt.setString(6, lendproduct.getImg());
				pstmt.setInt(7, lendproduct.getProd_num());
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
		//게시글 삭제
		public boolean deleteDB(int prod_num) {
			connect();
			
			String sql = "delete from product where prod_num=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,prod_num);
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
		   //대여신청 메서드
		   public boolean lendDB(LendProduct2 lendproduct2) {
		      connect();
		      //sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		      String sql = "insert into lend(id,prod_num,from_d,to_d,price1,price2,delivery) values(?,?,?,?,?,?,?)";
		      try {
		    	  	   
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, lendproduct2.getId());
		            pstmt.setInt(2, lendproduct2.getProd_num());
		            pstmt.setString(3, lendproduct2.getFrom_d());
		            pstmt.setString(4, lendproduct2.getTo_d());
		            pstmt.setString(5, lendproduct2.getPrice1());
		            pstmt.setString(6, lendproduct2.getPrice2());
		            pstmt.setString(7, lendproduct2.getDelivery());
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
		 //대여카운트 update
			public boolean updateLend(int prod_num) {
				connect();
				String sql  = " UPDATE product";
				sql += " SET lend_count = lend_count + 1";
				sql += " WHERE prod_num = ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1,prod_num);
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
		   // User가 대여신청한 상품 목록을 가져오는 메서드
		   public ArrayList<LendProduct2> getMylend(String userid) {
		      connect();
		      ArrayList<LendProduct2> datas = new ArrayList<LendProduct2>();
		      
		      String sql = "select * from lend where id=?";
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1,userid);
		         ResultSet rs = pstmt.executeQuery();
		         while(rs.next()) {
		            LendProduct2 lendproduct2= new LendProduct2();
		            
		            lendproduct2.setId(rs.getString("id"));
		            lendproduct2.setProd_num(rs.getInt("prod_num"));
		            lendproduct2.setFrom_d(rs.getString("from_d"));
		            lendproduct2.setTo_d(rs.getString("to_d"));
		            lendproduct2.setPrice1(rs.getString("price1"));
		            lendproduct2.setPrice2(rs.getString("price2"));
		            lendproduct2.setDelivery(rs.getString("delivery"));
		            datas.add(lendproduct2);
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
		   //조회수 내림차순 정렬 
		   public ArrayList<LendProduct> topView() {
				connect();
				ArrayList<LendProduct> datas = new ArrayList<LendProduct>();
				
				String sql = "select * from product order by view desc";
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						LendProduct lendproduct = new LendProduct();
						
						lendproduct.setProd_num(rs.getInt("prod_num"));
						lendproduct.setProd_name(rs.getString("prod_name"));
						lendproduct.setCategory(rs.getString("category"));
						lendproduct.setDescription(rs.getString("description"));
						lendproduct.setPrice(rs.getString("price"));
						lendproduct.setFrom_d(rs.getString("from_d"));
						lendproduct.setTo_d(rs.getString("to_d"));
						lendproduct.setImg(rs.getString("img"));
						lendproduct.setId(rs.getString("id"));
						lendproduct.setView(rs.getInt("view"));
						datas.add(lendproduct);
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
		 //대여 내림차순 정렬 
		   public ArrayList<LendProduct> topLend() {
				connect();
				ArrayList<LendProduct> datas = new ArrayList<LendProduct>();
				
				String sql = "select * from product order by lend_count desc";
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						LendProduct lendproduct = new LendProduct();
						
						lendproduct.setProd_num(rs.getInt("prod_num"));
						lendproduct.setProd_name(rs.getString("prod_name"));
						lendproduct.setCategory(rs.getString("category"));
						lendproduct.setDescription(rs.getString("description"));
						lendproduct.setPrice(rs.getString("price"));
						lendproduct.setFrom_d(rs.getString("from_d"));
						lendproduct.setTo_d(rs.getString("to_d"));
						lendproduct.setImg(rs.getString("img"));
						lendproduct.setId(rs.getString("id"));
						lendproduct.setView(rs.getInt("view"));
						lendproduct.setLend_count(rs.getInt("lend_count"));
						datas.add(lendproduct);
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
		   //사용자의 대여신청 물품에 대한 정보 1개 가져오기
		   public LendProduct2 getMylend(String userid, int prod_num) {
		      connect();
		         
		      String sql = "select * from lend where id=? and prod_num="+prod_num;
		      LendProduct2 lendproduct2 = new LendProduct2();
		         
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1,userid);
		         ResultSet rs = pstmt.executeQuery();
		         
		         // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
		         rs.next();
		         lendproduct2.setId(rs.getString("id"));
		         lendproduct2.setProd_num(rs.getInt("prod_num"));
		         lendproduct2.setFrom_d(rs.getString("from_d"));
		         lendproduct2.setTo_d(rs.getString("to_d"));
		         lendproduct2.setPrice1(rs.getString("price1"));
		         lendproduct2.setPrice2(rs.getString("price2"));
		         lendproduct2.setDelivery(rs.getString("delivery"));
		         rs.close();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      finally {
		         disconnect();
		      }
		      return lendproduct2;
		   }
		   
		   //물품에 대여한 날짜 모두 받아오기
		   public ArrayList<String> allDates(int prod_num){
		      connect();
		      ArrayList<String> alldates = new ArrayList<String>();
		      
		      String sql = "select from_d,to_d from lend where prod_num="+prod_num;
		      try {
		         pstmt = conn.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery();
		         while(rs.next()) {
		            alldates.add(rs.getString("from_d"));
		            alldates.add(rs.getString("to_d"));
		         }
		         rs.close();
		            
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      finally {
		         disconnect();
		      }
		      return alldates;
		   }
		   
		   //물품에 대여한 신청자 id 모두 받아오기
		   public ArrayList<String> allLenders(int prod_num){
		      connect();
		      ArrayList<String> alllenders = new ArrayList<String>();
		      
		      String sql = "select id from lend where prod_num="+prod_num;
		      try {
		         pstmt = conn.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery();
		         while(rs.next()) {
		            alllenders.add(rs.getString("id"));
		         }
		         rs.close();
		            
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      finally {
		         disconnect();
		      }
		      return alllenders;
		   }
		   
		   //찜목록 변경하기
		   public boolean change_dib(String user_id, String userdibs) {
		      connect();
		      String sql = "update user1 set userdibs=? where userID=?";
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, userdibs);
		         pstmt.setString(2,  user_id);
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
		   
		   //찜목록 가져오기
		   public String get_dibs(String user_id) {
		      connect();
		      String mydibs;
		      String sql = "select userdibs from user1 where userID=?";
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, user_id);
		         ResultSet rs = pstmt.executeQuery();
		         
		         rs.next();
		         mydibs = rs.getString("userdibs");
		      
		      } catch (SQLException e) {
		         e.printStackTrace();
		         return "찜 목록 가져오기 실패";
		      }
		      finally {
		         disconnect();
		      }
		      return mydibs;
		   }
		   
		
}
