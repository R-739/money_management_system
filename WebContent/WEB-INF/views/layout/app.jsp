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
                <h1><a href="<c:url value='/' />">お金管理システム</a></h1>
            </div>
                <div id="header_right">
                <ul>
                <li><a href="<c:url value='/users/new' />">ユーザー登録</a></li>
                <li><a href="<c:url value='/login' />">ログイン</a></li>
                </ul>
                </div>
            </div>
            <br>
            <c:if test="${flush != null}">
            <div id="flush_success">
            <c:out value="${flush}"></c:out>
            </div>
            </c:if>
                <div id="content">
                    <div class="text-center">
                        ${param.content}
                    </div>
                </div>
        </div>
    </body>
</html>