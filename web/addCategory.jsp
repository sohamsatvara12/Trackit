<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.CategoryDao" %>
<%@ page import="com.entity.Category" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Section</title>

        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/AddUpdateShow.css"/>

        <style>

            .display-product-table table thead th{
                background-color:#800080;
                ;
            }
            .form-container {
                background-color:white;
                width: 300px;
                height: 200px;
                position: relative;
                text-align: center;
                padding: 20px 0;
                margin: auto;
                box-shadow: 0 0 20px 0px rgba(0, 0, 0, .5);
                overflow: hidden;
                margin-top: 5rem;
                border-radius:2.5rem;
            }

            .form-container span {
                font-size: 2rem;
                font-weight: bold;
                padding: 0 10px;
                color: #555;
                cursor: pointer;
                width: 100px;
                display: inline-block;
            }

            .form-btn {
                display: inline-block;
            }

            .form-container form {
                max-width: 300px;
                padding: 0 20px;
                position: absolute;
                top: 130px;
                transition: transform 1s;
            }

            form{
                margin-top: -7rem;
            }
            form input {
                width: 100%;
                height: 36px;
                margin: 10px 0;
                padding: 0 10px;
                border: 1px solid #ccc;
                border-radius: 1rem;
            }

            form .btn {
                background-color: #800080;
                color:white;
                width: 100%;
                border: none;
                cursor: pointer;
                margin: 10px 0;
            }

            form .btn:focus {
                outline: none;
            }

            #expense {
                left: -300px;
            }

            #income {
                left: 0;
            }

            #indicator {
                width: 100px;
                border: none;
                background: #800080;
                height: 3px;
                margin-top: 8px;
                transform: translateX(100px);
                transition: transform 1s;
            }

            #btn1{
                background-color: #DA70D6;
            }

            #btn2{
                background-color: #DA70D6;
            }

            #btn1:hover{
                background-color:#800080;
            }

            #btn2:hover{
                background-color: #800080;
            }

        </style>
    </head>
    <body>
        <%@include file="component/msg.jsp" %>
        <%@include file="component/header.jsp" %>

        <h1 class="heading" style="margin-top:9.5rem;">Add<span>Category</span></h1>

        <section style=" margin-top: -7rem;">
            <div class="form-container">
                <div class="form-btn">
                    <span onclick="expense()">Expense</span>
                    <span onclick="income()">Income</span>
                    <hr id="indicator">
                </div>

                <form action="AddCategoryServlet" method="POST" id="expense">
                    <input type="text" placeholder="Expense Category" name="subcategory">
                    <input type="hidden" name="category" value="expense">
                    <input type="submit" name="add_category" value="Add Category" class="btn" id="btn1" >
                </form>

                <form action="AddCategoryServlet" method="POST" id="income">
                    <input type="text" placeholder="Income Category" name="subcategory">
                    <input type="hidden" name="category" value="income">
                    <input type="submit" name="add_category" value="Add Category" class="btn" id="btn2">
                </form>
            </div>
        </section>

        <script>
            var Expense = document.getElementById("expense");
            var Income = document.getElementById("income");
            var Indicator = document.getElementById("indicator");

            function expense() {
                Expense.style.transform = "translateX(300px)";
                Income.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(0px)";

            }
            function income() {
                Expense.style.transform = "translateX(0px)";
                Income.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(100px)";
            }
        </script>


        <section class="display-product-table">
            <table style="margin:auto;">
                <thead>
                <th>Id</th>
                <th>Category</th>
                <th>Sub-Category</th>
                <th>Action</th>
                </thead>
                <tbody>
                    <% CategoryDao categoryDao = new CategoryDao();
                       List<Category> categoryList = categoryDao.getAllCategories();
                        int count = 1;
                       for (Category category : categoryList) { %>
                    <tr>
                        <td><%= count %></td>
                        <td><%= category.getSubtype() %></td>
                        <td><%= category.getType() %></td>

                        <td>
                            <a href="#" class="delete-btn" onclick="deleteCategory('<%= category.getId() %>');">
                                <i class="fas fa-trash"></i> delete
                            </a>

                            <form id="deleteForm" action="DeleteCategoryServlet" method="POST" style="display: none;">
                                <input type="hidden" name="delete" id="categoryId">
                            </form>

                            <script>
                                function deleteCategory(categoryId) {
                                    if (confirm('Are you sure you want to delete this?')) {
                                        document.getElementById('categoryId').value = categoryId;
                                        document.getElementById('deleteForm').submit();
                                    }
                                }
                            </script>

                        </td>
                    </tr>
                    <% count++; %>
                    <% } %>
                </tbody>
            </table>
        </section>

        <%@include file="component/footer.html" %>
    </body>
</html>
