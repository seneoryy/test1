<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, dao.*" %>
    
<%
	String id=request.getParameter("id");
	//out.println(id);
	MemberDAO mdao=MemberDAO.getInstance();
	boolean result=mdao.comfirmId(id);
	//out.println(result);
	
	if(result){%>
		<div>
			<h4><%=id%>&nbsp;&nbsp;는(은) 이미 사용중인 ID 입니다.</h4>
		</div>
	<% }else{%>
		<%if(id==""){%>
		<div>
			<h4>아이디를 입력해 주세요.</h4>
		</div>
		<%}else{%>
		
		<div>
			<h4><%=id%>&nbsp;&nbsp;는(은) 사용가능한 ID 입니다.</h4>
		</div>
		<%} %>
	<% }
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
</head>

<body>
	<div id="wrap" align="center">
		<a href="javascript:self.close()"><input type="button" value="확인" /></a>
	</div>
</body>

</html>