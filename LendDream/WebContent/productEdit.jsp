<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "lenddream.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="ld" class="lenddream.LendBean"/>
<jsp:useBean id="lendproduct" class="lenddream.LendProduct"></jsp:useBean>
<%
    //detail.jsp에서 넘어온 prod_num
    int prod_num = Integer.parseInt(request.getParameter("prod_num"));
  
    //prod_num에 해당하는 게시물 정보 가져오기
    LendProduct product = ld.getDB(prod_num);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="css/zeun.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(document).ready(function(){
    	  //시작날짜 물품 올리는 날짜로 고정
    	  var date = new Date();
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
    	  
    	  document.form1.from_d.value=today;
    	  
    	  var dates = $( "#to" ).datepicker({
    		  minDate: today,
    		  prevText: '이전 달',
    		  nextText: '다음 달',
    		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    		  dayNames: ['일','월','화','수','목','금','토'],
    		  dayNamesShort: ['일','월','화','수','목','금','토'],
    		  dayNamesMin: ['일','월','화','수','목','금','토'],
    		  dateFormat: 'yy-mm-dd',
    		  showMonthAfterYear: true,
    		  yearSuffix: '년'
    		  });
    		});
</script>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	.hn{font-family: 'Hanna', sans-serif;}
	span,input{font-family: 'Jeju Gothic', sans-serif;}
</style>
 <style>
  body {
    margin: 20px;
    font-family: "맑은 고딕";
}
  #image_preview {
   	display:none;
}
  </style>
<title>빌려Dream</title>
<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<%@ include file="nav.jsp" %>
    <!-- Page Content -->
    	<div class="container">
      	<div class="row">
        		<%@ include file="left_bar.jsp" %>
        		<div>
        			<br>
        			<h3 class="hn">게시물 수정</h3>
        			<form name=form1 method=post action=lendproduct_control.jsp>
        				<input type="hidden" name="action" value="update">
        					<input type="hidden" name="prod_num" value="<%= prod_num %>">
        					<span style="color:grey;font-size:13pt">판매자ID</span><br>
        					<input type=text name=id value=<%= product.getId() %> readonly><br>
        				
        					<span style="color:grey;font-size:13pt">물품명</span><br>
        					<input type=text name=prod_name value=<%= product.getProd_name() %>><br>
        						
        					<span style="color:grey;font-size:13pt">가격</span><br>
        					<input type=text id=input name=price  style="text-align :right" value=<%= product.getPrice() %> />/day<br>
        						
        					<span style="color:grey;font-size:13pt">이미지</span><br>
        					<input type="file" name="img" id="image" />
							<div id="image_preview">
								<img src="#" width="200px"/><br>
							    <a href="#">Remove</a>
							</div><br>
							
        					<span style="color:grey;font-size:13pt">카테고리</span><br>
        					<span style="color:black;font-size:12pt">
        						<select id="category" name="category">
        							<option value="가전제품">가전제품<br> 
        							<option value="전자제품">전자제품<br>
        							<option value="인테리어">인테리어<br>
        							<option value="운동기구">운동기구<br>
        							<option value="악기">악기<br>
        							<option value="책">책<br>
        							<option value="옷">옷<br>
        						</select>
        					</span><br>
        						
        					<span style="color:grey;font-size:13pt">기간</span><br>
        					<input type="text" value=<%= product.getFrom_d() %> id="from" name="from_d" readonly> ~ <input type=text id="to" name="to_d" value=<%=product.getTo_d() %>><br>
        						
        					<span style="color:grey;font-size:13pt">설명</span><br>
        					<input type=text name=description style="width:500px; height:200px; letter-spacing:5px" value=<%= product.getDescription() %> /><br><br>
        						
        					<input type=submit value="수정하기">
        					<input type=button value="취소하기" onclick="javascipt:btn()">

        			</form>
        		</div>
        	</div>
    	</div>   					
    	<script>
	function btn(){
		alert('정말취소하시겠습니까?');
		document.location.href="index.jsp";
	}
	 $(function() {
		  var $input = $("#input");
		  $input.on('keyup', function() {
		    // 입력 값 알아내기
		    var _this = this;
		    numberFormat(_this)
		  })

		});
	  
	function comma(str) {
		  str = String(str);
		  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

	// 콤마 풀기
	function uncomma(str) {
		  str = String(str);
		  return str.replace(/[^\d]+/g, '');
		}

	function numberFormat(obj) {
		  obj.value = comma(uncomma(obj.value));
		}
	
	</script>
	<script type="text/javascript">


    /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */

    $('#image').on('change', function() {
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
    </script>	
</body>
</html>