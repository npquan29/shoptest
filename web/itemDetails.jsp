<%-- 
    Document   : itemDetails
    Created on : Dec 28, 2023, 8:53:47 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/productDetails.css" />
        <link rel="stylesheet" href="assets/css/base.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <c:set var="it" value="${requestScope.item}" />

        <!-- banner -->
        <div class="banner">
            <div class="banner__main">
                <div class="banner__title">
                    Product Details
                </div>
                <ul class="banner__url">
                    <li>Home</li>
                    <li>
                        <i class="fa-solid fa-chevron-right"></i>
                    </li>
                    <li>
                        Shop
                    </li>
                    <li>
                        <i class="fa-solid fa-chevron-right"></i>
                    </li>
                    <li>
                        ${it.name}
                    </li>
                </ul>
            </div>
        </div>
        <!-- End banner -->

        <!-- product -->
        <div class="product">
            <div class="container">
                <div class="product__main">

                    <div class="product__left">
                        <img class="product__img" src="${it.image}" alt="">
                        <div class="product__images">
                            <img src="${it.image}" alt="">
                            <img src="${it.image}" alt="">
                            <img src="${it.image}" alt="">
                            <img src="${it.image}" alt="">
                        </div>
                    </div>

                    <div class="product__right">
                        <div class="product__title">
                            ${it.name}
                        </div>
                        <div class="product__price">
                            Price: ${it.sell}$
                        </div>
                        <div class="product__rating">
                            <c:forEach begin="1" end="${requestScope.stars}" >
                                <i class="fa-solid fa-star"></i>
                            </c:forEach>
                            <c:forEach begin="1" end="${5 - requestScope.stars}" >
                                <i class="fa-solid fa-star" style="color: #9F9F9F;"></i>
                            </c:forEach>
                        </div>
                        <div class="product__stock">
                            Stock : ${it.stock}
                        </div>
                        <div class="product__desc">
                            ${it.description}
                        </div>
                        <form id="f1" action="addCart" method="get">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="id" value="${it.id}">
                            <div>
                                <a class="minus">
                                    <i class="fa-solid fa-minus"></i>
                                </a>
                                <span class="number">1</span>
                                <input type="hidden" name="num">
                                <a class="plus" onclick="check(${inCart}, ${it.stock})">
                                    <i class="fa-solid fa-plus"></i>
                                </a>
                            </div>
                            <button type="button" onclick="checkAdd(${inCart}, ${it.stock})">Add to cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End product -->

        <!-- description -->
        <div class="description">
            <div class="container">
                <div class="description__title">
                    Description
                </div>
                <div class="description__desc">
                    ${it.description}
                    <br>
                    <br>
                    ${it.description}
                </div>
            </div>
        </div>
        <!-- End description -->

        <c:set var="list" value="${requestScope.listComment}" />
        <c:if test="${list.size() != 0}">
            <!-- comment -->
            <div class="comment">
                <div class="container">
                    <div class="comment__main">
                        <h3>Customer feedback</h3>
                        <ul class="comment__list">
                            <c:forEach var="cm" items="${list}">   
                                <li>
                                    <div class="comment__user">
                                        <div class="comment__info">
                                            <img src="${cm.user.image}" alt="">
                                            <span>${cm.user.fullname}</span>
                                        </div>
                                        <div class="comment__date">
                                            Create: ${cm.date}
                                        </div>
                                    </div>
                                    <div class="comment__rating">
                                        Rating: ${cm.rating} / 5
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="comment__desc">
                                        ${cm.content}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End comment -->
        </c:if>

        <jsp:include page="footer.jsp" />

        <!-- modal -->
        <div class="modal" id="modal">
            <h4 id="modalMessage"></h4>
        </div>
        <!-- End modal -->

        <script>
            var spanElement = document.querySelector('.number');
            var inputElement = document.querySelector('input[name="num"]');
            var minusButton = document.querySelector('.minus');
            var plusButton = document.querySelector('.plus');

            minusButton.addEventListener('click', function () {
                updateValue(-1);
            });

            function showModal(message) {
                var modal = document.getElementById("modal");
                var modalMessage = document.getElementById("modalMessage");

                modalMessage.innerText = message;
                modal.classList.add("show");

                setTimeout(function () {
                    closeModal();
                }, 1500);
            }

            function closeModal() {
                var modal = document.getElementById("modal");
                modal.classList.remove("show");
            }

            const updateValue = (change) => {
                var currentValue = parseInt(spanElement.textContent);

                // Cập nhật giá trị mới
                var newValue = currentValue + change;

                if (newValue < 1) {
                    showModal("Cannot be reduced anymore!");
                } else {
                    newValue = Math.max(newValue, 1);
                    spanElement.textContent = newValue;
                    inputElement.value = newValue;
                }
            };

            const check = (inCart, inStock) => {
                var currentValue = parseInt(spanElement.textContent);
                if (currentValue + inCart + 1 > inStock) {
                    showModal("Can't add more products!");
                } else {
                    spanElement.textContent = currentValue + 1;
                    inputElement.value = currentValue + 1;
                }
            };

            const checkAdd = (inCart, inStock) => {
                var currentValue = parseInt(spanElement.textContent);
                if (currentValue + inCart > inStock) {
                    showModal("Can't add more products!");
                } else {
                    document.getElementById('f1').submit();
                }
            };
        </script>
    </body>
</html>
