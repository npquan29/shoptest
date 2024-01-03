<%-- 
    Document   : reportDetails
    Created on : Jan 3, 2024, 6:14:51 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="assets/css/adminDashboard.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>Admin</title>
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
                            <span><i class="bx bx-home"></i></span>
                            <h3>Dashboard</h3>
                        </a>
                    </li>
                    <li>
                        <a href="listItemManager">
                            <span><i class="bx bx-shopping-bag"></i></span>
                            <h3>Product</h3>
                        </a>
                    </li>
                    <li>
                        <a href="categoryManager">
                            <span><i class="bx bx-category"></i></span>
                            <h3>Category</h3>
                        </a>
                    </li>
                    <li>
                        <a href="userManager">
                            <span><i class="bx bx-user"></i></span>
                            <h3>Account</h3>
                        </a>
                    </li>
                    <li>
                        <a href="orderManager">
                            <span><i class="bx bx-cart"></i></span>
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
                <div class="select__month">
                    <label for="monthSelector">Select Month:</label>
                    <select id="monthSelector">
                        <option value="1">January</option>
                        <option value="2">February</option>
                        <option value="3">March</option>
                        <option value="4">April</option>
                        <option value="5">May</option>
                        <option value="6">June</option>
                        <option value="7">July</option>
                        <option value="8">August</option>
                        <option value="9">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                    </select>
                </div>
                <div class="main__box">
                    <div class="box__item">
                        <h4>Profit</h4>
                        <h3>40$</h3>
                    </div>

                    <div class="box__item">
                        <h4>Month revenue</h4>
                        <h3>40$</h3>
                    </div>

                    <div class="box__item">
                        <h4>Total items sold</h4>
                        <h3>40</h3>
                    </div>
                </div>

                <div class="canvas">
                    <h4>Revenue chart by day</h4>

                    <canvas id="myChart" style="max-height: 300px; width: 100%"></canvas>
                </div>
            </div>
        </div>
    </div>
    <!-- main -->
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var myChart;
            // Lắng nghe sự kiện thay đổi của dropdown
            $('#monthSelector').change(function () {
                var selectedMonth = $(this).val();
                console.log(selectedMonth);

                if (myChart) {
                    myChart.destroy();
                }

                // Gửi yêu cầu đến servlet với tháng đã chọn
                fetchData(selectedMonth);
            });

            // Hàm để fetch dữ liệu từ servlet
            function fetchData(selectedMonth) {
                $.ajax({
                    type: "GET",
                    url: "report",
                    data: {month: selectedMonth},
                    contentType: "application/json",
                    success: function (data) {
                        // Xử lý dữ liệu và vẽ biểu đồ
                        handleData(data);
                    },
                    error: function (error) {
                        console.error('Error:', error);
                    }
                });
            }

            // Hàm để xử lý dữ liệu và vẽ biểu đồ
            function handleData(data) {
                const days = data.chartData.map((item) => item.day);
                const totals = data.chartData.map((item) => item.total);
                const revenue = [
                    data.totalProfit,
                    data.monthTotal,
                    data.totalItemSold
                ];

                const h3Data = document.querySelectorAll(".main__box .box__item h3");
                h3Data.forEach((element, index) => {
                    if (revenue[index] > 0) {
                        element.innerHTML = revenue[index];
                    } else {
                        element.innerHTML = 0;
                    }
                });

                var ctx = document.getElementById('myChart').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: days,
                        datasets: [{
                                label: 'Daily Revenue',
                                data: totals,
                                fill: true,
                                borderColor: "#b88e2f",
                                borderWidth: 2
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }

            // Mặc định fetch dữ liệu cho tháng đầu tiên khi trang được tải
            fetchData($('#monthSelector').val());
        });

    </script>

</body>
</html>
