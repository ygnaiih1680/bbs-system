<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    Connection connection;
    Statement statement;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
        connection = DriverManager.getConnection(jdbcurl, "root", "vmffkd@495");
        statement = connection.createStatement();
        int id = Integer.parseInt(request.getParameter("id"));
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String e_mail = request.getParameter("e_mail");
        String sql = "update board_db.board_tbl set name = '" + author + "', " + "title = '" + title + " (수정)', " + "content = '" + content + "', e_mail = '" + e_mail + "' where id=" + id;
        statement.execute(sql);%>
<h2 style="text-align: center">게시글이 수정되었습니다.</h2><br>
<div style="text-align: center"><img src="image/red_tree.gif" alt="tree"><a href="board-read.jsp?id=<%=id%>">작성한 글 확인</a>
    <img src="image/green_tree.gif" alt="tree"><a href="board-list.jsp">게시글 목록 보기</a></div>
<%
    } catch (Exception e) {
        System.out.println("DB 연동 오류입니다 : " + e.getMessage());
    }
%>
</body>
</html>
