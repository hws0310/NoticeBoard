<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<!-- useBean id="빈 이름" class="자바빈 파일의 패키지.클래스명" scope="유효범위" -->

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

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
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('이미 로그인이 되어있습니다.')");
		   script.println("location.href = 'main.jsp'");
		   script.println("</script>");
	   }
	
		if(user.getUserID() == null || user.getUserPassword() == null 
		   || user.getUserGender() == null || user.getUserEmail() == null
		   || user.getUserName() == null){
			  PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('입력이 안 된 사항이 있습니다. 다시 확인하십시오')");
		      script.println("history.back()");
		      script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
			      PrintWriter script = response.getWriter();
			      script.println("<script>");
			      script.println("alert('이미 존재하는 아이디입니다.')");
			      script.println("history.back()");
			      script.println("</script>");
			   }
			   else{
				  session.setAttribute("userID",user.getUserID());
			      PrintWriter script = response.getWriter();
			      script.println("<script>");
			      script.println("location.href ='main.jsp'");
			      script.println("</script>");
			   }
		}
	%>
</body>
</html>