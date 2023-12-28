/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener("DOMContentLoaded", function () {
    var icon = document.querySelector(".user__dropdown");
    var menu = document.querySelector(".menu__dropdown");

    if (icon !== null) {
        icon.addEventListener("click", () => {
            menu.classList.toggle("active");
        });
    }
});
