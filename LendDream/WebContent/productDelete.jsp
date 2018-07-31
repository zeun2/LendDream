<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lenddream.*,user.*, java.util.*"%>
<jsp:useBean id="ld" class="lenddream.LendBean"/>

<%
    //detail.jsp에서 넘어온 prod_num
    int prod_num = Integer.parseInt(request.getParameter("prod_num"));
    if(ld.deleteDB(prod_num)){
%>
        <script>
        		alert('게시글이 삭제되었습니다.');
        		location.href="index.jsp";
        	</script>
<%
    }
%>