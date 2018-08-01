<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.*, java.text.*" %>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
	PageInfo pageInfo=(PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC게시판</title>
<style>
h1{
	text-align:center;
}

table{
	margin:auto;
	width:450px;
}

#tr_top{
	background:orange;
	text-align:center;
}

#pageList{
	margin:auto;
	width:500px;
	text-align:center;
}

#emptyArea{
	margin:auto;
	width:500px;
	text-align:center;
}
</style>
</head>
<body>

<div id="top" align="right">
	<a href="index.jsp"><button type="button">로그아웃</button></a>&nbsp;&nbsp;
</div>

<div id="listForm">
	<h1>글목록</h1>
	<table>
	<%
		if(articleList!=null && listCount > 0){
	%>
		<tr id="tr_top">
			<td>번호</td>
			<td>제 목</td>
			<td>작성자</td>
			<td>날 짜</td>
			<td>조회수</td>
		</tr>
		<%
			for(int i=0; i<articleList.size(); i++){
		%>
		
		<tr>
			<td><%=articleList.get(i).getBoard_num() %></td>
			<td>
				<%if(articleList.get(i).getBoard_re_lev()!=0){ %>
					<%for(int a=0; a<articleList.get(i).getBoard_re_lev()*2; a++){ %>
						&nbsp;
					<%} %>
					▶
				<%}else{ %>
					▶
				<%} %>
				<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBoard_num()%>&page=<%=nowPage%>">
					<%=articleList.get(i).getBoard_subject() %>
				</a>	
			</td>
			<td><%=articleList.get(i).getBoard_name() %></td>
			<td><%=articleList.get(i).getBoard_date() %></td>
			<td><%=articleList.get(i).getBoard_readcount() %></td>
		</tr>
		<%} %>
	</table>
</div>
<br/><br/>
<div id="pageList">
	<%if(nowPage<=1){ %>
		[이전]&nbsp;
	<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage-1%>">[이전]</a>&nbsp;
	<%} %>
	
	<%for(int a=startPage; a<=endPage; a++){ %>
		<%if(a==nowPage){ %>
			[<%=a %>]
		<%}else{ %>
			<a href="boardList.bo?page=<%=a%>">
				[<%=a %>]
			</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage>=maxPage){ %>
		[다음]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="boardWriteForm.bo">[게시판 글쓰기]</a>
	<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage+1%>">[다음]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="boardWriteForm.bo">[게시판 글쓰기]</a>
	<%} %>
</div>
	<%
		}else{	
	%>
			<div id="emptyArea">등록된 글이 없습니다.</div>
	<%
		}
	%>
	
</body>
</html>







