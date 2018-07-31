<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userNickname" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword1" />
<jsp:setProperty name="user" property="userMail1" />
<jsp:setProperty name="user" property="userMail2" /> 
<jsp:setProperty name="user" property="userPhone" /> 
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="img" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(user.getUserName() == null || user.getUserNickname() == null || user.getUserID() == null 
		|| user.getUserPassword1() == null || user.getUserMail1() == null || user.getUserPhone() == null || user.getUserAddress() == null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'join3.jsp'");
				script.println("</script>");
			}
		}
			
		
%>

</body>
</html>