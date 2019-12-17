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
        String sql = "select * from board_tbl order by ref desc, id asc";
        resultSet = statement.executeQuery(sql);
    } catch (Exception e) {
        System.out.println("DB 연동 오류입니다 : " + e.getMessage());
    }
%>
<center>
    <table style="text-align: center" border="1">
        <thead>
        <tr style="background-color: lightgray">
            <%for (int i = 0; i < header.length; i++) {%>
            <th style="width: <%=hWidth[i]%>px"><%=header[i]%>
            </th>
            <%}%>
        </tr>
        </thead>
        <tr>
            <% try {
                if (resultSet != null) {
                    int count = 1;
                    while (resultSet.next()) {
            %>
            <td><%=count%>
            </td>
            <td><%=resultSet.getString("name")%>
            </td>
            <%int ref = resultSet.getInt("ref"), id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                if (ref!=id) {
                    title = reference+title;}
            %>
            <td><%=title%>
            </td>
            <td><%=resultSet.getString("e_mail")%>
            </td>
            <%
                            count++;
                        }
                    }
                } catch (Exception e) {
                }
            %>
        </tr>
    </table>
</center>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-insert.jsp">게시글 쓰기</a></div>
<br>
<div style="text-align: center"><img src="image/island.gif" alt="island" width="70%"></div>
</body>
</html>