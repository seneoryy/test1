<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC 게시판</title>
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
	<h3>게시판글등록</h3>
	<form action="boardWritePro.bo" method="post" enctype="multipart/form-data" name="boardform">
		<table>
			<tr>
				<td class="td_left"><lable for="board_name">글쓴이</lable></td>
				<td class="td_right"><input type="text" name="board_name" id="board_name" value="<%=id%>"required="required"/></td>
			</tr>
			
			<tr>
				<td class="td_left"><lable for="board_pass">비밀번호</lable></td>
				<td class="td_right"><input type="password" name="board_pass" id="board_pass" required="required"/></td>
			</tr>
			
			<tr>
				<td class="td_left"><lable for="board_subject">제목</lable></td>
				<td class="td_right"><input type="text" type="text" name="board_subject" id="board_subject" required="required"/></td>
			</tr>
			
			<tr>
				<td class="td_left"><lable for="board_content">내용</lable></td>
				<td class="td_right"><textarea rows="15" cols="40" name="board_content" id="board_content" required="required"></textarea></td>
			</tr>
			
			<tr>
				<td class="td_left"><lable for="board_file">파일첨부</lable></td>
				<td class="td_right"><input type="file" name="board_file" id="board_file" required="required"/></td>
			</tr>
		</table>
		<div id="commandCell">
			<input type="submit" value="등록"/>
			<input type="reset" value="다시쓰기"/>
		</div>
	</form>
</div>

</body>
</html>










