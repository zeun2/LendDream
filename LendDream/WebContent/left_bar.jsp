<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="ub" class="user.UserDAO" />

   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/shop-homepage.css" rel="stylesheet">
   
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빌려dream</title>
<script>
   function checklogin(){
      if(<%= session.getAttribute("userID")%> == null) {
         alert("로그인을 먼저 해주세요!");
         return false;
      }
   }
</script>
</head>
<body>

   <%
   String userID = null;
   if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
   }
  
    %>
    <%
    User user1 = ub.user_inform(userID); 
    %>
   
   
   
   		<div class="col-lg-3">
       	<div class="list-group">
       		<br>
         		 <div class="list-group-item">
         		<%
         		if (session.getAttribute("userID") != null) {
         		%>
         		 <img  src="img/<%= user1.getImg() %>" style="width:215px; height:215px">
         		 
         		 <%
         		}else{
         		 %>
         		<img  src="img/logo.png" style="width:215px; height:215px">
         		<%
         		}
         		%>
         		
        		</div>
        		
      
       <%
         if(userID == null) {
       %>
   
         <a href="login.jsp" class="list-group-item">로그인 / 회원가입</a>
       
        <%
         } else {
        %>
      <div class="list-group-item">
         <span style="color:blue"><%= session.getAttribute("userID") %></span>님 환영합니다.
      </div>
      <a href="logoutAction.jsp" class="list-group-item">로그아웃</a>
      
      <%
         }
      %>
       <a href="mypage.jsp" onclick="return checklogin();" class="list-group-item">마이페이지</a>
       <a href="addProduct.jsp" onclick="return checklogin();" class="list-group-item">게시물 올리기</a>
         

       </div>
   </div>
</body>
</html>