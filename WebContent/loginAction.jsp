<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- useBean id="빈 이름" class="자바빈 파일의 패키지.클래스명" scope="유효범위" -->

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!-- setter 메서드를 사용, 즉 userID, userPassword 세터 메서드 사용 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP 게시판 만들기</title>
</head>
<body>
	<%
		  String userID = null; 
		   if(session.getAttribute("userID") != null){
		      userID = (String)session.getAttribute("userID");
		   }
		
		   if(userID != null){
			   session.setAttribute("userID", user.getUserID());
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('이미 로그인이 되어있습니다.')");
			   script.println("location.href = 'main.jsp'");
			   script.println("</script>");
		   }
		   
		   UserDAO userDAO = new UserDAO();
		   int result = userDAO.login(user.getUserID(),user.getUserPassword());
		   
		   if (result == 1) {
		      session.setAttribute("userID",user.getUserID());
		      PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("location.href = 'main.jsp'");
		      script.println("</script>");
		   }
		   else if (result == 0) {
		      PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('비밀버호가 틀립니다.')");
		      script.println("history.back()");
		      script.println("</script>");
		   }
		   else if (result == -1) {
		      PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('존재하지 않는 아이디 입니다.')");
		      script.println("history.back()");
		         script.println("</script>");
		   }
		   else if (result == -2) {   
		      PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('데이터베이스 오류가 발생했습니다.')");
		      script.println("history.back()");
		      script.println("</script>");
		   }
	%>
</body>
</html>