<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <style>
        .active {
            background-color: yellow;
        }
    </style>

    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp">
    <c:param name="active" value="list"/>
</c:import>
<div class="container">
    <div class="row">
        <div class="col">

            <h2 class="my-3">게시글 목록</h2>
            <table class="table">
                <thead>
                <tr>
                    <th>
                        <i class="fa-solid fa-hashtag"></i>
                        번호
                    </th>
                    <th class="w-50">제목</th>
                    <th>
                        <i class="fa-solid fa-user"></i>
                        작성자
                    </th>
                    <th class="d-none d-lg-table-cell">
                        <i class="fa-solid fa-calendar-days"></i>
                        작성일
                    </th>
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
                        <td>${board.write}</td>
                        <td class="d-none d-lg-table-cell">${board.inserted}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--    pagenation--%>
<div>
    <%-- 이전버튼--%>
    <c:if test="${pageInfo.hasPrevPage}">
        <a href="/board/list?page=${pageInfo.prevPageNumber}">이전</a>
    </c:if>

    <%--1페이지부터 마지막 페이지까지 표현--%>
    <c:forEach begin="${pageInfo.leftPageNumber}" end="${pageInfo.rightPageNumber}" var="pageNumber">
        <a class="${pageInfo.currentPageNumber == pageNumber ? 'active' : ''}" <%--현재페이지넘버--%>
           href="/board/list?page=${pageNumber}">${pageNumber}</a>
    </c:forEach>

    <c:if test="${pageInfo.hasNextPage}">
        <a href="/board/list?page=${pageInfo.nextPageNumber}">다음</a>
    </c:if>

</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>
