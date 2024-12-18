<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Form</title>
    <style>
        .inner-div {
            border: 2px solid #4CAF50;
            background-color: #f9f9f9; 
            padding: 20px; 
            border-radius: 10px ; 
            width: 500px;
            height:200px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 style="color:green">Union Bank of Pentagon</h1>
   

    <% 
        String success = (String) request.getAttribute("success");
        if (success != null) {
    %>
        <h3 style="color:green"><%= success %></h3>
    <% 
        }
    %>

    <% 
        String failure = (String) request.getAttribute("failure");
        if (failure != null) {
    %>
        <h3 style="color:red"><%= failure %></h3>
    <% 
        }
    %>

    <div class="inner-div">
        <form action="deposit" method="post">
            <table>
            	 <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                 <caption><h3 style="color:blue">Customer Amount Deposit Form</h3></caption>
                <tr>
                    <td><b>Enter The Amount:</b></td>
                    <td><input type="text"  Style="height:20px;" name="amount" pattern="^\d+(\.\d+)?$" placeholder="₹₹" required="required"></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                 <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>

                <tr>
                    <td>
                        <button style="display:inline-block;" type="submit" class="btn btn-success">Deposit</button>
                    </td>
                    <td colspan="2" style="text-align:center;">
                        <button style="display:inline-block;"><a href="Dashboard.jsp" style="text-decoration:none;">Back</a></button>
                    </td>
                </tr>

            </table>
        </form> 
    </div>
</div>

</body>
</html>
