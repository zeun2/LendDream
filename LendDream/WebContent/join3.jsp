<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/shop-homepage.css" rel="stylesheet">
   
   <script src="js/bootstrap.min.js"></script>
   <script src="jquery/jquery.min.js"></script>

<style>

   form{padding-top:50px;}
   
   #notice {
     display: inline-block;
     margin-bottom: 12px;
     border-radius: 5px;
     width: 600px;
     padding: 5px;
     border: 2px skyblue solid;
   }
   
   #rules {
     width: 600px;
     height: 130px;
     padding: 5px;
     border: skyblue solid 2px;
     border-radius: 5px;
   }
   
   #agree {
      display: right;
   }
   
	   .parallax-div {
	    height: 500px;
	    background: url("http://res.cloudinary.com/tempest/image/upload/c_limit,cs_srgb,dpr_1.0,q_80,w_10000/MTMwOTgxMTI5NDk3OTA5NzI2.jpg");
	    background-size: cover;
	    background-attachement: fixed;
	}
	
	.parallax-text {
	    overflow: hidden;
	    background: #fff;
	    color: #3a3a3a;
	    font-size: 86px;
	    line-height: 86px;
	    font-weight: 700;
	    text-transform: uppercase;
	    mix-blend-mode: lighten;
	    margin-top: 50px;
	    height: 500px;
	}

   .panel {
             margin-bottom: 20px;
             background-color: #fff;
             border: 1px solid transparent;
             border-radius: 4px;
             -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
             box-shadow: 0 1px 1px rgba(0,0,0,.05);
         }
         .panel-info {
             border-color: #bce8f1;
             width: 600px;
             padding: 1rem;
         }
         .panel-info>.panel-heading{
            color: #31708f;
             background-color: #d9edf7;
             border-color: #bce8f1;
         }
         .panel-heading {
             padding: 10px 15px;
             border-bottom: 1px solid transparent;
             border-top-left-radius: 3px;
             border-top-right-radius: 3px;
         }

      
</style>


</head>
<body>
      <%@ include file="nav.jsp" %>
     
            <div class="container">
            <div class="row">
           
       <%@ include file="left_bar.jsp" %>
       
<div id="container" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
   <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">3.가입 완료</div>
                        </div>
                        
    <div class="panel-body" >                    
                        
  <div class="container-fluid">
    <div class="parallax-div">
        <h1 class="parallax-text">
            회원 가입을 <br/><br/>축하합니다 <br/><br/>반갑습니다!
        </h1>
    </div>
</div>   
    
<center>
	<a href="login.jsp"><input type="submit" value="로그인 하러가기→"></a>
	<a href="index.jsp"><input type="submit" value="홈화면으로→"></a>
	
</center>
</div>

</div>
</div>
</div>
</div>


</body>
</html>