<%-- 
    Document   : login
    Created on : Nov 17, 2023, 10:03:39 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/login.css" />

        <title>Login</title>
    </head>
    <body>
        <div class="login">
            <div class="content">
                <div class="content__header">
                    <div class="content__logo">
                        <img src="assets/image/logo_sss.png" alt="" />
                    </div>
                    <h1>Welcome to Furnish</h1>
                    <div class="content__desc">
                        Sign in to continue
                    </div>
                </div>

                <c:if test="${error != null}">
                    <div class="error">${error}</div>
                </c:if>

                <div class="content__body">
                    <form action="login" method="post">
                        <div class="form-group">
                            <input type="text" id="username" name="username" required placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <input type="password" id="password" name="password" required placeholder="Password" />
                        </div>
                        <button type="submit">Sign In</button>
                    </form>
                </div>

                <div class="content__footer">
                    <div>
                        <a href="forgot">Forgot Password</a>
                    </div>
                    <span>
                        Don’t have an account?
                        <a href="signup">Register</a>
                    </span>
                </div>
            </div>
        </div>
    </body>
</html>
