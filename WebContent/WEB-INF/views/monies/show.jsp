<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/bpp.jsp" >
  <c:param name="content">
    <c:choose>
     <c:when test="${money != null}">
        <h2>帳簿 詳細</h2>

        <table>
            <tbody>
                <tr>
                    <th>日付</th>
                    <td><fmt:formatDate value="${money.money_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>内訳</th>
                    <td>
                        <pre><c:out value="${money.content}" /></pre>
                    </td>
                </tr>
                <tr>
                    <th>入金額</th>
                    <td>
                     <c:out value="${money.deposit}" />
                    </td>
               </tr>
               <tr>
                    <th>出金額</th>
                    <td><c:out value="${money.pay}" /></td>
              </tr>
              <tr>
                    <th>残額</th>
                    <td><c:out value="${money.sum}" /></td>
              </tr>
              <tr>
                     <th>登録日時</th>
                     <td>
                     <fmt:formatDate value="${money.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                      </td>
              </tr>
              <tr>
                      <th>更新日時</th>
                      <td>
                      <fmt:formatDate value="${money.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                      </td>
              </tr>
              <tr>
                    <th>Good</th>
                    <td><c:out value="${money.likes}" /></td>
             </tr>
             <tr>
                   <th>Bad</th>
                   <td><c:out value="${money.dislikes}" /></td>
             </tr>
            </tbody>
        </table>

          <c:if test="${sessionScope.login_user.id == money.user.id}">
            <p><a href="<c:url value="/monies/edit?id=${money.id}" />">この帳簿を編集する</a></p>
          </c:if>
           <form method="POST" action="<c:url value='/likes/update' />">
                        <input type="hidden" name="_token" value="${_token}" />
                        <button type="submit" name="likes" value="${1}">good</button>
          </form>
          <form method="POST" action="<c:url value='/dislikes/update' />">
                        <input type="hidden" name="_token" value="${_token}" />
                        <button type="submit" name="dislikes" value="${1}">bad</button>
          </form>
      </c:when>
      <c:otherwise>
        <h2>お探しのデータは見つかりませんでした。</h2>
      </c:otherwise>
   </c:choose>

    <p><a href="<c:url value="/monies/index" />">一覧に戻る</a>
   </c:param>
 </c:import>


