<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/msg.jsp" %>
<%@include file="component/header.jsp" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.UserDao" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin panel</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/AddUpdateShow.css">

    </head>

    <body>

        <div class="container">
            <section class="shopping-cart" style="margin-top: 7.5rem;">
                <h1 class="heading">admin<span> panel</span></h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% UserDao userDao = new UserDao();
                           List<User> userList = userDao.getAllUsers();
                           int count = 1;
                           for (User user : userList) { %>
                        <tr>
                            <td><%= count %></td>

                            <td><%= user.getName() %></td>
                            <td><%= user.getUsername() %></td>
                            <td><%= user.getEmail() %></td>
                            <td>
                                <a href="#" class="delete-btn" onclick="deleteUser('<%= user.getId() %>');">
                                    <i class="fas fa-trash"></i> delete
                                </a>

                                <form id="deleteForm" action="DeleteUserServlet" method="POST" style="display: none;">
                                    <input type="hidden" name="delete" id="userId">
                                </form>

                                <script>
                                    function deleteUser(userId) {
                                        if (confirm('Are you sure you want to delete this?')) {
                                            document.getElementById('userId').value = userId;
                                            document.getElementById('deleteForm').submit();
                                        }
                                    }
                                </script>
                            </td>

                        </tr>
                        <% count++; %>
                        <% } %>
                        <% if (userList.isEmpty()) { %>
                        <tr>
                            <td colspan="5">No records found</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div class="checkout-btn">

                </div>
            </section>
        </div>

        <!-- Footer  -->
        <%@include file="component/footer.html" %>

    </body>
</html>
