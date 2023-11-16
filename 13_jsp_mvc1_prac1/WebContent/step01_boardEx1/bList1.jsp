<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@page import="step01_boardEx1.BoardDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>bList1</title>
</head>
<body>
	
	<div align="center">
		<h3>커뮤니티 게시글</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<%
				int idx = 1;
				ArrayList<BoardDTO1> boardList = BoardDAO1.getInstance().getBoardList();
				for (BoardDTO1 boardDTO1 : boardList) {			
			%>
 					<tr>
						<td><%=idx %></td>
						<td><a href="bDetail1.jsp?boardId=<%=boardDTO1.getBoardId()%>"><%=boardDTO1.getSubject() %></a></td>
						<td><%=boardDTO1.getWriter() %></td>
						<td><%=boardDTO1.getEnrollDt() %></td>
						<td><%=boardDTO1.getReadCnt() %></td>
					</tr>
			
			<%
					idx++;
				}
			%>
			
			<tr>
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='bWrite1.jsp'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>