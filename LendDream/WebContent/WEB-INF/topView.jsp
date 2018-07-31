<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*, java.util.*" %>
    <jsp:useBean id="ld" class="lenddream.LendBean"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String userid = (String)session.getAttribute("userID");
   ArrayList<LendProduct> topVeiwDatas = ld.topView(); 
%>

<%
            for(LendProduct  sp : topVeiwDatas) {
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
                   </div>
                 </div>
               </div>
           <% } %>
          </div>
</body>
</html>