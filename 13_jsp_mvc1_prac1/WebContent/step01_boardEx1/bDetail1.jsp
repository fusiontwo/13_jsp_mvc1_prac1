<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDetail1</title>
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
		BoardDTO1 boardDTO1 = BoardDAO1.getInstance().getBoardDetail(boardId);
	%>

	<div align="center">
		<h3>게시글 상세 조회</h3>
		<table border="1">
			<tr>
				<td>조회수</td>
				<td><%=boardDTO1.getReadCnt() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=boardDTO1.getWriter()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=boardDTO1.getEnrollDt() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=boardDTO1.getEmail() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=boardDTO1.getWriter() %></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><%=boardDTO1.getContent() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="location.href='bAuthentication1.jsp?boardId=<%=boardDTO1.getBoardId()%>&menu=update'">
					<input type="button" value="삭제" onclick="location.href='bAuthentication1.jsp?boardId=<%=boardDTO1.getBoardId()%>&menu=delete'">
					<input type="button" value="목록보기" onclick="location.href='bList1.jsp'">
				</td>
			</tr>	
		</table>
	</div>

</body>
</html>