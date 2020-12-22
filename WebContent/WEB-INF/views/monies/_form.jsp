<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="money_date">日付</label><br />
<input type="date" name="money_date" value="<fmt:formatDate value='${money.money_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="content">内訳</label><br />
<textarea name="content" rows="10" cols="50">${money.content}</textarea>
<br /><br />

<label for="deposit">入金額</label><br />
<input type="number" name="deposit" value="${money.deposit}" />
<br /><br />

<label for="pay">出金額</label><br />
<input type="number" name="pay" value="${money.pay}" />
<br /><br />

<label for="sum">合計</label><br />
<input type="number" name="sum" value="${money.sum}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>