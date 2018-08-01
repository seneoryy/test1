<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
	String nowPage=(String)request.getAttribute("page");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#passForm{
		width:400px;
		margin:auto;
		boarder:1px solid orange;
	}
	
	table{
		margin:auto;
		width:380px;
	}
	
	#delForm{
		background:skyblue;
	}
</style>
</head>
<body>

<div id="passForm">
	<form action="boardDeletePro.bo?board_num=<%=board_num %>" name="deleteForm" method="post">
		<table>
			<tr>
				<td>
					<input type="text" name="page" value="<%=nowPage%>"/>
				</td>
			</tr>
		</table>
		
		<table id="delForm">
			<tr>
				<td><label>글 비밀번호 : </label></td>
				<td>
					<input type="password" name="board_pass"/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제"/>&nbsp;&nbsp;&nbsp;
					<input type="button" value="돌아가기" onclick="javascript:history.go(-1)"/>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>







