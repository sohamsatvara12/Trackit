<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="com.dao.CategoryDao" %>
<%@ page import="com.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Expense" %>
<%@ page import="com.dao.ExpenseDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="com.entity.User" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expense Report</title>

        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/AddUpdateShow.css"/>

        <style>
            .display-product-table table thead th{
                background-color:#800080;
                ;
            }
            #btn2:hover{
                background-color: #800080;
            }
        </style>
    </head>
    <body>
        <%@include file="component/msg.jsp" %>
        <%@include file="component/header.jsp" %>

        <h1 class="heading" style="margin-top:9.5rem;">View<span>Expense Report</span></h1>
        <section style="margin-top: -7rem;">

            <form action="ViewExpenseServlet" method="POST" id="expense" class="add-product-form">
                <div style="display: flex;">
                    <div style="margin-right: 1rem;">
                        <label for="from_date" style="font-size:2rem;margin-left:.5rem;">From Date:</label>
                        <input type="date" name="from_date" id="from_date" class="box" required style="color: rgb(128, 128, 128);">
                    </div>
                    <div>
                        <label for="to_date" style="font-size:2rem;margin-left:.5rem;">To Date:</label>
                        <input type="date" name="to_date" id="to_date" class="box" required style="color: rgb(128, 128, 128);">
                    </div>
                </div>
                <input type="hidden" name="username" value="${loggedInUser.username}">
                <input type="hidden" name="category" value="expense">
                <input type="submit" name="add_product" value="View Expense" class="btn" id="btn2" style="border: none;">
            </form>
        </section>

        <section class="display-product-table">
            <table style="margin:auto;">
                <thead>
                <th>Id</th>
                <th>Category</th>
                <th>Description</th>
                <th>Date</th>
                <th>Time</th>
                <th>Amount</th>
                <th>Edit</th>
                <th>Delete</th>
                </thead>
                <tbody>

                    <%
                        ExpenseDao expenseDao = new ExpenseDao();
                        String fromDate = request.getParameter("from_date");
                        String toDate = request.getParameter("to_date");
                         String category = request.getParameter("category");

                        User loggedInUser = (User) session.getAttribute("loggedInUser");
                         String totalAmount = "";
                        if (loggedInUser != null) {
                            String username = loggedInUser.getUsername();

                            List<Expense> expenseList = expenseDao.getAllExpensesByDateRange(fromDate, toDate, username,category);
                            int count = 1; 
                         double sumAmount = 0.0;


                    Collections.sort(expenseList, Comparator.comparing(Expense::getDate));
                            for (Expense expense : expenseList) {
                               double amount = Double.parseDouble(expense.getAmount());
            sumAmount += amount;
            totalAmount = String.valueOf(sumAmount);
                    %>
                    <tr>
                        <td><%= count %>
                        <td><%= expense.getSubcategory() %></td>
                        <td><%= expense.getDescription() %></td>
                        <td><%= expense.getDate() %></td>
                        <td><%= expense.getTime() %></td>
                        <td><%= expense.getAmount() %></td>
                        <td><a href="editExpense.jsp?id=<%= expense.getId() %>&from_date=<%= fromDate %>&to_date=<%= toDate %>&category=<%= expense.getCategory() %>">Edit</a></td>

                        <td><a href="DeleteExpenseServlet?id=<%= expense.getId() %>&from_date=<%= fromDate %>&to_date=<%= toDate %>&category=expense">Delete</a></td>
                    </tr>
                    <% count++; %>
                    <% 
                        }
                    }else{
                    }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4"></td>
                        <td class="total-amount">Total Amount:</td>
                        <td><%= totalAmount %></td> <!-- Display the total sum amount -->
                        <td colspan="2"></td>
                    </tr>
                </tfoot>
            </table>

            <canvas id="expenseChart"></canvas>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                $(document).ready(function () {
                    var expenseData = <%= new Gson().toJson(request.getAttribute("expenseList")) %>;

                    expenseData.sort(function (a, b) {
                        return new Date(a.date) - new Date(b.date);
                    });

                    var dates = expenseData.map(function (expense) {
                        return expense.date;
                    });
                    var amounts = expenseData.map(function (expense) {
                        return expense.amount;
                    });

                    var ctx = document.getElementById('expenseChart').getContext('2d');
                    var expenseChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: dates,
                            datasets: [{
                                    label: 'Amount',
                                    data: amounts,
                                    backgroundColor: 'rgba(128, 0, 128, 0.5)',
                                    borderColor: 'rgba(128, 0, 128, 1)',
                                    borderWidth: 1
                                }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                });
            </script>

        </section>
        <%@include file="component/footer.html" %>
    </body>
</html>


