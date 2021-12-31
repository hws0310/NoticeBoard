<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="notice.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="notice" class="notice.Notice" scope="page" />
<!-- useBean id="빈 이름" class="자바빈 파일의 패키지.클래스명" scope="유효범위" -->

<jsp:setProperty name="notice" property="bbsTitle"/>
<jsp:setProperty name="notice" property="bbsContent"/>


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
	   if(userID == null){
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('로그인을 하세요.')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");
	   }else{
			if(notice.getBbsTitle() == null || notice.getBbsContent() == null){
						  PrintWriter script = response.getWriter();
					      script.println("<script>");
					      script.println("alert('입력이 안 된 사항이 있습니다. 다시 확인하십시오')");
					      script.println("history.back()");
					      script.println("</script>");
					}else{
						NoticeDAO noticeDAO = new NoticeDAO();
						int result = noticeDAO.write(notice.getBbsTitle(), userID, notice.getBbsContent());
						if (result == -1) {
						      PrintWriter script = response.getWriter();
						      script.println("<script>");
						      script.println("alert('작성하기 실패.')");
						      script.println("history.back()");
						      script.println("</script>");
						   }
						   else{
						      PrintWriter script = response.getWriter();
						      script.println("<script>");
						      script.println("location.href ='bbs.jsp'");
						      script.println("</script>");
						   }
					}
	   }
	%>
</body>
</html>