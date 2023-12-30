<%-- 
    Document   : header
    Created on : Nov 20, 2023, 9:54:29 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script src="assets/js/header.js"></script>
        
    </head>
    <body>
        <!-- header -->
        <div class="header">
            <a href="home">
                <div class="header__logo">
                    <img src="assets/image/logo.png" alt="Logo" />
                    <span>Furnish</span>
                </div>
            </a>
            <ul class="header__menu">
                <li>
                    <a href="home">Home</a>
                </li>
                <li>
                    <a href="products">Shop</a>
                </li>
                <li>
                    <a href="about">About</a>
                </li>
                <li>
                    <a href="contact">Contact</a>
                </li>
            </ul>
            <ul class="header__icon">
                <li>
                    <a href="#">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-regular fa-heart"></i>
                    </a>
                </li>
                <li>
                    <c:set var="numInCart" value="${sessionScope.numInCart}" />
                    <a href="showCart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <c:if test="${numInCart != null && numInCart != 0}">
                            <span>${sessionScope.numInCart}</span>
                        </c:if>
                    </a>
                </li>
                <c:if test="${sessionScope.account != null}">
                    <li>
                        <div class="user__dropdown"> 
                            <img src="${sessionScope.account.image}" alt="">
                            <!-- <i class="fa-regular fa-user"></i> -->
                        </div>
                        <c:if test="${sessionScope.account.role == 1}">
                            <!--<span>${sessionScope.account.username}</span>-->
                        </c:if>
                    </li>
                    <div class="menu__dropdown">
                        <h4>${sessionScope.account.fullname}</h4>
                        <ul>
                            <li>
                                <a href="profileUser">Profile</a>
                            </li>
                            <li>
                                <a href="purchase">Purchase</a>
                            </li>
                            <li>
                                <a href="changePass">Change Password</a>
                            </li>
                            <li>
                                <a href="logout">Log Out</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account == null}">
                    <li class="header__authen">
                        <a href="login">
                            Sign in
                        </a>
                        /
                        <a href="signup">
                            Sign up
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!-- End header -->
    </body>
</html>
