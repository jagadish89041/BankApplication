<%@ page import="com.Bank.DTO.Customer" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
   
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .balance-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .balance-header {
            font-size: 24px;
            font-weight: bold;
            color: #17a2b8;
        }
        .balance-value {
            font-size: 32px;
            font-weight: bold;
            color: #28a745;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <% 
        Customer c = (Customer) session.getAttribute("customer");
    %>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4 balance-box">
                <h3 class="text-center balance-header">Hello, <%= c.getName() %>!</h3>
                <p class="text-center balance-value">Your Account Balance is: <%= c.getBal() %> </p>
                
                <div class="text-center">
                    <a href="Dashboard.jsp" class="btn btn-primary btn-back w-100">Back to Actions</a>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
