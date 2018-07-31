<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="sns.*, user.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="reply" class="sns.reply"/> 
<jsp:useBean id="rp" class="sns.replyBean"/>
<jsp:useBean id="user" class="user.User"/>
<jsp:setProperty name="user" property="*" />
<jsp:setProperty name="reply" property="*"/> 

<%

	String action = request.getParameter("action");

	//댓글입력일경우 
	if(action.equals("reply_insert")) {		
		if(rp.reply_db(reply)) {
			response.sendRedirect("detail.jsp?prod_num="+reply.getProd_num());
}
		else
			throw new Exception("DB 입력오류");	
}


%>