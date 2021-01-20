<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/bpp.jsp">
    <c:param name="content">
        <c:choose>
          <c:when test="${user != null}">
            <h2>${user.name}の情報 編集</h2>
            <P>(パスワードは変更する場合のみ入力してください)</P>
            <form method="POST" action="<c:url value='/users/update' />">
                <c:import url="_form.jsp" />
            </form>

           </c:when>
          <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
           </c:otherwise>
       </c:choose>

       <p><a href="<c:url value='/users/index' />">一覧に戻る</a></p>

        <p><a href="#" onclick="confirmDestroy();">このユーザーを削除する</a></p>
       <form method="POST" action="${pageContext.request.contextPath}/users/destroy">
                        <input type="hidden" name="_token" value="${_token}" />
       </form>
       <script>
        function confirmDestroy() {
            if(confirm("本当に削除してもよろしいですか?")) {
                document.forms[1].submit();
            }
        }
       </script>
    </c:param>
</c:import>