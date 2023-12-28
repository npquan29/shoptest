<%-- 
    Document   : home
    Created on : Nov 17, 2023, 8:21:08 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
            integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="assets/css/base.css"/>
        <link rel="stylesheet" href="assets/css/home.css" />

    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- banner -->
        <div class="banner">
            <img src="assets/image/banner.png" alt="banner" />
            <div class="banner__main">
                <div class="banner__subtitle">New Arrival</div>
                <div class="banner__title">
                    Discover Our
                    <br />
                    New Collection
                </div>
                <div class="banner__desc">
                    Make the most or compact soacos with space saving furniture that are ingenuous innovative
                </div>
                <a href="products" class="banner__button"> Buy now </a>
            </div>
        </div>
        <!-- End banner -->

        <!-- browse -->
        <div class="browse">
            <div class="container">
                <div class="browse__head">
                    <div class="browse__title">Browse The Range</div>
                    <div class="browse__desc">
                        Make these unique tastes of yours a design reality!
                    </div>
                </div>
                <div class="browse__main">
                    <div class="browse__item">
                        <div class="browse__image">
                            <img src="assets/image/browse1.png" alt="" />
                        </div>
                        <div class="browse__item-title">Dining</div>
                    </div>
                    <div class="browse__item">
                        <div class="browse__image">
                            <img src="assets/image/browse2.png" alt="" />
                        </div>
                        <div class="browse__item-title">Living</div>
                    </div>
                    <div class="browse__item">
                        <div class="browse__image">
                            <img src="assets/image/browse3.png" alt="" />
                        </div>
                        <div class="browse__item-title">Bedroom</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End browse -->

        <!-- product -->
        <div class="product">
            <div class="container">
                <div class="product__head">
                    <div class="product__head-title">Our Products</div>
                </div>
                <div class="product__main">
                    <c:forEach var="it" items="${requestScope.listHome}">
                        <div class="product__item">
                            <div class="product__image">
                                <img src="${it.image}" alt="" />
                            </div>
                            <div class="product__info">
                                <div class="product__title">${it.name}</div>
                                <div class="product__details">
                                    <div class="product__price">${it.sell}$</div>
                                    <div class="product__stock">Stock: ${it.stock}</div>
                                </div>
                                <a href="products" class="product__btn"> Shop Now </a>
                            </div>
                            <div class="product__tag">New</div>
                        </div>
                    </c:forEach>
                </div>
                <div class="product__btn-more">
                    <a href="products"> Show More </a>
                </div>
            </div>
        </div>
        <!-- End product -->

        <!-- inspiration -->
        <div class="inspiration">
            <div class="container">
                <div class="inspiration__main">
                    <div class="inspiration__content">
                        <div class="inspiration__title">
                            50+ Beautiful rooms inspiration
                        </div>
                        <div class="inspiration__desc">
                            Our designer already made a lot of beautiful prototipe of rooms
                            that inspire you
                        </div>
                    </div>
                    <div class="inspiration__illus">
                        <div class="inspiration__image">
                            <img src="assets/image/bedroom.jpg" alt="" />
                        </div>
                        <div class="inspiration__image">
                            <img src="assets/image/illus1.jpg" alt="" />
                        </div>
                        <div class="inspiration__image">
                            <img src="assets/image/illus2.jpg" alt="" />
                        </div>
                        <div class="inspiration__image">
                            <img src="assets/image/illus3.jpg" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End inspiration -->

        <jsp:include page="footer.jsp" />
    </body>
</html>
