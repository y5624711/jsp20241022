<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--조각 : fragment--%>
<div>
    <div style="display:flex; gap:10px">
        <div>
            <a href="/board/list">목록</a>
        </div>
        <div>
            <a href="/board/new">글작성</a>
        </div>
        <c:if test="${not empty message}">
            <style>
                .success {
                    background-color: skyblue;
                    margin: 10px;
                }
            </style>
            <div class="${message.type}">
                <h5>
                        ${message.txt}
                </h5>
            </div>
        </c:if>
    </div>
</div>