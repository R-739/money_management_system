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
                <h1>お金管理システム</h1>
            </div>
            <div id="header_menu">
            <c:if test="${sessionScope.login_employee !=null}">
            <a href="<c:url value='/moneys/index' />">帳簿一覧</a>&nbsp;
            </c:if>
            </div>
            <c:if test="${sessionScope.login_employee != null}">
                <div id="employee_name">
                <c:out value="${sessionScope.login_employee.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                <a href="<c:url value='/logout' />">ログアウト</a>
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