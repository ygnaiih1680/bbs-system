<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:48
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

        String sql = "DELETE FROM board_db.board_tbl WHERE id = " + id;
        ResultSet rs = statement.executeQuery("select passwd from board_db.board_tbl where id=" + id);
        if (rs.next()) {
            if (rs.getString("passwd").equals(pw)) {
                statement.execute(sql);%>
<h2 style="text-align: center">게시글이 삭제되었습니다.</h2><br>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-list.jsp">게시글 목록 보기</a></div>
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
