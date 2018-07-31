<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="lenddream.*, java.util.*,java.net.URLEncoder"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ld" class="lenddream.LendBean"/> 
<jsp:useBean id="lendproduct" class="lenddream.LendProduct"/>
<jsp:setProperty name="lendproduct" property="*"/> 
<jsp:useBean id="lendproduct2" class="lenddream.LendProduct2"/>
<jsp:setProperty name="lendproduct2" property="*"/>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	
	// 물품 등록 요청인 경우
	if(action.equals("insert")) {		
		if(ld.insertDB(lendproduct)) {
			int prod_num = ld.getlastNum();
			response.sendRedirect("detail.jsp?prod_num="+prod_num);
				
		}
		else
			throw new Exception("DB 입력오류");
	}
	
	// 수정 등록 요청인 경우
	else if(action.equals("update")) {
		 if(ld.updateDB(lendproduct)) {
				response.sendRedirect("detail.jsp?prod_num="+lendproduct.getProd_num());
				}
				else
					throw new Exception("DB 갱신오류");
		
		}
	// 대여 신청할 경우 
	   else if(action.equals("lend")) {   
	      if(ld.lendDB(lendproduct2)) {
	    	  	ld.updateLend(lendproduct2.getProd_num());
	         response.sendRedirect("mypage.jsp#mylend");
	      }
	      else{
	         throw new Exception("DB 입력오류");
	      }
	   }
	// 찜목록 추가인 경우
	   else if(action.equals("add_dib")) {
	      String user_id = request.getParameter("user_id");
	      String mydibs = request.getParameter("mydibs");
	      String where = request.getParameter("where");
	      String prod_num = request.getParameter("prod_num");
	      
	      if(ld.change_dib(user_id,mydibs)){
	         out.println("<script>if(confirm('찜 목록에 추가되었습니다. 지금 확인하시겠습니까?')==true){location.href='mypage.jsp#mydib';} else{location.href='"+where+".jsp?prod_num="+prod_num+"';}</script>");
	      }
	      else{
	         throw new Exception("DB 입력오류");
	      }
	   }
	   
	   //찜목록 삭제
	   else if(action.equals("cancle_dib")) {
	      String user_id = request.getParameter("user_id");
	      String mydibs = request.getParameter("mydibs");
	      String where = request.getParameter("where");
	      String prod_num = request.getParameter("prod_num");
	      
	      if(ld.change_dib(user_id,mydibs)){
	         response.sendRedirect(where+".jsp?prod_num="+prod_num);
	      }
	      else{
	         throw new Exception("DB 입력오류");
	      }
	   }
	   
	   //검색 결과
	   else if(action.equals("search")) {
	      String search = URLEncoder.encode(request.getParameter("search"));
	      response.sendRedirect("index.jsp?s_r="+search);
	   }
	
	

	
%>