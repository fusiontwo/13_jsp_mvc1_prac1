<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bWritePro1</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
		
		BoardDTO1 boardDTO1 = new BoardDTO1();
		
		boardDTO1.setWriter(request.getParameter("writer"));
		boardDTO1.setSubject(request.getParameter("subject"));
		boardDTO1.setEmail(request.getParameter("email"));
		boardDTO1.setPassword(request.getParameter("password"));
		boardDTO1.setContent(request.getParameter("content"));
		
		BoardDAO1.getInstance().insertBoard(boardDTO1);
		
	%>
	
	<script>
/* 		alert("게시글이 등록 되었습니다.");
		location.href = "bList1.jsp"; */
		
		Swal.fire({
			title: "게시글이 등록 되었습니다.",
			text: "메인화면으로 이동합니다.",
			icon: "success"
		}).then(function(){
			location.href = "bList1.jsp";
		});
		
	</script>
	
	
</body>
</html>