<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<h2>게시글 목록</h2>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/board/view?id=${board.id}">
                        ${board.title}
                </a>
            </td>
            <td>${board.content}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div>
    <%--    pagenation--%>
    <%--1페이지부터 마지막 페이지까지 표현--%>
    <c:forEach begin="1" end="${lastPageNumber}" var="pageNumber">
        <a href="/board/list?page=${pageNumber}">${pageNumber}</a>
    </c:forEach>
</div>

</body>
</html>
