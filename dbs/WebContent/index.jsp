<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>

<style>

	#wrap{
		width:1400px;
		height:1600px;
		margin:0px auto;
	}
	#top{
		background:yellow;
		width:100%;
		height:15%;
	}
	
	#left{
		background:red;
		width:20%;
		height:75%;
		float:left;
	}
	
	#center{
		background:skyblue;
		width:80%;
		height:75%;
		float:right;
	}
	
	#bottom{	
		width:100%;
		height:10%;
	}
	
	#loginFormArea{
		width:15%;
		height:20%;
	}
	
	fieldset{
		text-align:left;
	}
	
</style>

</head>
<body>

<div id="wrap">
	<div id="top" align="right">
		<div id="loginFormArea">
		<form action="login" method="POST">
			<fieldset>
			<legend>회원 로그인</legend>
			
				<table align="center">
					<tr>
						<p><input type="text" name="id" id="id" placeholder="아이디" /></p>
					</tr>
					<tr>
						<p><input type="passwd" name="passwd" id="passwd" placeholder="비밀번호" /></p>
					</tr>
				
					&nbsp;&nbsp;&nbsp;<input type="submit" value="로그인" id="login" />&nbsp;&nbsp;&nbsp;
					<a href="joinForm.jsp"><button type="button">회원가입</button></a>
				
				</table>

			</fieldset>
		</form>
	</div>
	</div>
	<div id="left"><%@ include file="./form/left.jsp" %></div>
	<div id="center"><%@ include file="./form/center.jsp" %></div>
	<div id="bottom"><%@ include file="./form/bottom.jsp" %></div>
</div>

</body>
</html>