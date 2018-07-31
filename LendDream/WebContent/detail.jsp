<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*, java.util.*, java.text.SimpleDateFormat,sns.*" %>
<jsp:useBean id="ld" class="lenddream.LendBean"/> 
<jsp:useBean id="rp" class="sns.replyBean" />
<%
    //넘어온 prod_num
    int prod_num = Integer.parseInt(request.getParameter("prod_num"));
  
    //prod_num에 해당하는 게시물 정보 가져오기
    LendProduct product = ld.getDB(prod_num);
    
    String userid = (String)session.getAttribute("userID");
    
    //대여자 정보 가져오기
    LendProduct2 mylend = ld.getMylend(userid, prod_num);
    
    //대여자 신청 ID 전부 가져오기
    ArrayList<String> alllenders = ld.allLenders(prod_num);
    
    //대여신청한 날짜 전부 가져오기
    ArrayList<String> alldates = ld.allDates(prod_num);
    int[] allfrom_m = new int[alldates.size()/2];
    int[] allfrom_d = new int[alldates.size()/2];
    int[] allto_m = new int[alldates.size()/2];
    int[] allto_d = new int[alldates.size()/2];
   int n=0;
    
   for(int i=0; i<alldates.size(); i=i+2){
      allfrom_m[n] = Integer.parseInt(alldates.get(i).split("-")[1]);
      allfrom_d[n] = Integer.parseInt(alldates.get(i).split("-")[2]);
      allto_m[n] = Integer.parseInt(alldates.get(i+1).split("-")[1]);
      allto_d[n] = Integer.parseInt(alldates.get(i+1).split("-")[2]);
      n++;
   }
    
   //찜리스트 가져오기
   String mydibs = ld.get_dibs(userid);
   
   //현재시간 가져오기 
    Date now = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm a");
    
    String today = sf.format(now);
    
    // prod_num에 해당하는 댓글 가져오기 
    ArrayList<reply> prod_reply = rp.getReply(prod_num);
%>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	.hn{font-family: 'Hanna', sans-serif;}
	span,input,h3{font-family: 'Jeju Gothic', sans-serif;}
	
  body {
    margin: 20px;
    font-family: 'Jeju Gothic', sans-serif;
}
  #image_preview {
   	display:none;
}
  </style>
<script>
   //판매자가 올린 대여기간 날짜 받아오기
   var from_d = '<%= product.getFrom_d() %>';
   var from_d = from_d.split('-');
   var to_d = '<%= product.getTo_d() %>';
   var to_d = to_d.split('-');
   
   //숫자로 변환
   var from_d_year = Number(from_d[0]);
   var from_d_month = Number(from_d[1]);
   var from_d_date = Number(from_d[2]);
   var to_d_year = Number(to_d[0]);
   var to_d_month = Number(to_d[1]);
   var to_d_date = Number(to_d[2]);
   
   //대여신청한 날짜들 담기
     var allfrom_m = new Array;
     var allfrom_d = new Array;
     var allto_m = new Array;
     var allto_d = new Array;
     
   <% for(int i=0; i<alldates.size()/2; i++){ %>
      allfrom_m.push(<%= allfrom_m[i] %>);
      allfrom_d.push(<%= allfrom_d[i] %>);
      allto_m.push(<%= allto_m[i] %>);
      allto_d.push(<%= allto_d[i] %>);
   <% } %>


     
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Shop Item - Start Bootstrap Template</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/shop-item.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="css/jsCalendar.css">
   <link rel="stylesheet" href="css/seah.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script type="text/javascript" src="js/jsCalendar.js"></script>
   <script>
      function goto_lend(){
         document.location.href = 'lendProduct.jsp?prod_num=<%= prod_num %>';
      }
      function goto_delete(){
         document.location.href = 'productDelete.jsp?prod_num=<%= prod_num %>';
      }
      function goto_edit(){
         document.location.href = 'productEdit.jsp?prod_num=<%= prod_num %>';
      }

      var userid = '<%= userid %>';
      var dib = '<%= mydibs %>';
   
      //찜 추가
      function add_dib(n){
         dib += n+",";
         location.href="lendproduct_control.jsp?action=add_dib&user_id="+userid+"&mydibs="+dib+"&where=detail&prod_num="+n;
      }
      
      //찜 취소
      function cancel_dib(n){
         del = n+",";
         dib = dib.replace(del,"");
         location.href="lendproduct_control.jsp?action=cancle_dib&user_id="+userid+"&mydibs="+dib+"&where=detail&prod_num="+n;
      }
   </script>
   <style>
   .product > label,p,h3,h4,h6{
      display: inline-block;
   }
   </style>
  </head>

  <body>
    <%@ include file="nav.jsp" %>
    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <%@ include file="left_bar.jsp" %>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div class="card mt-4 p-3">
          <div style="display:flex; flex-wrap:wrap;">
             <img class="card-img-top img-fluid" src="img/<%= product.getImg() %>" style="width:400px; height:400px">
             
         <div class="auto-jsCalendar classic-theme" style="text-align: center;"><p>
         <span style="color:grey;font-size:13pt">※대여 가능 기간 : <%= product.getFrom_d() %>~<%= product.getTo_d() %></span></p></div>
          </div>
            
            <div class="card-body product">
            <% if(userid != null && userid.equals(mylend.getId())){ %>
               <div class="mylend card p-3 col-lg-6" style="border-color: #6AAFE6">
                  <span style="color:grey;font-size:13pt">나의 대여정보</span><br>
                  <span style="color:grey;font-size:13pt">대여기간: <%= mylend.getFrom_d() %> ~ <%= mylend.getTo_d() %></span><br>
                  <span style="color:grey;font-size:13pt">총 대여료: <%= mylend.getPrice1() %>￦<span><br>
                   <span style="color:grey;font-size:13pt">보증금: <%= mylend.getPrice2() %>￦<span><br>
                   <span style="color:grey;font-size:13pt">대여방식: <%= mylend.getDelivery() %><span>
               </div>
            <% } else if(userid != null && userid.equals(product.getId())){ %>
               <div class="mylend card p-3 col-lg-6" style="border-color: #6AAFE6">
                  <span style="color:grey;font-size:13pt">대여 신청자 목록</span><br>
                  <% for(int u=0; u<alllenders.size(); u++){ %>
                  <span style="color:grey;font-size:13pt">아이디: <%= alllenders.get(u) %><br> 대여기간: <%= alldates.get(2*u) %> ~ <%= alldates.get(2*u+1) %><span><br>
                  <% } %>
               </div>
            <% } %>
              <span style="color:grey;font-size:13pt"><label class="mt-3">상품명:</label></span>
              <span style="color:dark;font-size:13pt" class="card-title"><%= product.getProd_name() %></span>
              <label>
              <span class="fa fa-eye" style="margin-left:15px;"></span>
              	<%= product.getView() %></label>
              <br>
              <span style="color:dark;font-size:13pt" style="font-size:12px; color:gray;">#<%= product.getCategory() %></span><br>
              <span style="color:grey;font-size:13pt"><label>판매자ID:</label></span>
              <span style="color:dark;font-size:13pt" class="card-title"><%= product.getId() %></span><br>
              <span style="color:grey;font-size:13pt"><label>하루당 대여가격:</label></span>
              <span style="color:dark;font-size:13pt"><%= product.getPrice() %>￦/day</span><br>
              <span style="color:grey;font-size:13pt"><label>설명:</label></span>
              <span style="color:dark;font-size:13pt" class="card-text"><%= product.getDescription() %></p><br>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
              <% if(mydibs.contains(Integer.toString(product.getProd_num()))) {%>
                     <button class="dib2" onclick="cancel_dib(<%= product.getProd_num() %>)"></button>
              <% } else{ %>
               <button class="dib1" onclick="add_dib(<%= product.getProd_num() %>);"></button>
              <% } %>
              <br><br>
              <% if(userid == null || !userid.equals(product.getId())){ %>
              <button onclick="goto_lend();" class="lend"><span>대여하기</span></button>
              <% } %>
              <%
                 if(userid != null && userid.equals(product.getId())){
              %>
              <button onclick="goto_edit();" class="lend"><span>수정하기</span></button>
              <button onclick="goto_delete()"class="lend"><span>삭제하기</span></button>
              <%
                 }
              %>
            </div>
          </div>
          <!-- /.card -->

          <form name=form1 method=post action=sns_control.jsp>
             <input type="hidden" name="action" value="reply_insert">
           <input type="hidden" name="prod_num" value="<%= prod_num %>">
           <input type="hidden" name="userID" value="<%= session.getAttribute("userID") %>">
           
         <div class="card card-outline-secondary my-4">
            <div class="card-header">
               <%= session.getAttribute("userID") %><br><br>
               <textarea name=message placeholder="댓글을 입력해주세요." style="width:500px; height:50px; letter-spacing:5px"></textarea><br><br>
               <input type="submit" value="댓글달기">
            </div>
        </form>        
      </div>
      <div class="card-body">
         <%
                 for(reply  sp : prod_reply) {
           %>
         <p><%= sp.getMessage() %> </p>
         <small class="text-muted">Posted by '<%= sp.getUserID() %>' on <%= sp.getDate() %></small>
         <hr>   
          <% } %>              
      </div>                  
     
            
     </div>
  
   </div>
   
        

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
   <script src="jquery/jquery.min.js"></script>
   <script src="js/bootstrap.bundle.min.js"></script>

  </body>

</html>