<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/bpp.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>帳簿一覧</h2>
        <table id="money_list">
            <tbody>
                <tr>
                    <th class="money_date">日付</th>
                    <th class="money_deposit">入金額</th>
                    <th class="money_pay">出金額</th>
                    <th class="money_sum">残額</th>
                    <th class="money_action">操作</th>
                    <th class="money_likes">Good</th>
                    <th class="money_dislikes">Bad</th>
                </tr>
                <c:forEach var="money" items="${monies}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="money_date"><fmt:formatDate value='${money.money_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="money_deposit">${money.deposit}</td>
                        <td class="money_pay">${money.pay}</td>
                        <td class="money_sum">${money.sum}</td>
                        <td class="money_action"><a href="<c:url value='/monies/show?id=${money.id}' />">詳細を見る</a></td>
                        <td class="money_likes">${money.likes}</td>
                        <td class="money_dislikes">${money.dislikes}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${monies_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((monies_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/monies/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/monies/new' />">新規記帳の登録</a></p>


    </c:param>
</c:import>