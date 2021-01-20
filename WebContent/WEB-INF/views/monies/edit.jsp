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
        <p><a href="#" onclick="confirmDestroy();">この帳簿を削除する</a></p>
        <form method="POST" action="${pageContext.request.contextPath}/monies/destroy">
            <input type="hidden" name="_token" value="${_token}" />
        </form>
        <script>
        function confirmDestroy() {
            if(confirm("本当に削除してもよろしいですか?")) {
            document.forms[1].submit();
          }
        }
        </script>
        <p><a href="<c:url value='/monies/index' />">一覧に戻る</a></p>
     </c:param>
</c:import>