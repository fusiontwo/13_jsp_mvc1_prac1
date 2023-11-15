<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bAuthentication</title>
</head>
<body>

	<%
	
		String menu = request.getParameter("menu");
		long boardId = Long.parseLong(request.getParameter("boardId"));
		
		BoardDTO1 boardDTO1 = BoardDAO1.getInstance().getBoardDetail(boardId);
	%>
	
	<div>
		<h3>사용자 인증</h3>
		<form action="bAuthenticationPro1.jsp" method="post">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><%=boardDTO1.getWriter() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=boardDTO1.getEnrollDt() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=boardDTO1.getSubject() %></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
			<p>
				<input type="hidden" name="boardId" value="<%=boardId%>">
				<input type="hidden" name="menu" value="<%=menu %>">
				<input type="submit" value="인증" />
				<input type="button" onclick="location.href='bList1.jsp'" value="목록보기" />
			</p>
		</form>
	</div>

</body>
</html>