<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ld" class="lenddream.LendBean"/> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>빌려Dream</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/shop-homepage.css" rel="stylesheet">
	<link rel="stylesheet" href="css/seah.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.carousel-item img{
			width: 900px;
			height: 350px;
		}
		
		.wen {
			width:200px;
		 	height:200px;q
		 	border-radius:150px; 
		 	margin:0 auto; 
		 	overflow:hidden;
		 }
		.wen img {
			height:250px; 
			width:200px;
		}
		</style>
	<style type="text/css">
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		.hn{font-family: 'Hanna', sans-serif;}
		span,input,html{font-family: 'Jeju Gothic', sans-serif;}
	</style>
 	<style>
		  body {
		    margin: 20px;
		    font-family: "맑은 고딕";
			}
	</style>

</head>
<body>

	<%
		ArrayList<LendProduct> datas = ld.getDBList();
		ArrayList<LendProduct> topViewDatas = ld.topView(); 
		ArrayList<LendProduct> topLendDatas = ld.topLend(); 
		
		String userid = (String)session.getAttribute("userID");
	      String mydibs = ld.get_dibs(userid);
	      String search_result = "";
	      
	      if(request.getParameter("s_r") != null){
	         search_result = request.getParameter("s_r");
	      }
	%>
	<script>
      var userid = '<%= userid %>';
      var dib = '<%= mydibs %>';
   
      //찜 추가
      function add_dib(n){
         dib += n+",";
         location.href="lendproduct_control.jsp?action=add_dib&user_id="+userid+"&mydibs="+dib+"&where=index&prod_num="+n;
      }
      
      //찜 취소
      function cancel_dib(n){
         del = n+",";
         dib = dib.replace(del,"");
         location.href="lendproduct_control.jsp?action=cancle_dib&user_id="+userid+"&mydibs="+dib+"&where=index&prod_num="+n;
      }
   </script>
   
	<%@ include file="nav.jsp" %>
	
    <!-- Page Content -->
    <div class="container">		        
      <div class="row">

        <%@ include file="left_bar.jsp" %>
        <!-- /.col-lg-3 -->
        <div class="col-lg-9">
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
	            <ol class="carousel-indicators">
	              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	            </ol>
	            
	            <div class="carousel-inner" role="listbox">
		              <div class="carousel-item active">
		              <span style="color:gray;font-size:20pt">조회수 top3</span><br>
		              	
					           <div class="row">
					           <%
					           for(int i=0; i<3; i++){ 
					        	
					            		LendProduct  sp = topViewDatas.get(i);
					            %>
					              <div class="col-lg-4 col-md-6 mb-4" style="height:395px;">
					                 <div class="card h-100 pt-5">
					                   <a href="detail.jsp?prod_num=<%= sp.getProd_num() %>">
					                   <div class="wen"><img class="card-img-top" src="img/<%= sp.getImg() %>" style="width:250px; height:250px"></div></a>
					                   <div class="card-body">
					                     <h4 class="card-title">
					                       <a href="detail.jsp?prod_num=<%= sp.getProd_num() %>"><%= sp.getProd_name() %></a>
					                       <span class="fa fa-eye" style="margin-right:10px; font-size:13px">
					            				 <%= sp.getView() %></span>
					            				 <h5>￦<%=sp.getPrice() %>/day</h5>
					                     </h4>
					                     
					                   </div>
					                   
					                 </div>
					               </div>
					           
					           <% 
					        	   		}
					            	%>
					            	</div>
		              </div>
		              <div class="carousel-item">
		               <span style="color:gray;font-size:20pt">대여수 top3</span><br>
				           <div class="row">
				           <%
				           for(int i=0; i<3; i++){ 
				            	LendProduct dd = topLendDatas.get(i);
				            %>
				              <div class="col-lg-4 col-md-6 mb-4" style="height:395px;">
				                 <div class="card h-100 pt-5">
				                   <a href="detail.jsp?prod_num=<%= dd.getProd_num() %>">
				                   <div class="wen"><img class="card-img-top" src="img/<%= dd.getImg() %>" style="width:250px; height:250px"></div></a>
				                   <div class="card-body">
				                     <h4 class="card-title">
				                       <a href="detail.jsp?prod_num=<%= dd.getProd_num() %>"><%= dd.getProd_name() %></a>
				                       <span class="fa fa-user" style="margin-right:10px; font-size:13px">
				            				 <%= dd.getLend_count() %></span>
				            				 <h5>￦<%= dd.getPrice() %>/day</h5>
				                     </h4>
				                     
				                   </div>
				                   
				                 </div>
				               </div>
				           <% 
				            	}
				            	%>
		           	 	</div>

		    			</div>
	             	 </div>
	            </div>
	            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	              <span class="sr-only">Previous</span>
	            </a>
	            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	              <span class="carousel-control-next-icon" aria-hidden="true"></span>
	              <span class="sr-only">Next</span>
	            </a>
          </div>
		
		  <form action="lendproduct_control.jsp" class="search">
           <input type="hidden" name="action" value="search">
            <input type="text" placeholder="Category Search.." name="search" style="margin-right:5px;">
            <button type="submit"><i class="fa fa-search"></i></button>
         </form>
         
          <div class="row">
				<%
					for(LendProduct  lp : datas) {
						if(lp.getCategory().contains(search_result)){
				%>
	            <div class="col-lg-4 col-md-6 mb-4">
	              <div class="card h-100">
	                <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><img class="card-img-top" src="img/<%= lp.getImg() %>" style="width:250px; height:250px"></a>
	                <div class="card-body">
	                  <h4 class="card-title">
	                    <a href="detail.jsp?prod_num=<%= lp.getProd_num() %>"><%= lp.getProd_name() %></a>
	                     <span class="fa fa-eye" style="margin-right:10px; font-size:13px">
	            				 <%= lp.getView() %></span>
	                  </h4>
	                  <p>판매자 ID: <b><%= lp.getId() %></b></p>
	                  <p style="font-size:12px; color:gray">#<%= lp.getCategory() %></p>
	                  <h5>￦<%= lp.getPrice() %>/day</h5>
	                  <h6><%= lp.getFrom_d() %>~<%= lp.getTo_d() %></h6>
	                  <p class="card-text"><%= lp.getDescription() %></p>
	                </div>
	                <div class="card-footer">
			                <big class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</big>
		                  <% if(mydibs.contains(Integer.toString(lp.getProd_num()))) {%>
		                     <button class="dib2" onclick="cancel_dib(<%= lp.getProd_num() %>);" style="float:right;"></button>
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
         
          <!-- /.row -->
 
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
	</div>
</body>	
</html>