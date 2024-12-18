<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TransforAmount Form</title>
    <style>
        .inner-div {
            border: 2px solid #4CAF50;
            background-color: #f9f9f9; 
            padding: 20px; 
            border-radius: 10px ; 
            width: 500px;
            height:300px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 style="color:green">Union Bank of Pentagon</h1>
   

   <% 
    String sucess = (String) request.getAttribute("sucess");
    if (sucess != null) {
%>
    <h3 style="color:green"><%= sucess %></h3>
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
        <form action="TransferAmount" method="post">
            <table>
            	 <h3 style="color:blue">Customer Amount Transfer Form</h3>
                  <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                
                <tr>
                    <td><b>Enter The Amount:</b></td>
                    <td><input type="text"  Style="height:20px;" name="amount" pattern="^\d+(\.\d+)?$" placeholder="₹₹" required="required"></td>
                </tr>
                
                   <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                
                 <tr>
                <td><b>Enter Recv Account Number:</b></td>
                <td><input type="text" name="accountnum" pattern="[0-9]{4}" placeholder="4 digit AccNo" required="required"></td>
            </tr>
                
                   <tr>
                    <td><br></td>
                    <td><br></td>
               	 </tr>
                
                 <tr>
                    <td><b>Enter The Pin:</b></td>
                    <td><input type="text"  Style="height:20px;" name="pin"pattern="[0-9]{2,5}" placeholder="Enter 2 to 5 digit pin" required="required"></td>
                </tr>
               
                <tr>
                    <td><br></td>
                    <td><br></td>
               	 </tr>

                <tr>
                    <td>
                        <button style="display:inline-block;" type="submit" class="btn btn-success">Transfer</button>
                    </td>
                    <td colspan="2" style="text-align:center;"> <button style="display:inline-block;"><a href="Dashboard.jsp" style="text-decoration:none;">Back</a></button>
                    </td>
                </tr>

            </table>
        </form> 
    </div>
</div>

</body>
</html>
