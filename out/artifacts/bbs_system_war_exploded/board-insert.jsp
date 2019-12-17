<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        게시판
    </title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<h2 style="text-align: center">게 시 판</h2>
<form action="board-insert-db.jsp" method="post">
    <table style="margin-left: auto; margin-right: auto">
        <tr>
            <td><img src="image/ball.gif" alt="ball">
            글 쓴 이 :</td>
            <td><input type="text" name="author" style="width: 200px"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball">
            메일주소 :</td>
            <td><input type="text" name="e_mail" style="width: 300px"></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball">
            글 제 목 :</td>
            <td><input type="text" name="title" style="width: 400px"></td>
        </tr>
        <tr>
            <td style="vertical-align: top"><img src="image/ball.gif" alt="ball">
            글 내 용 :</td>
            <td><textarea name="content" style="width: 500px; height: 100px"></textarea></td>
        </tr>
        <tr>
            <td><img src="image/ball.gif" alt="ball">
            패스워드 :</td>
            <td><input type="password" name="password" id="password" style="width: 150px"></td>
        </tr>
    </table>
    <%if (request.getParameter("flag") != null) {%>
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
