<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link rel="stylesheet" href="component/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>

        <header class="header">
            <a href="index.jsp" class="logo" style="text-transform: none;">Track.it</a>

            <nav class="navbar">
                <a href="index.jsp">home</a>
                <a href="addCategory.jsp">Categories</a>
                <a href="addExpense.jsp">Transactions</a>

                <div class="dropdown">
                    <a href="#" style="padding-bottom: 3rem;">Reports</a>
                    <div class="dropdown-content">
                        <a href="income.jsp">Income Report</a>
                        <a href="expense.jsp">Expense Report</a>
                    </div>
                </div>
                <a href="team.jsp">about us</a>
                <%
               String loggedInUserRole = (String) session.getAttribute("LoggedInUserRole");
               if (loggedInUserRole != null && loggedInUserRole.equals("admin")) {
                %>
                <a href="admin.jsp">Admin Panel</a>
                <%
                }
                %>

            </nav>

            <div class="icons">
                <div class="fas fa-bars" id="menu-btn"></div>
                <script>
                    let navbar = document.querySelector('.navbar');

                    document.querySelector('#menu-btn').onclick = () => {
                        navbar.classList.toggle('active');
                        searchForm.classList.remove('active');
                        shoppingCart.classList.remove('active');
                        loginForm.classList.remove('active');
                        accountPage.classList.remove('active');
                    }
                </script>


                <c:if test="${not empty loggedInUser}">


                    <div class="fas fa-user" id="account-info-btn" style="padding-left: 1.5rem;"> <a href="signin.php"></a></div>

                    <!-- Signout  -->

                    <div class="fas fa-sign-out-alt" id="logout-btn" style="padding-left: 1rem;"> <a href="logoutout.jsp"></a></div>

                    <form id="logout-form" action="LogOutServlet" method="Get" style="display:none;">
                        <button type="submit" name="logout">Logout</button>
                    </form>


                    <script>
                        var logoutBtn = document.getElementById("logout-btn");
                        logoutBtn.addEventListener("click", function () {
                            var logoutForm = document.getElementById("logout-form");
                            logoutForm.querySelector("button[type='submit']").click();
                        });
                    </script>


                </c:if>

                <c:if test="${ empty loggedInUser}">

                    <div class="fas fa-sign-in-alt" id="login-btn" style="padding-left: 1rem;"> <a href="login.jsp"></a></div>
                    <script>
                        var loginBtn = document.getElementById("login-btn");
                        loginBtn.addEventListener("click", function () {
                            window.location.href = "login.jsp";
                        });
                    </script>
                </c:if>
            </div>

            <!-- Login First -->
            <div class="shopping-cart">
                <a href="login.jsp" class="btn">Login First</a>
            </div>


        </header>


    </body>
</html>
