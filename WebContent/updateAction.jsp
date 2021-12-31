<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="java.io.PrintWriter" %>

<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>

<% request.setCharacterEncoding("UTF-8"); %>

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
		if(!userID.equals(notice.getUserID())){
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('권한이 없습니다.')");
			   script.println("location.href = 'bbs.jsp'");
			   script.println("</script>");				
		}else{
			if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
					|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
						  // equals("")를 사용하여 빈 칸인지 확인하는 구문
						  PrintWriter script = response.getWriter();
					      script.println("<script>");
					      script.println("alert('입력이 안 된 사항이 있습니다. 다시 확인하십시오')");
					      script.println("history.back()");
					      script.println("</script>");
					}else{
						NoticeDAO noticeDAO = new NoticeDAO();
						int result = noticeDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
						if (result == -1) {
						      PrintWriter script = response.getWriter();
						      script.println("<script>");
						      script.println("alert('글 수정 실패.')");
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