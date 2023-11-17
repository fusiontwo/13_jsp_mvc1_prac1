<%@page import="step01_boardEx1.BoardDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDeletePro1</title>
</head>
<body>

	<%
	BoardDAO1.getInstance().deleteBoard(Long.parseLong(request.getParameter("boardId")));
	%>
	
	<script>
		alert("삭제 되었습니다.");
		location.href = "bList1.jsp";
	</script>

</body>
</html>