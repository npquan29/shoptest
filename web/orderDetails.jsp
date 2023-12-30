<%-- 
    Document   : orderDetails
    Created on : Dec 30, 2023, 3:23:11 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/orderDetails.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- details -->
        <div class="details">
            <div class="details__tab">
                <div class="details__menu">
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
                            <a href="logout">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>

            <c:set var="order" value="${requestScope.order}" />
            <div class="details__right">
                <h2>Order Details: #${order.id}</h2>
                <div class="details__order">
                    <div class="detail-group">
                        <span>Receiver</span>
                        <div>${order.receiver}</div>
                    </div>
                    <div class="detail-group">
                        <span>Address</span>
                        <div>${order.address}</div>
                    </div>
                    <div class="detail-group">
                        <span>Phone</span>
                        <div>${order.phone}</div>
                    </div>
                    <div class="detail-group">
                        <span>Order Date</span>
                        <div>${order.orderDate}</div>
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
                        <span>Ship cost</span>
                        <div>${order.costShip}$</div>
                    </div>
                    <div class="detail-group">
                        <span>Total</span>
                        <div>${order.total}$</div>
                    </div>
                    <div class="detail-group">
                        <span>Status</span>

                        <c:set var="st" value="${order.status}" />
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

                    <c:set var="list" value="${requestScope.listOrderIt}" />
                    <div class="details__list">
                        <span>Order Items</span>
                        <div class="details__table">
                            <table>
                                <tr>
                                    <th>STT</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                                <c:forEach var="i" begin="0" end="${list.size() - 1}">
                                    <c:set var="it" value="${list.get(i).getItem()}" />
                                    <tr>
                                        <td class="details__stt">${i + 1}</td>
                                        <td class="details__product">
                                            <div>
                                                <img src="${it.image}" alt="">
                                                <span>${it.name}</span>
                                            </div>
                                        </td>
                                        <td class="details__price">
                                            ${it.sell}$
                                        </td>
                                        <td class="details__quantity">
                                            ${list.get(i).quantity}
                                        </td>
                                        <td class="details__subtotal">
                                            ${it.sell * list.get(i).quantity}$
                                        </td>
                                        <td class="details__action">
                                            <a href="comment?id=${it.id}">
                                                Feedback
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End details -->
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
