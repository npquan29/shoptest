<%-- 
    Document   : comment
    Created on : Dec 31, 2023, 1:39:51 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/comment.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <c:set var="it" value="${requestScope.item}" />
        <!-- product -->
        <div class="product">
            <div class="container">
                <h1 class="title__header">
                    Please leave positive feedback for us
                    <i class="fa-solid fa-heart"></i>
                </h1>
                
                <div class="product__detail">
                    <div class="product__left">
                        <img class="product__img" src="${it.image}" alt="">
                    </div>

                    <div class="product__right">
                        <div class="product__title">
                            ${it.name}
                        </div>
                        <div class="product__price">
                            Price: ${it.sell}$
                        </div>
                        <div class="product__rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <div class="product__stock">
                            Stock : ${it.stock}
                        </div>
                        <div class="product__desc">
                            ${it.description}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End product -->

        <!-- comment -->
        <div class="comment">
            <div class="container">
                <h3>Comment</h3>
                <form id="f1" action="comment" method="post" class="comment__box">
                    <input type="hidden" name="id" value="${it.id}" />
                    <textarea id="comment" name="comment" placeholder="Leave a comment..."></textarea>
                    <div>Rating</div>
                    <select name="rating">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5" selected>5</option>
                    </select>
                    <h4>/ 5 <i class="fa-solid fa-star"></i></h4>
                    <button type="button" onclick="check()">Send</button>
                </form>
            </div>
        </div>
        <!-- End comment -->

        <!-- modal -->
        <div class="modal" id="modal">
            <h4 id="modalMessage"></h4>
        </div>
        <!-- End modal -->

        <jsp:include page="footer.jsp" />

        <script>
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

            const check = () => {
                const textInput = document.getElementById('comment').value;
                if (textInput === "") {
                    showModal("Please fill out comment box!");
                } else {
                    document.getElementById('f1').submit();
                }
            };
        </script>
    </body>
</html>
