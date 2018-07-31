<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/shop-homepage.css" rel="stylesheet">
   
   <script src="js/bootstrap.min.js"></script>
   <script src="jquery/jquery.min.js"></script>
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
   input {
      margin : 0 1rem;
   }

   
   .col-md-9 {
      display : flex;
   }
   
   select.form-control {
       margin-left: 1rem;
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
   
<script>
function checkPW() {
   
   var p=f.userPassword1.value;
   var cp=f.userPassword2.value;
   
   if(p==cp)

      alert("비밀번호가 일치 합니다.")
   else
      alert("비밀번호가 일치하지 않습니다.")
      //document.getElementById("pw").value="";
      }

function check(){
     document.frm.action = "UserDAO.java";
     document.frm.method = "post";
     document.frm.submit();
   }


function checkValue()
{
    var form = document.userInfo;

    if(!form.userID.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(form.idDuplication.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.");
        return false;
    }
    
    if(!form.userPassword1.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(form.userPassword1.value != form.userPassword2.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }    
}
function PasswordChk(){
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(form.userPassword1.value != form.userPassword2.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }    
}


var openWin;
// 아이디 중복체크 화면open
   function openIdChk(){
    var userid = document.getElementById("pInput").value;
    window.name = "parentForm";
    openWin = window.open("IdCheckForm.jsp?userid="+userid,
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    

}
    function setChildText(){    
   openWin.document.getElementById("userId").value = document.getElementById("pInput").value;
}

// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.
function inputIdChk(){
    document.userInfo.idDuplication.value ="idUncheck";
}


</script>




</head>


<body>
   <%@ include file="nav.jsp" %>
  
         <div class="container">
         <div class="row">
         
    <%@ include file="left_bar.jsp" %>

   <div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">2.개인정보 입력</div>

                        </div>
                        
    <div class="panel-body" >                    
   <form method="post" action="joinAction.jsp" id="signupform" class="form-horizontal" role="form" name="f">
            <br>
              <div class="form-group">
                  <label for="name" class="col-md-3 control-label">이름</label>
                  <div class="col-md-9">
                      <input type="text" class="form-control" name="userName" placeholder="Name">
                  </div>
              </div>
              <div class="form-group">
                  <label for="img" class="col-md-3 control-label">프로필사진</label>
                  <div class="col-md-9">
                      <input type="file" class="form-control" name="img" id="image">
                        <div id="image_preview">
								<img src="#" width="200px"/><br>
							    <a href="#">Remove</a>
	                  </div>
	              </div>
	          </div>
              
              
              <div class="form-group">
                  <label for="nickname" class="col-md-3 control-label">닉네임</label>
                  <div class="col-md-9">
                      <input type="text" class="form-control" name="userNickname" placeholder="Nick Name">
                  </div>
              </div>
              
              
              <div class="form-group">
                  <label for="id" class="col-md-3 control-label">아이디</label>
                  <div class="col-md-9">
                      <input type="text" class="form-control" name="userID" placeholder="ID">
                        <input type="button" class="form-control" value="중복확인"> 
                  </div>
              </div>
           
      
              <div class="form-group">
                  <label for="password" class="col-md-3 control-label">비밀번호</label>
                  <div class="col-md-9">
                      <input type="password" class="form-control" name="userPassword1" placeholder="Password">
                  </div>
              </div>
              
              
              <div class="form-group">
                  <label for="passwordcheck" class="col-md-3 control-label">비밀번호확인</label>
                  <div class="col-md-9">
                      <input id="pw" type="password" class="form-control" name="userPassword2" placeholder="Password Check" value="">
                 
                  </div>
              </div>
              
             <input type="button" class="form-control" value="일치확인" onclick="return checkPW(this)">
             
       
        
              <div class="form-group">
                  <label for="email" class="col-md-3 control-label">이메일 주소</label>
                  <div class="col-md-9">
                  <td>
                      <input type="text" class="form-control" name="userMail1" placeholder="Email Address">@
                       <select class="form-control" name="userMail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                        </td>
                  </div>
              </div>
              
              
                  
              <div class="form-group">
                  <label for="phone" class="col-md-3 control-label">전화번호</label>
                  <div class="col-md-9">
                      <input type="text" class="form-control" name="userPhone" placeholder="phone number">
                  </div>
              </div>
              
              
                <div class="form-group">
                  <label for="address" class="col-md-3 control-label">주소</label>
                  <div class="col-md-9">
                      <input type="text" class="form-control" name="userAddress" placeholder="Address">
                  </div>
              </div>
              
              

              <div class="form-group">
                                                        
                  <div class="col-md-offset-3 col-md-9">
                      <a href="join1.jsp"><button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i>이전</button></a>
                      <span style="margin-left:8px;"></span>  
                  </div>
              </div>
              

                  <div class="col-md-offset-3 col-md-9">
                      <input id="btn-fbsignup" type="submit" class="btn btn-primary" value="입력 완료" ><i class="icon-facebook"></i></input>
                  </div>                                           
       
          </form>

   </div>
        
    </div>
    </div>
   </div>
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
 