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
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul> 
				</li>
			</ul>
		</div>	
		</nav>
 
 <div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
   <div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
    <form method="post" action="joinAction.jsp">
     <h3 style="text-align: center;">회원가입 화면</h3>
     <br>
      <div class="form-row">
      	<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디" maxlength="20">
      </div>
     <br>
      <div class="form-row">
      	<input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="비밀번호" maxlength="20">
      </div>
     <br>
      <div class="form-row">
      	<input type="text" class="form-control" id="userName" name="userName"  placeholder="이름" maxlength="10">
      </div>
     <br>
      <div class="form-group" style="text-align:center;">
      	<div class="btn-group" data-toggle="buttons">
      		<label class="btn btn-primary active">
      			<input type="radio" name="userGender" value="남자" autocomplete="off" checked>남자 	
      		</label>
      		<label class="btn btn-primary">
      			<input type="radio" name="userGender" value="여자" autocomplete="off">여자
      		</label>
      	</div>
      </div>
     <br>
      <div class="form-row">
      	<input type="email" class="form-control" id="userEmail" name="userEmail"  placeholder="E-mail" maxlength="30">
<!--  
      	@
		<input type="text" class="form-control" name="userEmailAddress" value="" ReadOnly="true"/>
					<select name="emailCheck" onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
    					    <option value="etc">직접입력</option>
    					    <option value="notSelected" >::선택하세요::</option>
    					    <option value="naver.com">naver.com</option>
    					    <option value="nate.com">nate.com</option>
						    <option value="empal.com">empal.com</option>
						    <option value="hotmail.com">hotmail.com</option>
						    <option value="lycos.co.kr">lycos.co.kr</option>
						    <option value="msn.com">msn.com</option>
						    <option value="hanmail.net">hanmail.net</option>
						    <option value="yahoo.com">yahoo.com</option>
						    <option value="korea.com">korea.com</option>
						    <option value="kornet.net">kornet.net</option>
						    <option value="yahoo.co.kr">yahoo.co.kr</option>
						    <option value="kebi.com">kebi.com</option>
						    <option value="orgio.net">orgio.net</option>
						    <option value="paran.com">paran.com</option>    
						    <option value="gmail.com">gmail.com</option>
   					</select>
-->
      </div>
     <br>     
     <input type="submit" class="btn btn-info form-control" value="회원가입">
    </form>
   </div>
  </div>
 </div>
 
<!--  
	<script>
		function SetEmailTail(emailValue) {
  			var email = document.all("userEmail")    
  			var emailTail = document.all("userEmailAddress") 
  				if ( emailValue == "notSelected" )
   						return;
  				else if ( emailValue == "etc" ) {
					   emailTail.readOnly = false;
					   emailTail.value = "";
					   emailTail.focus();
  				} else {
					   emailTail.readOnly = true;
					   emailTail.value = emailValue;
 				 }
 		 }
	</script>
-->	
	
</body>
</html>