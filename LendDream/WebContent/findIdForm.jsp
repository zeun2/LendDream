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


<!------ Include the above in your HEAD tag ---------->
<body>
   <%@ include file="nav.jsp" %>
    <!-- Page Content -->
       <div class="container">
         <div class="row">
           <%@ include file="left_bar.jsp" %>
     
              <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                  <div class="panel panel-info" >
                          <div class="panel-heading">
                              <div class="panel-title">아이디 찾기</div>
                             
                          </div>     
      
                          <div style="padding-top:30px" class="panel-body" >
      
                              <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                                  
                              <form method="post" action="findId.jsp" class="form-horizontal" role="form">
                                          
                                  <div style="margin-bottom: 25px" class="input-group">
                                              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                              <input type="text" class="form-control" name="userName" value="" placeholder="사용자 이름">                                        
                                          </div>
                                      
                                 
      
                             
      
                                      <div style="margin-top:10px" class="form-group">
                                          <!-- Button -->
      
                                          <div class="col-sm-12 controls">
                                            <input type="submit" value="아이디 찾기"  class="btn btn-success"></input>
                                            <a id="btn-fblogin" href="login.jsp" class="btn btn-primary">이전</a>
                                          </div>
                                      </div>
      
      
                                    
                                  </form>     
      
      
      
                              </div>                     
                          </div>  
              </div>
              
    </div>
   </div>
    
    </body>
</html>