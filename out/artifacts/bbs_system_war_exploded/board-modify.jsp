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
    <title></title>
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
        String pw = request.getParameter("password");

        ResultSet rs = statement.executeQuery("select * from board_db.board_tbl where id=" + id);
        if (rs.next()) {
            if (rs.getString("passwd").equals(pw)) {%>
<h2 style="text-align: center">게시글 수정</h2>
<form action="board-modify-db.jsp" method="post">
    <table style="margin-left: auto; margin-right: auto">
        <tr>
            <td><img src="image/ball.gif" alt="ball">
                글 쓴 이 :</td>
            <td><input type="text" name="author" style="width: 200px" value="<%=rs.getString("name")%>"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball">
                메일주소 :</td>
            <td><input type="text" name="e_mail" value="<%=rs.getString("e_mail")%>" style="width: 300px"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball">
                글 제 목 :</td>
            <td><input type="text" name="title" value="<%=rs.getString("title")%>" style="width: 400px"></td>
        </tr>
        <tr>
            <td style="vertical-align: top"><img src="image/ball.gif" alt="ball">
                글 내 용 :</td>
            <td><textarea name="content" style="width: 500px; height: 100px"><%=rs.getString("content")%></textarea></td>
        </tr>
    </table>
    <br><br>
    <input type="hidden" name="id" value="<%=id%>">
    <div style="text-align: center"><input type="submit" value="등록하기"/>&nbsp;<input type="reset" value="다시쓰기"/></div>
</form>
<% } else { %>
<h2 style="text-align: center">잘못 입력 된 패스워드입니다.</h2><br>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-read.jsp?id=<%=id%>">뒤로</a>
</div>
<% }
}


} catch (Exception e) {
    System.out.println("DB 연동 오류입니다 : " + e.getMessage());
}
%>
</body>
</html>
