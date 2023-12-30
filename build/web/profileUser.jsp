<%-- 
    Document   : profileUser
    Created on : Dec 27, 2023, 8:12:04 PM
    Author     : lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/base.css" />
        <link rel="stylesheet" href="assets/css/profileUser.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- profile -->
        <div class="profile">
            <div class="profile__tab">
                <div class="profile__menu">
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
            <div class="profile__right">
                <h2>My profile</h2>
                <c:set var="u" value="${sessionScope.account}" />
                <form action="profileUser" method="post" class="profile__main" id="profileForm">
                    <div class="box">
                        <div class="box__info">
                            <h3 class="profile__title">Username</h3>
                            <div class="profile__username" disabled>${u.username}</div>
                            <h3 class="profile__title">Full name</h3>
                            <input class="profile__desc" disabled name="fullname" value="${u.fullname}" />
                            <h3 class="profile__title">Email</h3>
                            <input class="profile__desc" disabled name="email" value="${u.email}" />
                            <h3 class="profile__title">Address</h3>
                            <input class="profile__desc" disabled name="address" value="${u.address}" />
                            <h3 class="profile__title">Phone</h3>
                            <input class="profile__desc" disabled name="phone" value="${u.phone}" />
                        </div>
                        <div class="box__avatar">
                            <h3>Avatar</h3>
                            <input type="hidden" id="src" name="image" value="${u.image}">
                            <img id="preview" src="${u.image}">
                            <input style="display: none;" id="file-upload" name="myFile" type="file" accept="image/*" onchange="fileChange()">
                            <button disabled type="button" id="click" onclick="activateFile()">Upload Image</button>
                        </div>
                    </div>

                    <div class="profile__btn">
                        <button id="edit" type="button" onclick="toggleEdit()">Edit</button>
                        <ul>
                            <li>
                                <button id="cancel" type="button" onclick="cancelEdit()" style="display: none">
                                    Cancel
                                </button>
                            </li>
                            <li>
                                <button id="save" type="submit" style="display: none">
                                    Save
                                </button>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
        <!-- End profile -->

        <jsp:include page="footer.jsp" />

        <script>
            const toggleEdit = () => {
                var form = document.getElementById("profileForm");
                var inputs = form.querySelectorAll(".profile__desc");
                var editButton = document.getElementById("edit");
                var cancelButton = document.getElementById("cancel");
                var saveButton = document.getElementById("save");
                var uploadButton = document.getElementById("click");

                inputs.forEach((input) => {
                    input.disabled = false;
                });
                uploadButton.disabled = false;

                editButton.style.display = "none";

                cancelButton.style.display = "inline-block";
                saveButton.style.display = "inline-block";
            };

            const cancelEdit = () => {
                var form = document.getElementById("profileForm");
                var inputs = form.querySelectorAll(".profile__desc");
                var editButton = document.getElementById("edit");
                var cancelButton = document.getElementById("cancel");
                var saveButton = document.getElementById("save");
                var uploadButton = document.getElementById("click");

                inputs.forEach((input) => {
                    input.disabled = true;
                });
                uploadButton.disabled = true;

                editButton.style.display = "inline-block";

                cancelButton.style.display = "none";
                saveButton.style.display = "none";
            };

            const activateFile = () => {
                document.getElementById("file-upload").click();
            };

            function fileChange() {
                var fileInput = document.getElementById('file-upload');
                var file = fileInput.files[0];
                if (file) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var imageData = e.target.result;
                        document.getElementById('preview').src = imageData;
                        document.getElementById('src').value = imageData;
                    };
                    reader.readAsDataURL(file);
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                // Đăng ký hàm toggleEdit và cancelEdit cho sự kiện click
                document
                        .getElementById("edit")
                        .addEventListener("click", toggleEdit);
                document
                        .getElementById("cancel")
                        .addEventListener("click", cancelEdit);
            });
        </script>
    </body>
</html>
