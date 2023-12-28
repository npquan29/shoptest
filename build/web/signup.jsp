<%-- 
    Document   : signup
    Created on : Nov 18, 2023, 10:46:21 PM
    Author     : lap
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Sign Up</title>
    </head>
    <body>
        <div class="login">
            <div class="content">
                <div class="content__header">
                    <div class="content__logo">
                        <img src="assets/image/logo_sss.png" alt="" />
                    </div>
                    <h1>Let’s Get Started</h1>
                    <div class="content__desc">
                        Create a new account
                    </div>
                </div>
                
                <c:if test="${er != null}">
                    <div class="error">${er}</div>
                </c:if>

                <div class="content__body">
                    <form action="signup" method="post">
                        <div class="form-group">
                            <input type="text" name="username" required placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" required placeholder="Password" />
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" required placeholder="Email"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="fullname" required placeholder="Full name" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" required placeholder="Address" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="phone" required placeholder="Phone" />
                        </div>
                        <button type="submit">Sign Up</button>
                    </form>
                </div>

                <div class="content__footer">
                    <span>Do you have an account? <a href="login">Sign In</a></span>
                </div>
            </div>
        </div>
    </body>
</html>
