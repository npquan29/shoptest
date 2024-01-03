<%-- 
    Document   : manageOrders
    Created on : Jan 3, 2024, 9:39:37 AM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="assets/css/adminDashboard.css">
        <link rel="stylesheet" href="assets/css/manageOrders.css">

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
            <div class="orders">
                <h1>Manage Orders</h1>
                <form class="orders__form" action="">
                    <div class="orders__function">
                        <div class="orders__search">
                            <input type="text" name="username" placeholder="Search by username..." id="orderSearchInput" oninput="searchOrder()">
                            <!--                            <a href="#">
                                                            <i class="fa-solid fa-magnifying-glass"></i>
                                                        </a>-->
                        </div>
                        <div class="orders__filter">
                            <div class="orders__sort">
                                <span>Sort By</span>
                                <select name="sortType" id="sort">
                                    <option value="0">Default</option>
                                    <option value="1">Total: Low to High</option>
                                    <option value="2">Total: High to Low</option>
                                    <option value="3">Date: Outdated to Latest</option>
                                    <option value="4">Date: Latest to Outdated</option>
                                </select>
                            </div>
                            <div class="orders__status">
                                <span>Status</span>
                                <select name="status" id="status">
                                    <option value="All">All</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Taking goods">Taking goods</option>
                                    <option value="Delivering">Delivering</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="orders__table">
                        <table>
                            <tr>
                                <th>Order ID</th>
                                <th>Username</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach items="${requestScope.data}" var="c">
                                <tr>
                                    <td class="orders__id">${c.id}</td>
                                    <td class="orders__name">${c.user.username}</td>
                                    <td class="orders__date">
                                        <script>
                                            var orderDateFromServer = "${c.orderDate}";
                                            var parts = orderDateFromServer.split("-");
                                            var formattedDate = parts[2] + "-" + parts[1] + "-" + parts[0];
                                            document.write(formattedDate);
                                        </script>
                                    </td>
                                    <td class="orders__total">${c.total}$</td>
                                    <td class="orders__status">
                                        <c:set var="st" value="${c.status}" />
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
                                    <td class="orders__action">
                                        <ul>
                                            <li>
                                                <a href="viewOrder?orderID=${c.id}">
                                                    <i class="fa-regular fa-eye"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="updateOrder?orderID=${c.id}">
                                                    <i class="fa-solid fa-pencil"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <!-- End main -->

        <script>
            function searchOrder() {
                var searchInput = document.getElementById('orderSearchInput').value.toLowerCase();

                var rows = document.querySelectorAll('.orders__table table tr');
                for (var i = 1; i < rows.length; i++) {
                    var userName = rows[i].querySelector('.orders__name').innerText.toLowerCase();
                    if (userName.includes(searchInput)) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            }

            function filterOrders() {
                var selectedStatus = document.getElementById('status').value;

                var rows = document.querySelectorAll('.orders__table table tr');
                for (var i = 1; i < rows.length; i++) {
                    var orderStatus = rows[i].querySelector('.orders__status').innerText.trim();

                    if (selectedStatus === 'All' || orderStatus === selectedStatus) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            }

            var statusDropdown = document.getElementById('status');
            if (statusDropdown) {
                statusDropdown.addEventListener('change', filterOrders);
            }

            function sortOrders() {
                var sortBy = document.getElementById('sort').value;
                var rows = document.querySelectorAll('.orders__table table tr');

                var rowsArray = Array.from(rows).slice(1);

                if (sortBy !== '0') {
                    switch (sortBy) {
                        case '1':
                            rowsArray.sort((a, b) => {
                                return parseFloat(a.querySelector('.orders__total').innerText) - parseFloat(b.querySelector('.orders__total').innerText);
                            });
                            break;
                        case '2':
                            rowsArray.sort((a, b) => {
                                return parseFloat(b.querySelector('.orders__total').innerText) - parseFloat(a.querySelector('.orders__total').innerText);
                            });
                            break;
                        case '3':
                            rowsArray.sort((a, b) => {
                                return new Date(a.querySelector('.orders__date').innerText) - new Date(b.querySelector('.orders__date').innerText);
                            });
                            break;
                        case '4':
                            rowsArray.sort((a, b) => {
                                return new Date(b.querySelector('.orders__date').innerText) - new Date(a.querySelector('.orders__date').innerText);
                            });
                            break;
                        default:
                            break;
                    }
                    var table = document.querySelector('.orders__table table');
                    rowsArray.forEach(row => table.appendChild(row));
                }
                else{
                    window.location.href = "orderManager";
                }
            }

            var sortDropdown = document.getElementById('sort');
            if (sortDropdown) {
                sortDropdown.addEventListener('change', sortOrders);
            }

        </script>

    </body>
</html>
