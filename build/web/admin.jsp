<%-- 
    Document   : admin
    Created on : Jan 2, 2024, 7:52:22 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="assets/css/adminDashboard.css">

    </head>
    <body>
        <!-- header -->
        <div class="header">
            <div class="header__logo">
                <img src="assets/image/logo.png" alt="">
                <span>Furnish</span>
            </div>
            <div class="header__nav">
                <ul class="header__icon">
                    <li>
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </li>
                    <li>
                        <i class="fa-regular fa-bell"></i>
                    </li>
                    <li>
                        <i class="fa-regular fa-envelope"></i>
                    </li>
                </ul>
                <div class="header__manager">
                    <div class="header__avatar">
                        <img src="assets/image/ava1.jpg" alt="">
                    </div>
                    <div class="header__info">
                        <div class="header__name">
                            ${sessionScope.account.fullname}
                        </div>
                        <span>Manager</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- End header -->

        <!-- main -->
        <div class="main">
            <div class="main__sidebar">
                <ul>
                    <li>
                        <a href="admin">
                            <span><i class='bx bx-home'></i></span>
                            <h3>Dashboard</h3>
                        </a>
                    </li>
                    <li>
                        <a href="listItemManager">
                            <span><i class='bx bx-shopping-bag'></i></span>
                            <h3>Product</h3>
                        </a>
                    </li>
                    <li>
                        <a href="categoryManager">
                            <span><i class='bx bx-category'></i></span>
                            <h3>Category</h3>
                        </a>
                    </li>
                    <li>
                        <a href="userManager">
                            <span><i class='bx bx-user'></i></span>
                            <h3>Account</h3>
                        </a>
                    </li>
                    <li>
                        <a href="orderManager">
                            <span><i class='bx bx-cart'></i></span>
                            <h3>Orders</h3>
                        </a>
                    </li>
                </ul>
                <div class="main__logout">
                    <a href="logout">
                        <span>
                            <i class="fa-solid fa-arrow-right-to-bracket"></i>
                        </span>
                        <h3>Logout</h3>
                    </a>
                </div>
            </div>
            <div class="main__right">
                <div class="main__team">
                    <div class="main__banner">
                        <div class="main__img">
                            <img src="assets/image/team.jpg" alt="">
                        </div>
                    </div>
                    <div class="main__content">
                        <div class="main__content-title">
                            Team 44 - Web Programming
                        </div>
                        <ul>
                            <li>
                                <i class='bx bx-user-circle'></i>
                                <span>Nguyen An Phat - B20DCPT151</span>
                            </li>
                            <li>
                                <i class='bx bx-user-circle'></i>
                                <span>Vu Xuan Manh - B20DCPT126</span>
                            </li>
                            <li>
                                <i class='bx bx-user-circle'></i>
                                <span>Nguyen Phu Quan - B20DCPT161</span>
                            </li>
                            <li>
                                <i class='bx bx-user-circle'></i>
                                <span>Le Quang Thai - B20DCPT191</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="main__slogan">
                    <h1>We Make Your Home Better</h1>
                    <p>
                        The perfect balance between inner guiding you while
                        still bring out your vision essence of you.
                    </p>
                    <span>
                        #From Furnish With Love
                    </span>
                </div>
            </div>
        </div>
        <!-- main -->
    </body>
</html>
