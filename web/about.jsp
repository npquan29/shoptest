<%-- 
    Document   : about
    Created on : Nov 20, 2023, 10:00:32 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/about.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- banner -->
        <div class="banner">
            <div class="banner__main">
                <div class="banner__title">
                    About
                </div>
                <ul class="banner__url">
                    <li>Home</li>
                    <li>
                        <i class="fa-solid fa-chevron-right"></i>
                    </li>
                    <li>
                        About
                    </li>
                </ul>
            </div>
        </div>
        <!-- End banner -->

        <!-- content -->
        <div class="content">
            <div class="container">
                <div class="content__box">
                    <div class="content__left">
                        <div class="content__image">
                            <img src="assets/image/contentimage.jfif" alt="">
                        </div>
                    </div>
                    <div class="content__right">
                        <div class="content__right-title">Team 44 - Web Programming</div>
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
                        <a href="contact" class="content__btn">
                            Contact Us
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End content -->
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
