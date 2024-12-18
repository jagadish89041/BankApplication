<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .heading {
            color: #000080;
        }
        .sub {
            color: #1e90ff;
        }
        .failure {
            color: red;
        }
        .success {
            color: green;
        }
         .inner-div {
            border: 2px solid #4CAF50;
            background-color: #f9f9f9; 
            padding: 20px; 
            border-radius: 10px ; 
            width: 500px;
            height:170px;
            margin: 10px;
            gap:10px;
        }
        
       
    </style>
</head>
<body>

<div align="center">
    <h1 class="heading" style="color:green">Union Bank of Pentagon </h1>
    <h3 class="sub">Customer Login Form</h3>
    						<%
       						 String success1 = (String) request.getAttribute("lsucess");
       						 String failure1 = (String) request.getAttribute("lfailure");
      						  if (success1 != null) {
    							%>
     						 <div style="color:Red;" >
           					 <%= success1 %>
       						</div>
   							<% } else if (failure1 != null) { %>
       						 <div style="color:Green;">
           					<%= failure1 %>
        					</div>
   							<% } %>
   							

    <% 
        String success = (String) request.getAttribute("success");
        if (success != null) {
    %>
        <h3 class="success"><%= success %></h3>
    <% 
        }
    %>

    <% 
        String failure = (String) request.getAttribute("failure");
        if (failure != null) {
    %>
        <h3 class="failure"><%= failure %></h3>
    <% 
        }
    %>

	 <div class="inner-div">
    <form action="login" method="post">
        <br>
       
        <table>
            <tr>
                <td><b>Enter your Account Number:</b></td>
                <td><input type="text" name="accountnum" pattern="[0-9]{4}" placeholder="4 digit AccNo" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Enter the Pin:</b></td>
                <td><input type="text" name="pin" pattern="[0-9]{2,5}" placeholder="2 to 5 digits" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login"></td>
                <td> <button type="button" onclick="window.location.href='ForgotPin.jsp';">forgot pin?</button></td>
                
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
        </table>
       
    </form>
     </div>
</div>

</body>
</html>
