<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
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
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('유효하지 않은 글')");
			   script.println("location.href = 'bbs.jsp'");
			   script.println("</script>");			
		}
		Notice notice = new NoticeDAO().getNotice(bbsID);
	%>
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
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){  // 로그인이 되어있지 않다면..
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul> 
				</li>
			</ul>
			<%
				}else{  // 로그인 되어있다면..
			%>
						<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul> 
				</li>
			</ul>
			<% 
				}
			%>		
		</div>	
		</nav>
		
		<div clss="container">
			<div class="row">
					<table class="table table-striped" style="text-align:center; border:1px solid #ddddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글 보기</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width:20%;">글 제목</td>
								<td colspan="2"><%= notice.getBbsTitle() %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= notice.getUserID() %></td>
							</tr>	
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= notice.getBbsDate().substring(0,11) + notice.getBbsDate().substring(11,13) + "시" + notice.getBbsDate().substring(14,16) + "분"%></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height:200px; text-align: left;"><%= notice.getBbsContent().replaceAll("","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
							</tr>													
						</tbody>
					</table>
					<a href="bbs.jsp" class="btn btn-primary">목록</a>
					<%
						if(userID != null && userID.equals(notice.getUserID())){
					%>		
							<a href="update.jsp?bbsID=<%= bbsID %>" class = "btn btn-primary">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class = "btn btn-primary">삭제</a>
							<!-- 정말로 삭제하겠냐고 뜨고 그 다음 확인 누르면 삭제가 되어진다. return confirm()을 이용 -->
					<% 
						}
					%>
					<input type="submit" class="btn btn-primary pull-right" value="작성완료">
				</form>
			</div>
		</div>

</body>
</html>