<%-- 
    Document   : viewOrder
    Created on : Jan 3, 2024, 10:29:00 AM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order Details</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="assets/css/adminDashboard.css">
        <link rel="stylesheet" href="assets/css/viewOrder.css">
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
                        <a href="admin.html">
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
            <div class="detail">
                <h1>Order Details</h1>
                <c:set var="c" value="${requestScope.order}" />
                <div class="detail__order">               
                    <div class="detail-group">
                        <span>Order ID</span>
                        <div>${c.id}</div>
                    </div>
                    <div class="detail-group">
                        <span>Username</span>
                        <div>${c.user.username}</div>
                    </div>
                    <div class="detail-group">
                        <span>Fullname</span>
                        <div>${c.user.fullname}</div>
                    </div>
                    <div class="detail-group">
                        <span>Receiver</span>
                        <div>${c.receiver}</div>
                    </div>
                    <div class="detail-group">
                        <span>Address</span>
                        <div>${c.address}</div>
                    </div>
                    <div class="detail-group">
                        <span>Phone</span>
                        <div>${c.phone}</div>
                    </div>
                    <div class="detail-group">
                        <span>Order Date</span>
                        <div>
                            <script>
                                var orderDateFromServer = "${c.orderDate}";
                                var parts = orderDateFromServer.split("-");
                                var formattedDate = parts[2] + "-" + parts[1] + "-" + parts[0];
                                document.write(formattedDate);
                            </script>
                        </div>
                    </div>
                    <div class="detail-group">
                        <span>Payment</span>
                        <c:if test="${order.payment == 1}">
                            <div>Payment on delivery</div>
                        </c:if>
                        <c:if test="${order.payment == 2}">
                            <div>Payment by card</div>
                        </c:if>
                    </div>
                    <div class="detail-group">
                        <span>Total</span>
                        <div>${c.total}$</div>
                    </div>
                    <div class="detail-group">
                        <span>Status</span>
                        <c:set var="st" value="${c.status}" />
                        <c:choose>
                            <c:when test = "${st == 1}">
                                <div>Processing</div>
                            </c:when>

                            <c:when test = "${st == 2}">
                                <div>Taking goods</div>
                            </c:when>

                            <c:when test = "${st == 3}">
                                <div>Delivering</div>
                            </c:when>

                            <c:otherwise>
                                <div>Completed</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="detail__list">
                        <span>Order List</span>
                        <div class="detail__table">
                            <table>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                </tr>
                                <c:forEach items="${requestScope.listIt}" var="list">
                                    <c:set var="it" value="${list.item}" />
                                    <tr>
                                        <td class="detail__product">
                                            <div>
                                                <img src="${it.image}" alt="">
                                                <span>${it.name}</span>
                                            </div>
                                        </td>
                                        <td class="detail__price">
                                            ${it.sell}$
                                        </td>
                                        <td class="detail__quantity">
                                            ${list.quantity}
                                        </td>
                                        <td class="detail__subtotal">
                                            ${it.sell * list.quantity}$
                                        </td>
                                    </tr>
                                </c:forEach>    
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End main -->

    </body>
</html>
