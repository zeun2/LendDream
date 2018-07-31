<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
      UserDAO userDAO = new UserDAO();
      
      String test = request.getParameter("userID");
      String result = userDAO.findpw(test); 

      /*String result = userDAO.findpw(user.getUserID());*/ 
      if (result == "비밀번호 불일치") {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지 않는 아이디입니다. 회원가입을 해주세요 :)')");
         script.println("location.href = 'join1.jsp'");
         script.println("</script>");
      }
      else {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호는 " + result + " 입니다.')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
      }
   %>
</body>
</html>