<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate1</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>

	<%
	
		long boardId = Long.parseLong(request.getParameter("boardId"));
		BoardDTO1 boardDTO1 = BoardDAO1.getInstance().getBoardDetail(boardId);
	
	%>
	
	<div align="center">
		<h3>게시글 수정</h3>
		<form action="bUpdatePro1.jsp" method="post">
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
					<td><input type="text" name="subject" value="<%=boardDTO1.getSubject()%>"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="60" name="content"><%=boardDTO1.getContent() %></textarea>
						<script>CKEDITOR.replace("content");</script>
					</td>
				</tr>				
			</table>
			<p>
				<input type="hidden" name="boardId" value="<%=boardDTO1.getBoardId()%>">
				<input type="submit" value="수정하기" />
				<input type="button" onclick="location.href='bList.jsp'" value="목록보기" />
			</p>
		</form>
	</div>

</body>
</html>