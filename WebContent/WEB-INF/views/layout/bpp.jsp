<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>お金管理システム</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
          <div id="header">
            <div id="header_logo">
                <h1>お金管理システム</h1>
            </div>
            <c:if test="${sessionScope.login_user != null}">
             <div id="user_name">
                <a href="<c:url value='/monies/index' />">帳簿一覧</a>&nbsp;
                <c:out value="${sessionScope.login_user.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                <a href="<c:url value='/logout' />">ログアウト</a>
             </div>
            </c:if>
          </div>
                <div id="content">
                        ${param.content}
                </div>
        </div>
    </body>
</html>