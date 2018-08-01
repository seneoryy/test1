<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>

<%
	BoardBean article=(BoardBean)request.getAttribute("article");
	String nowPage=(String)request.getAttribute("page");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<style>
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
<h3>게시판 글 등록(답변)</h3>
<form action="boardReplyPro.bo" method="post" name="boardform">
	<table>
		<tr>
			<td>
				<input type="text" name="page" value="<%=nowPage%>"/>
				<input type="text" name="board_num" value="<%=article.getBoard_num()%>"/>
				<input type="text" name="board_re_ref" value="<%=article.getBoard_re_ref() %>"/>
				<input type="text" name="board_re_lev" value="<%=article.getBoard_re_lev() %>"/>
				<input type="text" name="board_re_seq" value="<%=article.getBoard_re_seq() %>"/>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td class="td_left">
				<label for="board_name">글쓴이</label>
			</td>
			<td class="td_right">
				<input type="text" name="board_name" id="board_name"/>
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
				<input type="text" name="board_subject" id="board_subject"/>
			</td>
		</tr>
		
		<tr>
			<td class="td_left">
				<label for="board_content">내용</label>
			</td>
			<td class="td_right">
				<textarea rows="15" cols="40" id="board_content" name="board_content"></textarea>
			</td>
		</tr>
	</table>
	
	<div id="commandCell">
		<input type="submit" value="답변글 등록"/>&nbsp;&nbsp;
		<input type="reset" value="다시작성"/>
	</div>
</form>
</div>
</body>
</html>










