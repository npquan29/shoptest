<%-- 
    Document   : changePass
    Created on : Nov 18, 2023, 11:55:02 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/changePass.css">
        
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- change-pass -->
        <div class="change">
            <div class="change__tab">
                <div class="change__menu">
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
            <div class="change__right">
                <h2>Change Password</h2>
                <form id="changeForm" action="changePass" method="post" class="change__main" 
                      onsubmit="validatePass(event)"
                      >
                    
                    <c:if test="${er != null}">
                        <div class="error-changepass">${er}</div>
                    </c:if>
                    
                    <input type="hidden" name="username" value="${sessionScope.account.username}"/>
                    <div class="form-group">
                        <label for="old">Old Password:</label>
                        <input type="password" id="old" name="oldPass" >
                    </div>
                    <div class="form-group">
                        <label for="new">New Password:</label>
                        <input type="password" id="new" name="newPass">
                    </div>
                    <div class="form-group">
                        <label for="confirm">Confirm Password:</label>
                        <input type="password" id="confirm" name="confirmPass" >
                    </div>

                    <button type="submit">Change Password</button>
                </form>
            </div>
        </div>
        <!-- End change-pass -->

        <jsp:include page="footer.jsp" />
        
        <!-- modal -->
        <div class="modal" id="modal">
            <h4 id="modalMessage"></h4>
        </div>
        <!-- End modal -->

        <script>
            const validatePass = (e) => {
                e.preventDefault();
                var oldPass = document.getElementById("old").value;
                var newPass = document.getElementById("new").value;
                var confirmPass = document.getElementById("confirm").value;
                var formChange = document.getElementById("changeForm");
                var check = true;

                if(oldPass === ""){
                    showModal("Please fill out old password!");
                    check = false;
                }
                else if(newPass === ""){
                    showModal("Please fill out new password!");
                    check = false;
                }
                else if(confirmPass === ""){
                    showModal("Please fill out confirm password!");
                    check = false;
                }
                else if(newPass !== confirmPass){
                    showModal("Confirm Password does not match");
                    check = false;
                }

                if(check){
                    formChange.submit();
                }
            };
            
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
        </script>
    </body>
</html>
