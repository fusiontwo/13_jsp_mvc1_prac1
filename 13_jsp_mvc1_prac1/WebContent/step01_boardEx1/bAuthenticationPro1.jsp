<%@page import="step01_boardEx1.BoardDAO1"%>
<%@page import="step01_boardEx1.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bAuthenticationPro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		
		long boardId     = Long.parseLong(request.getParameter("boardId"));
		String password  = request.getParameter("password");
		String menu      = request.getParameter("menu");
		
		BoardDTO1 boardDTO1 = new BoardDTO1();
		boardDTO1.setBoardId(boardId);
		boardDTO1.setPassword(password);

		boolean isAuthorizedUser = BoardDAO1.getInstance().checkAuthorizedUser(boardDTO1);
		if (isAuthorizedUser) {
			
			if (menu.equals("update")) {
	%>		
				<script>
					location.href = "bUpdate1.jsp?boardId=" + <%=boardId%>;
				</script>
	<% 	
			}
			else if (menu.equals("delete")) {
				response.sendRedirect("bDelete1.jsp?boardId=" + boardId);
			}
			
		}
		else {
	%>
			<script>
				alert("잘못된 패스워드입니다.");
				history.go(-1);  // 한 페이지 뒤로가기
			</script>
	<%	
		}
	%>

</body>
</html>