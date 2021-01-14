<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/bpp.jsp">
     <c:param name="content">
       <c:choose>
                <c:when test="${user != null}">
                    <h2>${user.name} の情報 詳細</h2>

                    <table>
                        <tbody>
                            <tr>
                                <th>ユーザー番号</th>
                                <td><c:out value="${user.code}" /></td>
                            </tr>
                            <tr>
                                <th>氏名</th>
                                <td><c:out value="${user.name}" /></td>
                           </tr>
                        </tbody>
                    </table>
                    <c:if test="${sessionScope.login_user.id == user.id}">
                    <P><a href="<c:url value='/users/edit?id=${user.id}' />">このユーザー情報を編集する</a></P>
                    </c:if>
                    </c:when>
                <c:otherwise>
                    <h2>お探しのデータは見つかりませんでした。</h2>
                </c:otherwise>
           </c:choose>

           <p><a href="<c:url value='/users/index' />">一覧に戻る</a></p>
       </c:param>
</c:import>