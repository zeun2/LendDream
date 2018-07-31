<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*, java.util.*" %>
<jsp:useBean id="ld" class="lenddream.LendBean"/> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="css/seah.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>빌려Dream</title>
</head>
<body>
<%
   String userid = (String)session.getAttribute("userID");
   ArrayList<LendProduct> selldatas = ld.getMysell(userid);
   
   ArrayList<LendProduct2> lenddatas = ld.getMylend(userid);
   String mydibs = ld.get_dibs(userid);
   
   ArrayList<LendProduct> datas = ld.getDBList();
   
%>
<script>
var userid = '<%= userid %>';
var dib = '<%= mydibs %>';

//찜 추가
   function add_dib(n){
      dib += n+",";
      location.href="lendproduct_control.jsp?action=add_dib&user_id="+userid+"&mydibs="+dib+"&where=mypage&prod_num="+n;
   }
   
   //찜 취소
   function cancel_dib(n){
      del = n+",";
      dib = dib.replace(del,"");
      location.href="lendproduct_control.jsp?action=cancle_dib&user_id="+userid+"&mydibs="+dib+"&where=mypage&prod_num="+n;
   }
</script>
   <%@ include file="nav.jsp"%>
   
   <!-- Page Content -->
    <div class="container">
      <div class="row">
        <%@ include file="left_bar.jsp" %>
        
        <div class="col-lg-9 mypage">
           <br>
           <h3>①내가 올린 물품</h3>
           <div class="row">
           <%
            for(LendProduct  sp : selldatas) {
         %>
              <div class="col-lg-4 col-md-6 mb-4">
                 <div class="card h-100">
                   <a href="detail.jsp?prod_num=<%= sp.getProd_num() %>"><img class="card-img-top" src="img/<%= sp.getImg() %>" style="width:250px; height:250px"></a>
                   <div class="card-body">
                     <h4 class="card-title">
                       <a href="detail.jsp?prod_num=<%= sp.getProd_num() %>"><%= sp.getProd_name() %></a>
                       <span class="fa fa-eye" style="margin-right:10px; font-size:13px">
            				 <%= sp.getView() %></span>
                     </h4>
                     <p>판매자 ID: <b><%= sp.getId() %></b></p>
                     <p style="font-size:12px; color:gray">#<%= sp.getCategory() %></p>
                     <h5>￦<%= sp.getPrice() %>/day</h5>
                     <h6><%= sp.getFrom_d() %>~<%= sp.getTo_d() %></h6>
                     <p class="card-text"><%= sp.getDescription() %></p>
                   </div>
                   <div class="card-footer">
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                     <% if(mydibs.contains(Integer.toString(sp.getProd_num()))) {%>
                        <button class="dib2" onclick="cancel_dib(<%= sp.getProd_num() %>);" style="float:right;"></button>
                       <% } else{ %>
                        <button class="dib1" onclick="add_dib(<%= sp.getProd_num() %>);" style="float:right;"></button>
                       <% } %>
                   </div>
                 </div>
               </div>
           <% } %>
          </div>
          
          <h3 id="myLend">②내가 대여한 물품</h3>
           <div class="row">
         <%
            for(LendProduct2  lp : lenddatas) {
               LendProduct sd = ld.getDB(lp.getProd_num());
         %>
              <div class="col-lg-4 col-md-6 mb-4">
                 <div class="card h-100">
                   <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><img class="card-img-top" src="img/<%= sd.getImg() %>" style="width:250px; height:250px"></a>
                   <div class="card-body">
                     <h4 class="card-title">
                       <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><%= sd.getProd_name() %></a>
                       <span class="fa fa-eye" style="margin-right:10px; font-size:13px">
            				 <%= sd.getView() %></span>
                     </h4>
                     <p>판매자 ID: <b><%= sd.getId() %></b></p>
                     <h6>대여기간:<br><%= lp.getFrom_d() %>~<%= lp.getTo_d() %></h6>
                     <h6>총 대여료: <%= lp.getPrice1() %>￦</h6>
                     <h6>보증금: <%= lp.getPrice2() %>￦</h6>
                   </div>
                   <div class="card-footer">
                     <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                     <% if(mydibs.contains(Integer.toString(lp.getProd_num()))) {%>
                        <button class="dib2" onclick="cancel_dib(<%= lp.getProd_num() %>);" style="float:right;"></button>
                       <% } else{ %>
                        <button class="dib1" onclick="add_dib(<%= lp.getProd_num() %>);" style="float:right;"></button>
                       <% } %>
                   </div>
                 </div>
               </div>
           <% } %>
           </div>
         
           <h3 id="mydib">③내가 찜한 물품</h3>
           <div class="row">
            <%
               for(LendProduct  lp : datas) {
                  if(mydibs.contains(Integer.toString(lp.getProd_num()))){
            %>
               <div class="col-lg-4 col-md-6 mb-4">
                 <div class="card h-100">
                   <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><img class="card-img-top" src="img/<%= lp.getImg() %>" style="width:250px; height:250px"></a>
                   <div class="card-body">
                     <h4 class="card-title">
                       <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><%= lp.getProd_name() %></a>
                       <span class="fa fa-eye" style="margin-right:10px; font-size:13px"><%= lp.getView() %></span>
                     </h4>
                     <p>판매자 ID: <b><%= lp.getId() %></b></p>
                     <p style="font-size:12px; color:gray">#<%= lp.getCategory() %></p>
                     <h5>￦<%= lp.getPrice() %>/day</h5>
                     <h6><%= lp.getFrom_d() %>~<%= lp.getTo_d() %></h6>
                     <p class="card-text"><%= lp.getDescription() %></p>
                   </div>
                   <div class="card-footer">
                     <big class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</big>
                     <% if(mydibs.contains(Integer.toString(lp.getProd_num()))) { %>
                           <button class="dib2" onclick="cancel_dib(<%= lp.getProd_num() %>)" style="float:right;"></button>
                     <% } else { %>
                     <button class="dib1" onclick="add_dib(<%= lp.getProd_num() %>);" style="float:right;"></button>
                     <% } %>
                     
                     
                   </div>
                 </div>
               </div>
               <%
                  }
               }
               %>
          </div>
           
       </div>
   </div>
</body>
</html>