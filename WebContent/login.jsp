<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width", initaial-scale="1">
<!-- 부트스트랩은 컴퓨터 핸드폰 어떤것으로 접속하든 디자인을 해준다. -->
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 만들기</title>
</head>
<body>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
	
	<nav class = "navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul> 
				</li>
			</ul>
		</div>	
		</nav>


<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
   <div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
    <form method="post" action="loginAction.jsp">
     <h3 style="text-align: center;">로그인 화면</h3>
     <br>
      <div class="form-row">
      	<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디" maxlength="20">
      </div>
     <br>
      <div class="form-row">
      	<input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="비밀번호" maxlength="20">
      </div>
     <br>     
     <input type="submit" class="btn btn-info form-control" value="로그인">
    </form>
   </div>
  </div>
 </div>

</body>
</html>