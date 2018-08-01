<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.*" %> 
<%
	BoardBean article=(BoardBean)request.getAttribute("article");
	String nowPage=(String)request.getAttribute("page");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC게시판</title>

<style type="text/css">
	h3{
		text-align:center;
	}
	
	table{
		margin:auto;
		width:450px;
	}
	
	.td_left{
		width:150px;
		background:orange;
	}
	
	.td_right{
		width:300px;
		background:skyblue;
	}
	
	#commandCell{
		text-align:center;
	}
</style>

</head>
<body>

<div id="writeForm">
	<h3>게시판 글 수정</h3>
	<form action="boardModifyPro.bo?page=<%=nowPage %>" method="post" name="modifyform">
	<table>
		<tr>
			<td>
				<input type="text" name="board_num" value="<%=article.getBoard_num()%>"/>	
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td class="td_left">
				<label for="board_name">글쓴이</label>
			</td>
			
			<td class="td_right">
				<input type="text" name="board_name" id="board_name" value="<%=article.getBoard_name()%>"/>
			</td>
		</tr>
		
		<tr>
			<td class="td_left">
				<label for="board_pass">비밀번호</label>
			</td>
			
			<td class="td_right">
				<input type="password" name="board_pass" id="board_pass"/>
			</td>
		</tr>
		
		<tr>
			<td class="td_left">
				<label for="board_subject">제목</label>
			</td>
			
			<td class="td_right">
				<input type="text" name="board_subject" id="board_subject" value="<%=article.getBoard_subject()%>"/>
			</td>
		</tr>
		
		<tr>
			<td class="td_left">
				<label for="board_content">내용</label>
			</td>
			
			<td>
				<textarea rows="15" cols="40" id="board_content" name="board_content">
					<%=article.getBoard_content() %>
				</textarea>
			</td>
		</tr>
	</table>
	
	<div id="commandCell">
		<a href="javascript:modifyform.submit()">[수정]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
	</div>
	
	</form>
</div>

</body>
</html>













