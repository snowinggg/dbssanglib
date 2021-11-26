<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건강한 사람들</title>
</head>
<body>
	<% 
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID"); 
} 
if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
} 
int boardID = 0;
if(request.getParameter("boardID")!= null){
	boardID = Integer.parseInt(request.getParameter("boardID"));
}
if(boardID==0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("location.href = 'board.jsp'");
	script.println("</script>"); 
}
Board board = new BoardDAO().getBoard(boardID);
BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.report(boardID, board.getBoardBad()+1);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>"); 
		script.println("alert('글신고에 실패하였습니다.')"); 
		script.println("history.back()"); 
		script.println("</script>"); 
	}
	else {
		if(board.getBoardBad() > 2){
			boardDAO.delete(boardID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글이 네번 이상 신고되어 삭제됩니다')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>"); 
		}
		else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글신고가 정상적으로 처리되었습니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>"); 
		}
	} 

	%>
</body>
</body>
</html>