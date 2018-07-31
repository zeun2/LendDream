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
             width: max-content;
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

<script type="text/javascript">
    function CheckForm(Join){
        
        //체크박스 체크여부 확인 [하나]
        var chk1=document.registration.U_checkAgreement1.checked;
        var chk2=document.registration.U_checkAgreement2.checked;
        
        if(!chk1){
            alert('개인정보 활용에 동의해 주세요');          
            return false;
        } 
        if(!chk2) {
            alert('이용수칙에 동의해 주세요');
            return false;
        }
     
       location.href="join2.jsp";
        }

    

</script>

</head>
<body>
      <%@ include file="nav.jsp" %>
     
            <div class="container">
            <div class="row">
            <br>
       <%@ include file="left_bar.jsp" %>
       
<div id="container" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
   <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">1.개인정보,이용수칙 동의</div>

                        </div>
                        
    <div class="panel-body" >                    
                        
     
    
   <form name="registration" >
   
   <p><h2>개인정보 활용동의</h2></p>
  <p>
    <textarea id="rules" readonly>개인정보수집 및 이용동의 약관
    
“빌려DREAM 서비스(이하, ‘대여 서비스’라 합니다.)”의 서비스 제공과 관련하여 “빌려DREAM 회사(이하, ‘대여서비스 회사’라 합니다.)”가 본인으로부터 취득한 개인정보는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정에 따라 제3자에 제공하거나 영업목적으로 이용 시 동의를 받아야 하는 정보입니다. 이에 본인은, 귀사가 본인으로부터 취득한 개인정보를 아래와 같은 목적으로 이용하거나 제휴업체에게 제공하는데 동의합니다. 회사는 본 서비스를 가입자에게 제공하기 위해 다음과 같이 개인정보를 수집/이용합니다.

1. 개인정보수집 및 이용
① 수집항목
- 이름, 이메일 주소, 휴대폰 번호, 주소
② 이용목적
- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 본인확인, 점유인증, 요금 결제
- 회원관리 : 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
- 마케팅 및 광고에 활용 : 신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보를 push메시지 등을 통해 전달
2. 개인정보 취급 위탁
회사는 이용자의 동의 없이 이용자의 개인정보 취급을 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 이용자에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

3. 개인정보 보유 및 이용기간
본 서비스 가입 일로부터 해지 후 정산 완료 시까지 단, 상법, 국세기본법 등에서 소비자보호에 관한 법률 등 관계 법령에 따라 보존할 필요가 있는 경우 회사는 관계법령에서 정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 다음과 같습니다.

- 거래에 관한 장부 및 증빙서류 : 5년(국세기본법, 법인세법, 부가가치세법 등)
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년(전자상거래등에서의 소비자보호에 관한 법률)
- 표시/광고에 관한 기록 : 6개월(전자상거래에서의 소비자보호에 관한 법률)
- 계약 또는 청약철회 등에 관한 기록 : 5년(전자상거래에서의 소비자보호에 관한 법률)
- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년(전자상거래에서의 소비자보호에 관한 법률) 
(그 외, 법령에 정해진 개인정보 보유기간이 있을 경우 그에 따름)
4. 개인정보 수집 및 이용 동의 철회
서비스 해지시 개인정보 수집 이용동의가 철회됩니다.

5. 수집한 개인정보의 파기 절차
회사는 서비스 가입자가 가입시 제공한 개인정보의 이용 목적이 달성된 후에는 보관 기간 및 이용기간에 따라 해당 정보를 파기하되 , 그 파기 절차 및 방법 등은 다음과 같습니다.

- 파기절차 : 가입자가 서비스 가입 등을 위해 회사에 제공한 개인정보는 서비스 해지 등 이용목적이 달성된 후 내부 방침 및 기타 관련 법령에 이한 정보보호 방침에 의한 정보보호 사유가 따른 보유기간이 경과한 후에 삭제하거나 파기합니다. 회사가 가입자의 서비스 가입 당시 수집하여 전자적 파일 형태로 관리하는 개인정보는 서비스 자발적 해지 시점에 삭제됩니다.
- 파기기한 : 가입자의 개인정보 보유기간이 경과된 경우에 삭제합니다. 단, 고객 응대 및 불법적 사용자에 대한 관련 수사기관 협조, 상법 등 관련 법령의 규정에 의하여 거래 관련 권리 의무 관계의 확인 등을 이유로 보유하여야 할 필요가 있을 경우에는 일정 기간 동안 가입자의 데이터를 보유합니다. 또한 고객에게 미리 고지하고 개별 동의를 받은 경우에는 동의한 내용에 따른 기간 동안 보유합니다.
- 파기 방법 : 개인정보의 파기는, 가입신청서 등 서면 양식에 기재하거나, 종이에 출력된 개인정보는 분쇄기로 분쇄 또는 소각하거나 화학약품 처리를 하여 용해하여 파기하고, 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
6. 개인정보관리 책임자 및 담당 연락처
- 이름/소속/직위 : 빌려드림/응컴/학생
- 전화/메일 : 1588-1234/lenddream@gmail.com </textarea>
  </p>
  

  <p>
    <input type="checkbox" id="U_checkAgreement1" name="U_checkAgreement1" />
    <label for="agree">동의 함</label>
   
  </p>
  
  
  <p><h2>이용수칙 동의</h2></p>
  <p>
    <textarea id="rules" readonly>
    제 1 조 (목적)
이 계약은 주식회사 티브로드(이하 “회사”라 합니다)와 구매자 (이하 “고객”이라 합니다) 사이에 체결 된 티브로드
스마트렌탈서비스 상품(이하 “상품”이라고 합니다) 이용에 대한 계약(이하 “본 계약”이라고 합니다) 사항을
규정함을 목적으로 합니다. 

  제 2 조 (계약의 성립)
① “회사”는 “고객”이 “회사”의 “상품”를 이용할 수 있도록 “상품”을 할부 판매 합니다. “고객”은 할부기간 중 “본
계약”을 타인에게 양도할 수 없습니다. ② “고객”은 당사 내부 가입기준에 의해 가입이 제한 될 수 있습니다. ③ “고객”에게 “상품”이 공급 및 설치되어 “상품”의 인수확인서에 서명날인 한 날로부터 “본 계약”의 효력이
발생합니다. 

  제 3 조 (소유권 유보)
양 당사자의 합의하에 “고객”이 할부금의 변제를 완료하기 전까지 할부 목적물의 소유권은 “회사”에 유보됩니다. “고객”은 할부금을 완납하기 전에 “회사”의 사전 서면 승낙 없이 “상품”을 타인에게 양도하거나 질권을 설정하는
등의 임의 처분을 할 수 없습니다. 

  제 4 조 (할부금 변제방법)
① “고객”은 계약 시 약정한 월 할부금을 납입하여 변제합니다. ② 할부기간 중 제 13 조에 의해 “본 계약”이 종료되는 경우, 일시불로 “상품”의 할부 대금을 완납 하여야 합니다. ③ “고객”이 납입한 금액이 납입일 현재 “고객”의 채무 전액을 충당하기에 부족한 경우, 납입액은 납기일
기준으로 먼저 도래한 채무액부터 우선 충당합니다. 

  제 5 조 (기간 및 이용조건)
① “본 계약”의 기간은 “회사”가 “고객”에게 “상품”을 공급 및 설치하여 정상적으로 사용이 가능하게 된 날부터
할부기간 개월 수까지 입니다. ② 단, “회사”와 “고객”간에 “본 계약”과 관련하여 채권채무관계(연체금, 연체이자, 잔여할부금 등)가 있을
경우에는 연체금, 연체이자, 잔여할부금 등이 완납 될 때까지 연장됩니다. 
     </textarea>
  </p>
  

  <p>
    <input type="checkbox" id="U_checkAgreement2" name="U_checkAgreement2" />
    <label for="agree">동의 함</label>
   
  </p>
  
  <center>
   <input type="button" id="nextstep" value="다음" onclick="return CheckForm(this)"/>
</center>

 
  
</form>

</div>

</div>
</div>
</div>
</div>


</body>
</html>


