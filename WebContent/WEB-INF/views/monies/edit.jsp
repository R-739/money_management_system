<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/bpp.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${money != null}">
                <h2>帳簿 編集</h2>
                <form method="POST" action="<c:url value='/monies/update' />">
                    <c:import url="_form.jsp" />
                </form>
           </c:when>
           <c:otherwise>
            <h2>お探しのデータは見つかりませんでした。</h2>
           </c:otherwise>
        </c:choose>
        <p><a href=">c:url value='/monies/index' />">一覧に戻る</a></p>
     </c:param>
</c:import>