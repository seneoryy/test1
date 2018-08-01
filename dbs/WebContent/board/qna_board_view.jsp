<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>

<%
	BoardBean article=(BoardBean)request.getAttribute("article");
	String nowPage=(String)request.getAttribute("page");
	out.println("nowPage : "+nowPage);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC게시판</title>
<style>
	table{
		margin:auto;
		width:450px;
	}
	
	h3{
		text-align:center;
	}
	
	#basicInfoArea{
		height:40px;
		text-align:center;
	}
	
	#articleContentArea{
		background:orange;
		margin-top:20px;
		height:350px;
		text-align:center;
		overflow:auto;
	}
	
	#commandList{
		margin:auto;
		width:500px;
		text-align:center;
	}
</style>
</head>
<body>

<div id="articleForm">
	<h3>글 내용 상세보기</h3>
	<div id="basicInfoArea">
		<table>
			<tr>
				<td>
					제목:<%=article.getBoard_subject() %>
				</td>
				
				<td>
					첨부파일:
		<%if(!(article.getBoard_file()==null)){ %>
			<a href="file_down?downFile=<%=article.getBoard_file()%>">
				<%=article.getBoard_file() %>
			</a>
		<%} %>
				</td>
			</tr>
		</table>
		
	</div>
	
	<div id="articleContentArea">
		<%=article.getBoard_content() %>
	</div>
</div>

<div id="commandList">
	<a href="boardReplyForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>">
		[답변]
	</a>
	
	<a href="boardModifyForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>">
		[수정]
	</a>
	
	<a href="boardDeleteForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage%>">
		[삭제]
	</a>
	
	<a href="boardList.bo?page=<%=nowPage%>">
		[목록]
	</a>&nbsp;&nbsp;
</div>

</body>
</html>











