<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
</head>
<body>
<h2 style="text-align: center">게시글 목록 보기</h2><br>
<%
    String[] header = {"글번호", "글쓴이", "글제목", "전자우편"};
    int[] hWidth = {100, 100, 400, 250};
    Connection connection;
    Statement statement;
    ResultSet resultSet = null;
    String reference = "--->";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
        connection = DriverManager.getConnection(jdbcurl, "root", "vmffkd@495");
        statement = connection.createStatement();
        String sql = "select * from board_db.board_tbl order by ref desc, id";
        resultSet = statement.executeQuery(sql);
    } catch (Exception e) {
        System.out.println("DB 연동 오류입니다 : " + e.getMessage());
    }
%>
<table style="margin-left: auto; margin-right: auto; text-align: center" border="1">
    <thead>
    <tr style="background-color: lightgray">
        <%for (int i = 0; i < header.length; i++) {%>
        <th style="width: <%=hWidth[i]%>px"><%=header[i]%>
        </th>
        <%}%>
    </tr>
    </thead>

    <% try {
        if (resultSet != null) {
            resultSet.last();
            int count = resultSet.getRow();
            resultSet.beforeFirst();
            while (resultSet.next()) {
    %>
    <tr>
        <td><%=count%>
        </td>
        <td style="text-align: left"><%=resultSet.getString("name")%>
        </td>
        <%
            int ref = resultSet.getInt("ref"), id = resultSet.getInt("id");
            String title = resultSet.getString("title");
        %>
        <td><%if (ref!=id){%><%=reference%><%}%>&nbsp;<a href="board-read.jsp?id=<%=id%>"> <%=title%>
        </a>
        </td>
        <td><%=resultSet.getString("e_mail")%>
        </td>
    </tr>
    <%
                    count--;
                }
            }
        } catch (Exception e) {
        }
    %>

</table>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-insert.jsp">게시글 쓰기</a></div>
<br>
<div style="text-align: center"><img src="image/island.gif" alt="island" width="90%"></div>
</body>
</html>