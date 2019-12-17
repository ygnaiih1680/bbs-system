<%--
  Created by IntelliJ IDEA.
  User: tjdwp
  Date: 2019-12-15
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<h2 style="text-align: center">패스워드를 입력하시오</h2><br><br><br>
<form action="board-modify.jsp" method="post">
    <p style="text-align: center"><img src="image/ball.gif" alt="ball">
        패스워드 :&nbsp;<input type="password" name="password" style="width: 250px"></p><br><br>
    <input type="hidden" name="id" value="<%=id%>">
    <div style="text-align: center"><input type="submit" value="수정하기"/>&nbsp;<input type="reset" value="다시쓰기"/></div>
</form>
<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-read.jsp?id=<%=id%>">수정 취소</a></div>
</body>
</html>
