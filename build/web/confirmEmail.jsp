<%-- 
    Document   : confirmEmail
    Created on : Jan 3, 2024, 1:36:40 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Email</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/login.css" />
    </head>
    <body>
        <div class="login">
            <div class="content">
                <div class="content__header">
                    <div class="content__logo">
                        <img src="assets/image/logo_sss.png" alt="" />
                    </div>
                    <h1>Welcome to Furnish</h1>
                    <c:set var="email" value="${requestScope.email}" />
                    <c:if test="${email != null}">
                        <div class="content__desc">Please enter the ${email} to continue!</div>
                    </c:if>
                    <c:if test="${email == null}">
                        <div class="content__desc">Please enter the ${maskedEmail} to continue!</div>
                    </c:if>
                </div>

                <c:if test="${error != null}">
                    <div class="error">${error}</div>
                </c:if>

                <div class="content__body">
                    <form action="confirmEmail" method="get">
                        <div class="form-group">
                            <input type="text" id="email" name="email" required placeholder="Email" />
                            <input type="hidden" id="username" name="username" value="${requestScope.username}" />
                            <input type="hidden" id="confirmEmail" name="confirmEmail" value="${requestScope.confirmEmail}" />
                            <input type="hidden" id="maskedEmail" name="maskedEmail" value="${email}" />
                        </div>

                        <button type="submit">Next</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
