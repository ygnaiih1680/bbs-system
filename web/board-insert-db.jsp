<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>

    </title>
</head>
<body>
<%
    Connection connection;
    Statement statement;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
        connection = DriverManager.getConnection(jdbcurl, "root", "vmffkd@495");
        statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("select * from board_db.board_tbl");
        int lid = 1;
        if (rs.last()) lid += rs.getInt("id");
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String e_mail = request.getParameter("e_mail");
        String password = request.getParameter("password");
        int ref = request.getParameter("reply").equals("y") ? Integer.parseInt(request.getParameter("ref")) : lid;
        String sql = "insert into board_db.board_tbl (id, name, e_mail, title, content, passwd, ref) VALUES (" + lid + ", " + author + ", " + e_mail + ", " + title + ", " + content + ", " + password + ", " + ref + ")";
        statement.executeUpdate(sql);
    } catch (Exception e) {
        System.out.println("DB 연동 오류입니다 : " + e.getMessage());
    }
%>
<h2 style="text-align: center">작성한 글이 등록 되었습니다.</h2>
<br>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-list.jsp">게시글 목록 보기</a></div>
</body>
</html>
