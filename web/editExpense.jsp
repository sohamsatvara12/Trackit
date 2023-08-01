<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.CategoryDao" %>
<%@ page import="com.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.ExpenseDao" %>
<%@ page import="com.entity.Expense" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Expense</title>

        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/addexpense.css"/>
    </head>
    <body>
        <%@include file="component/msg.jsp" %>
        <%@include file="component/header.jsp" %>

        <h1 class="heading" style="margin-top:9.5rem;">Edit<span>Transaction</span></h1>

        <%
           int id = Integer.parseInt(request.getParameter("id"));
           String category = request.getParameter("category");

           ExpenseDao expenseDao = new ExpenseDao();
           Expense expense = expenseDao.getExpenseById(id);

           if (expense != null) {
               String subcategory = expense.getSubcategory();
               String description = expense.getDescription();
               String date = expense.getDate();
               String time = expense.getTime();
               String amount = expense.getAmount();
        %>

        <section style="margin-top: -7rem;">
            <form action="EditExpenseServlet" method="POST" id="expense" class="add-product-form">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="hidden" name="category" value="<%= category %>">

                <input type="hidden" name="from_date" value="<%= request.getParameter("from_date") %>">
                <input type="hidden" name="to_date" value="<%= request.getParameter("to_date") %>">
                <input type="text" name="category" disabled value="<%= category %>"  class="box" required style="border:.5px solid #ccc;color: rgb(128, 128, 128);">

                <select name="subcategory" class="box" required style="border:.5px solid #ccc;color: rgb(128, 128, 128);">
                    <option value="" selected disabled>select a category</option>
                    <%
                  CategoryDao categoryDao = new CategoryDao();
                  List<Category> categoryList;
                  
                  if (category.equals("expense")) {
                      categoryList = categoryDao.getExpenseCategories("expense");
                  } else {
                      categoryList = categoryDao.getExpenseCategories("income");
                  }

                  for (Category expenseCategory : categoryList) {
                      String selected = subcategory.equals(expenseCategory.getSubtype()) ? "selected" : "";
                    %>
                    <option value="<%= expenseCategory.getSubtype() %>" <%= selected %>><%= expenseCategory.getSubtype() %></option>
                    <% } %>


                </select>
                <input type="text" name="description" value="<%= description %>" placeholder="enter the Expense Description" class="box" required style="border:.5px solid #ccc;color: rgb(128, 128, 128);">
                <input type="date" name="date" value="<%= date %>" id="date" class="box" required style="color: rgb(128, 128, 128);">
                <input type="time" name="time" value="<%= time %>" id="time" class="box" required style="color: rgb(128, 128, 128);">
                <input type="number" name="amount" value="<%= amount %>" id="amount" min="0" step="0.01" class="box" placeholder="enter the expense value" required>
                <input type="submit" name="update_product" value="Update Expense" class="btn" id="btn1">
            </form>
        </section>

        <%
        } else {
        }
        %>

        <%@include file="component/footer.html" %>
    </body>
</html>


