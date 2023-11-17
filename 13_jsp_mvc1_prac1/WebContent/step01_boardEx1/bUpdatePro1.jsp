<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdatePro1</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		
		BoardDTO1 boardDTO1 = new BoardDTO1();
		boardDTO1.setBoardId(Long.parseLong(request.getParameter("boardId")));
		boardDTO1.setSubject(request.getParameter("subject"));
		boardDTO1.setContent(request.getParameter("content"));
		
		BoardDAO1.getInstance().updateBoard(boardDTO1);
	%>
	
	<script>
		alert("수정 되었습니다.");
		location.href = "bList1.jsp";
	</script>

</body>
</html>