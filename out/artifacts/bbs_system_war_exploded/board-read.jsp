<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>게시판</title>
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
        int ref = id;
        ResultSet rs = statement.executeQuery("select id, name, e_mail, title, content from board_db.board_tbl where id = " + id);
        if (rs.next()) {
%>
<h2 style="text-align: center">게시글 내용</h2><br>
<table style="margin-left: auto; margin-right: auto; text-align: left">
    <tr>
        <td><img src="image/ball.gif" alt="ball">
            글 쓴 이 :
        </td>
        <td colspan="3"><%=rs.getString("name")%>
        </td>
    </tr>
    <tr>
        <td><img src="image/ball.gif" alt="ball">
            메일주소 :
        </td>
        <td colspan="3"><%=rs.getString("e_mail")%>
        </td>
    </tr>
    <tr>
        <td><img src="image/ball.gif" alt="ball">
            글 제 목 :
        </td>
        <td colspan="3"><%=rs.getString("title")%>
        </td>
    </tr>
    <tr>
        <td><img src="image/ball.gif" alt="ball">
            글 내 용 :
        </td>
        <td colspan="3"><%=rs.getString("content")%>
        </td>
    </tr>
    <tr><td colspan="4"><br></td></tr>
    <tr><td colspan="4"><br></td></tr>
    <tr>
        <td><img src="image/green_tree.gif" alt="tree"><a href="board-insert.jsp?ref=<%=ref%>&flag=r">답글 쓰기</a></td>
        <td><img src="image/green_tree.gif" alt="tree"><a href="board-modify-pwd.jsp?id=<%=id%>">게시글 수정</a></td>
        <td><img src="image/green_tree.gif" alt="tree"><a href="board-delete-pwd.jsp?id=<%=id%>">게시글 삭제</a></td>
        <td><img src="image/green_tree.gif" alt="tree"><a href="board-list.jsp">게시글 목록 보기</a></td>
    </tr>
</table>
<%
        }
    } catch (Exception e) {
        System.out.println("DB 연동 오류입니다 : " + e.getMessage());
    }
%>
</body>
</html>
