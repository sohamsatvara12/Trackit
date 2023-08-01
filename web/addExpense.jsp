<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.CategoryDao" %>
<%@ page import="com.entity.Category" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Section</title>

        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/addexpense.css"/>

        <style>
            .form-container {
                background-color: white;
                width: 400px;
                height: 420px;
                position: relative;
                text-align: center;
                padding: 20px 0;
                margin: auto;
                box-shadow: 0 0 20px 0px rgba(0, 0, 0, .5);
                overflow: hidden;
                margin-top: 2rem;
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
                padding: 0 10x;
                border: 1px solid #ccc;
            }

            #expense {
                left: -400px;
            }

            #income {
                right:105px;
            }

            #indicator {
                width: 100px;
                border: none;
                background:var(--orange);
                height: 3px;
                margin-top: 8px;
                transform: translateX(100px);
                transition: transform 1s;
            }
            form .btn:focus {
                outline: none;
            }

            .form-container .add-product-form{

                padding:2rem;
                margin:0 auto;
                margin-top: -8rem;
                background-color: white;
                box-shadow: none;
            }

            .form-container .add-product-form h3{
                font-size: 2.5rem;
                margin-bottom: 1rem;
                color:black;
                text-transform: uppercase;
                text-align: center;
            }

            #income .box{
                text-transform: none;
                padding:1.2rem 1.4rem;
                font-size: 1.7rem;
                color:var(--black);
                border-radius: .5rem;
                /*background-color: var(--white);*/
                margin:1rem 0;
                width: 140%;
            }

            #expense .box{
                text-transform: none;
                padding:1.2rem 1.4rem;
                font-size: 1.7rem;
                color:var(--black);
                border-radius: .5rem;
                /*background-color: var(--white);*/
                margin:1rem 0;
                width: 135%;
            }

            #income .btn{
                width: 140%;
            }

            #expense .btn{
                width: 135%;
            }

            #btn1{
                background-color: #DA70D6;
                border: 0px;
            }

            #btn2{
                background-color: #DA70D6;
                border: 0px;
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

        <h1 class="heading" style="margin-top:9.5rem;">Add<span>Transaction</span></h1>

        <section style=" margin-top: -7rem;">
            <div class="form-container">
                <div class="form-btn">
                    <span onclick="expense()">Expense</span>
                    <span onclick="income()">Income</span>
                    <hr id="indicator">
                </div>

                <form action="AddExpenseServlet" method="POST" id="expense" class="add-product-form">

                    <input type="hidden" name="category" value="expense">
                    <select name="subcategory" class="box" required style="border:.5px solid #ccc;color: rgb(128, 128, 128);">
                        <option value="" selected disabled>select a category</option>
                        <% CategoryDao categoryDao = new CategoryDao();
                           List<Category> categoryList = categoryDao.getExpenseCategories();
                           for (Category category : categoryList) { %>
                        <option value="<%= category.getSubtype() %>"><%= category.getSubtype() %></option>
                        <% } %>
                    </select>
                    <input type="text" name="description" placeholder="enter the Expense Description(Optional)" class="box"  style="border:.5px solid #ccc;color: rgb(128, 128, 128);">
                    <input type="date" name="date" id="date" class="box" required style="color: rgb(128, 128, 128);">
                    <input type="time" name="time" id="time" class="box"  style="color: rgb(128, 128, 128);">
                    <input type="number" name="amount" id="amount" min="0" step="0.01" class="box" placeholder="enter the expense value" required>
                    <input type="submit" name="add_product" value="Add Expense" class="btn" id="btn1">
                </form>

                <form action="AddExpenseServlet" method="POST" id="income" class="add-product-form" >
                    <input type="hidden" name="category" value="income">
                    <select name="subcategory" class="box" required style="border:.5px solid #ccc;color: rgb(128, 128, 128);">
                        <option value="" selected disabled>select a category</option>
                        <% 
                           List<Category> categoryList2 = categoryDao.getIncomeCategories();
                           for (Category category : categoryList2) { %>
                        <option value="<%= category.getSubtype() %>"><%= category.getSubtype() %></option>
                        <% } %>
                    </select>

                    <input type="text" name="description" placeholder="enter the Income Description(Optional)" class="box"  style="border:.5px solid #ccc;">
                    <input type="date" name="date" id="date" class="box" required style="color: rgb(128, 128, 128);">
                    <input type="time" name="time" id="time" class="box"   style="color: rgb(128, 128, 128);">
                    <input type="number" name="amount" id="amount" min="0" step="0.01" class="box" placeholder="enter the Income value" required>
                    <input type="submit" name="add_product" value="Add Income" class="btn" id="btn2">


                </form>
            </div>
        </section>


        <script>
            var Expense = document.getElementById("expense");
            var Income = document.getElementById("income");
            var Indicator = document.getElementById("indicator");

            function expense() {
                Expense.style.transform = "translateX(400px)";
                Income.style.transform = "translateX(500px)";
                Indicator.style.transform = "translateX(0px)";

            }
            function income() {
                Expense.style.transform = "translateX(-20px)";
                Income.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(100px)";
            }
        </script>

        <%@include file="component/footer.html" %>
    </body>
</html>


