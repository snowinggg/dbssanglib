<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.util.ArrayList"%>




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>건강한 사람들</title>

</head>
<body> 
<% 
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
int pageNumber = 1; 
if(request.getParameter("pageNumber")!=null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

%>

<div class="navbar wrapper">
		<div class="container">
	
	<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">건강한 사람들</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 건강식품 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="product1.jsp">식재료</a></li>
						<li><a href="product2.jsp">음료</a></li>
						<li><a href="product3.jsp">과일/채소</a></li>
						<li><a href="product4.jsp">견과류</a></li>
						<li><a href="product5.jsp">기타</a></li>
					</ul></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> Contect <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 회원관리 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
			</div>
			
			</div>
			</nav>
		</div>
	</div>
	
	
 <div class="container"> 
 <div class = "row"> 
 <table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
 <thead> 
 <tr> 
 <th style="background-color: #eeeeee; text-align: center;">번호</th>
 <th style="background-color: #eeeeee; text-align: center;">제목</th>
 <th style="background-color: #eeeeee; text-align: center;">작성자</th>
 <th style="background-color: #eeeeee; text-align: center;">작성일</th>
 </tr>
 </thead>
 
 
 <tbody>
 
 <% BoardDAO boardDAO = new BoardDAO();
 ArrayList<Board> list = boardDAO.getList(pageNumber);
 for(int i=0; i<list.size(); i++){
	 %>
	 <tr> 
	 
	 <td><%=list.get(i).getBoardID() %></td>
	 <td><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle() %></a></td>
	 <td><%= list.get(i).getUserID() %></td>
	 <td><%= list.get(i).getBoardDate().substring(0,11)+list.get(i).getBoardDate().substring(11,13)+ "시" + list.get(i).getBoardDate().substring(14,16)+"분" %></td>
	 
	 </tr> 
	 <% 
	 	} 
	 %>
 </tbody>
 </table>
 
 <% 
 	if(pageNumber != 1){
 		%> 
 		<a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전페이지</a> 
 	<% 
 	}
 	if(boardDAO.nextPage(pageNumber + 1)){
 		%> <a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-left">다음페이지</a> 
 	<% 
 	} 
 	%>

 
 <a href = "write.jsp" class="btn btn-primary pull-right">글쓰기</a>
  </div>
  </div>
  
  <div class="container marketing">
  
  <hr class="featurette-divider">
  
  <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>2021 OpenSource_Web, Team_2.</p>
    </footer>
  
  </div>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js">
  </script>
   <script src="js/bootstrap.js"></script>
   </body>
   </html>
