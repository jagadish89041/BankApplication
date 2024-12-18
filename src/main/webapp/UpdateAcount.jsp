<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Account</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center mb-2">Update Account Details</h1>
        <div class="d-flex justify-content-center">
            <div style="background-color: #f9f9f9; width: 500px; height: 430px; padding: 15px; border-radius: 15px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); border: 2px solid #4CAF50; display: flex; flex-direction: column; justify-content: space-between;">
                
               
                <% 
                    String message = (String) request.getAttribute("message");
                    String error = (String) request.getAttribute("error");
                    if (message != null) { 
                %>
                    <p class="success-message text-center" style="color: #28a745; font-weight: bold;"><%= message %></p>
                <% 
                    } 
                    if (error != null) { 
                %>
                    <p class="error-message text-center" style="color: #dc3545; font-weight: bold;"><%= error %></p>
                <% } %>

                <form action="UpdateAccount" method="post">
                    <div class="form-group text-center">
                        <label for="field">Choose Field to Update:</label>
                        <select class="form-control w-75 mx-auto" id="field" name="field" required>
                            <option value="">--Select--</option>
                            <option value="name">Name</option>
                            <option value="phone">Phone Number</option>
                            <option value="email">Email ID</option>
                        </select>
                    </div>
                    <div class="form-group text-center">
                        <label for="value">New Value:</label>
                        <input type="text" class="form-control w-75 mx-auto" id="value" name="value" placeholder="Enter new value" required>
                    </div>

                  
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-outline-primary w-50 mt-3">Update</button>
                    </div>
                    
                    <div class="d-flex justify-content-center">
                     <a href="Dashboard.jsp" class="btn btn-outline-secondary w-50 mt-3">Cancel</a>
                     </div>
                </form>

                <!-- Logout form with bottom margin -->
                <div class="col-12 mb-3 d-flex justify-content-center mt-4">
                    <form action="logout" method="post">
                        <input class="btn btn-danger w-100" type="submit" name="logout" value="Logout">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
