<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*,user.*, java.util.*" %>
<jsp:useBean id="ld" class="lenddream.LendBean"/>
<jsp:useBean id="ud" class="user.UserDAO"/>
<%
    //index.jsp에서 넘어온 prod_num
    int prod_num = Integer.parseInt(request.getParameter("prod_num"));
  
    //prod_num에 해당하는 게시물 정보 가져오기
    LendProduct product = ld.getDB(prod_num);
    
    //user에 해당하는 정보 가져오기
    String user = session.getAttribute("userID").toString();
    User my_inform = ud.user_inform(user);
    
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
%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-item.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/jsCalendar.css">
<link href="css/seah.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript" src="js/jsCalendar.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var from_d = '<%= product.getFrom_d() %>';
var to_d = '<%= product.getTo_d() %>';
date = new Date();
today_year = date.getFullYear().toString();
today_month = date.getMonth()+1;
today_month = today_month.toString();
today_date = date.getDate().toString();

//한자리면 두자리수로 맞추기
if(today_month.length == 1){
     today_month = "0"+today_month;
}
if(today_date.length == 1){
     today_date = "0"+today_date;
}
today = today_year+"-"+today_month+"-"+today_date;

      $(document).ready(function(){
         var dates = $( "#from, #to" ).datepicker({
            minDate: today,
            maxDate: to_d,
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNames: ['일','월','화','수','목','금','토'],
            dayNamesShort: ['일','월','화','수','목','금','토'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear: true,
            yearSuffix: '년',
            beforeShowDay: disableAllTheseDays
          });
       });
      
   // 특정날짜들 배열
   var disabledDays = new Array;
    for(d=0; d<<%= alldates.size()/2 %>; d++){
       if(allfrom_m[d] == allto_m[d]){
          for(b=allfrom_d[d]; b<=allto_d[d]; b++){
             add = "2018-"+allfrom_m[d]+"-"+b;
             disabledDays.push(add);
          }
       }
       else{
          end = endDate(allfrom_m[d]);
          for(b=allfrom_d[d]; b<=end; b++){
             add = "2018-"+allfrom_m[d]+"-"+b;
             disabledDays.push(add);
          }
          for(b=1; b<=allto_d[d]; b++){
             add = "2018-"+allto_m[d]+"-"+b;
             disabledDays.push(add);
          }
       }
    }   
    
   // 특정일 선택막기
   function disableAllTheseDays(date) {
      var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
      for (i = 0; i < disabledDays.length; i++) {
       if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
          return [false];
       }
    }
    return [true];
   }
    
    

function comma(str) {
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
// 콤마 풀기      
function uncomma(str) {
    str = String(str);
   return str.replace(/[^\d]+/g, '');
}

//대여료 계산
function calculate(){
   var user_pick1 = document.getElementById("from").value;
   var user_pick2 = document.getElementById("to").value;
   var day = 0;
   var price1 = 0;
   var price2 = 0;
   var sum = 0;
   var day_price = '<%= product.getPrice() %>';
   n_day_price = Number(uncomma(day_price));
   
   if(user_pick1 == "" || user_pick2 == ""){
      alert("날짜를 선택해주세요");
      return false;
   }
   
   user_pick1 = user_pick1.split('-');
   mon1 = Number(user_pick1[1]);
   date1 = Number(user_pick1[2]);
   
   user_pick2 = user_pick2.split('-');
   mon2 = Number(user_pick2[1]);
   date2 = Number(user_pick2[2]);
   
   if((mon1 > mon2) || (mon1 == mon2 && date1>date2)){
      alert("대여 시작날짜가 종료날짜보다 빠릅니다. 다시 선택해주세요");
      return false;
   }
   
   if(mon1 == mon2){
      day = date2-date1;
   }
   else{
      day = endDate(mon1)-date1+date2;
   }
   
   price1 = day*n_day_price;
   price2 = price1/4;
   sum = price1+price2;
   
   document.getElementById("p1").innerHTML = "대여료= "+day_price+"X"+day+"일="+comma(price1)+"원";
   document.getElementById("p2").innerHTML = "보증금= "+comma(price1)+"/4= "+comma(price2)+"원";
   document.getElementById("s").innerHTML = "총 대여료= "+comma(price1)+"+"+comma(price2)+"="+comma(sum)+"원";
   
   document.getElementsByName('price1')[0].value = comma(price1);
   document.getElementsByName('price2')[0].value = comma(price2);
}

function endDate(m){
   if(m == 1||3||5||7||9||11){
      return 31;
   }
   else if(m == 2){
      return 28;
   }
   else{
      return 30;
   }
}
</script>
</head>
<body>
   <%@ include file="nav.jsp" %>
    <div class="container">
    <div class="row">
    <%@ include file="left_bar.jsp" %>

   <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
      <br>
       <div class="panel panel-info">
           <div class="panel-heading">
               <div class="panel-title">1. 대여 신청서</div>
            </div>
                        
       <div class="panel-body" >                    
         <form method="post" action="lendproduct_control.jsp" class="form-horizontal" role="form">
         <input type="hidden" name="action" value="lend">
         <input type="hidden" name="id" value="<%= user %>">
         <input type="hidden" name="prod_num" value="<%= prod_num %>">
               <br>
                 <div class="form-group">
                   <label class="col-md-5">물품: <%= product.getProd_name() %></label>
                 </div>
              
                 <div class="form-group">
                   <label class="col-md-5">판매자ID: <%= product.getId() %></label>
                 </div>
              
                 <div class="form-group">
                    <div class="auto-jsCalendar classic-theme col-md-9"><p>※대여 가능 기간 : <%= product.getFrom_d() %>~<%= product.getTo_d() %></p></div>
                   <label class="col-md-3">대여날짜 선택:</label><br>
                   <div class="col-md-9">
                      <input type="text" id="from" name="from_d"> ~ <input type=text id="to" name="to_d">
                   </div>
                 </div>
              
                 <div class="form-group">
                   <label style="padding-left:15px;">총 대여료:&nbsp&nbsp </label><button class="calculate" onclick="calculate();return false;">계산하기</button>
                    <p class="col-md-12" id="p1"></p>
                    <p class="col-md-12" id="p2"></p>
                    <p class="col-md-12" id="s"></p>
                    <input type="hidden" name="price1">
                    <input type="hidden" name="price2">
                 </div>
              
                 <div class="form-group flex">
                   <label style="padding-left:15px;">거래방식:</label>
                    <label class="delivery">택배
                 <input type="radio" checked="checked" name="delivery" value="택배">
                 <span class="checkmark"></span>
               </label>
               <label class="delivery">직거래
                 <input type="radio" name="delivery" value="직거래">
                 <span class="checkmark"></span>
               </label>
                
                 </div>
               
                 <div class="form-group">
                   <label for="phone" class="col-md-3 control-label">전화번호</label>
                   <div class="col-md-9">
                       <input type="text" class="form-control" value="<%= my_inform.getUserPhone() %>">
                     </div>
                 </div>
              
                <div class="form-group">
                   <label for="address" class="col-md-3 control-label">주소</label>
                     <div class="col-md-9">
                       <input type="text" class="form-control"value="<%= my_inform.getUserAddress() %>">
                     </div>
                 </div>
                 
                 <div class="form-group">                                 
                   <div class="col-md-offset-3 col-md-9 flex">
                       <button id="btn-signup" type="button" class="btn btn-info" onclick="window.history.go(-1);"><i class="icon-hand-right"></i>이전</button>
                       <span style="margin-left:8px;"></span>  
                     </div>
                 </div>

                <div class="col-md-offset-3 col-md-9">
                   <input id="btn-fbsignup" type="submit" class="btn btn-primary" value="입력 완료"><i class="icon-facebook"></i></input>
                  </div>                                           
        
          </form>

   </div>
        
    </div>
    </div>
   </div>
</body>
</html>