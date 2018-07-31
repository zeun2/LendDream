<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>

    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
    
   </style>

      <%
         UserDAO userDAO = new UserDAO();
         int result = userDAO.confirmId(user.getUserID());
         
      %>

   <script>
   
      // 회원가입창의 아이디 입력란의 값을 가져옴.
       function pValue() {
           document.getElementById("userId").value = opener.document.userInfo.userID.value;
      }
         
         
      // 아이디 중복체크
      function idCheck(){
         <%
            String userid = request.getParameter("userid");
            int n = userDAO.confirmId(userid);
         %>
            var test = <%= n %>;
         
            if(test == 1 ){
               
               document.getElementById("cancelBtn").style.visibility='visible';
                   document.getElementById("useBtn").style.visibility='hidden';
                   document.getElementById("msg").innerHTML ="<span style='color: red;'>이미 존재하는 아이디 입니다.</span>";
                   opener.parent.location.reload();
                   // document.getElementById("pInput").value.reload();
                   
            }else {
             
               document.getElementById("cancelBtn").style.visibility='hidden';
                   document.getElementById("useBtn").style.visibility='visible';
                   document.getElementById("msg").innerHTML = "<span style='color: blue;'>사용 가능한 아이디 입니다.</span>";
            }
      
      }
      
      
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.userInfo.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.userInfo.userID.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    

        

   
      
   </script>
</head>
<body onload="pValue()">

   
<div id="wrap">
   <br>
   <b><font size="4" color="gray">아이디 중복체크</font></b>
   <hr size="1" width="460">
   <br>
   <div id="chk">
      <form id="checkForm">
         <input type="text" name="idinput" id="userId">
         <input type="button" value="중복확인" onclick="idCheck();"> 
      </form>
      <div id="msg"></div>
      <br>
      <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
      <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
   </div>
</div>




</body>
</html>