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
    <title>
        게시판
    </title>
</head>
<body>
<h2 style="text-align: center">게 시 판</h2>
<form action="board-insert-db.jsp" method="post" style="">
    <table style="margin-left: auto; margin-right: auto">
        <tr>
            <td><img src="image/ball.gif" alt="ball"></td>
            <td>글 쓴 이 :</td>
            <td><input type="text" name="author" id="author" style="width: 200px"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball"></td>
            <td>메일주소 :</td>
            <td><input type="text" name="e_mail" id="e_mail" style="width: 300px"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball"></td>
            <td>글 제 목 :</td>
            <td><input type="text" name="title" id="title" style="width: 400px"></td>
        </tr>
        <tr>
            <td style="vertical-align: top"><img src="image/ball.gif" alt="ball"></td>
            <td style="vertical-align: top">글 내 용 :</td>
            <td><textarea id="content" style="width: 500px; height: 100px; resize: none"></textarea></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball"></td>
            <td>패스워드 :</td>
            <td><input type="text" name="password" id="password" style="width: 150px"></td>
        </tr>
    </table>
    <%if (request.getParameter("flag")!=null) {%>
    <input type="hidden" name="ref" value="<%=request.getParameter("ref")%>">
    <input type="hidden" name="reply" value="y">
    <%}%>
    <br><br>
    <div style="text-align: center"><input type="submit" value="등록하기"/>&nbsp;<input type="reset" value="다시쓰기"/></div>
</form>


<div style="text-align: center"><img src="image/green_tree.gif" alt="tree"><a href="board-list.jsp">게시글 목록 보기</a></div>
<br>
<div style="text-align: center"><img src="image/island.gif" alt="island" width="90%"></div>
</body>
</html>
