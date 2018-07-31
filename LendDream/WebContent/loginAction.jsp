<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword1" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
      UserDAO userDAO = new UserDAO();
      int result = userDAO.login(user.getUserID(), user.getUserPassword1());
      if (result == 1) {
         session.setAttribute("userID", user.getUserID());
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href = 'index.jsp'");
         script.println("</script>");
      }
      else if (result == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
      else if (result == -1) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지 않는 아이디입니다. 회원가입을 해주세요 :)')");
         script.println("location.href = 'join1.jsp'");
         script.println("</script>");
      }
      else if (result == -2) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류가 발생했습니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
   %>
</body>
</html>