<%-- 
    Document   : purchase
    Created on : Dec 30, 2023, 2:38:48 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/purchase.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- purchase -->
        <div class="purchase">
            <div class="purchase__tab">
                <div class="purchase__menu">
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
            <c:set var="list" value="${requestScope.listOrder}" />
            <div class="purchase__right">
                <h2>Purchase</h2>

                <c:if test="${list.size() == 0}">
                    <h3>You don't have any orders yet</h3>
                </c:if>

                <c:if test="${list.size() != 0}">
                    <div class="purchase__table">
                        <table>
                            <tr>
                                <th>STT</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                            <c:forEach var="i" begin="0" end="${list.size() - 1}" >
                                <tr>
                                    <td class="purchase__stt">
                                        ${i + 1}
                                    </td>
                                    <td class="purchase__date">
                                        ${list.get(i).getOrderDate()}
                                    </td>
                                    <td class="purchase__money">
                                        ${list.get(i).getTotal()}$
                                    </td>
                                    <td class="purchase__status">
                                        <c:set var="st" value="${list.get(i).getStatus()}" />
                                        <c:choose>
                                            <c:when test = "${st == 1}">
                                                Processing
                                            </c:when>

                                            <c:when test = "${st == 2}">
                                                Taking goods
                                            </c:when>

                                            <c:when test = "${st == 3}">
                                                Delivering
                                            </c:when>

                                            <c:otherwise>
                                                Completed
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="purchase__view">
                                        <a href="orderDetails?id=${list.get(i).getId()}">
                                            View Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
        <!-- End purchase -->
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
