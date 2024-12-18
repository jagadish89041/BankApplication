<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .heading {
            color: green;
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
            padding-right: 10px; 
            border-radius: 10px ; 
            width: 500px;
            height:250px;
            margin: 10px;
        }
        
    </style>
</head>
<body >

<div align="center">
    <h1 class="heading">Union Bank of Pentagon</h1>
    <h3 class="sub">Update your PIN here</h3>

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
    <form action="forgotPin" method="post">
        <br>
        <table>
            <tr>
                <td><b>Enter the Phone Number:</b></td>
                <td><input type="tel" name="phone" pattern="[0-9]{10}" placeholder="10 digit PhnNo" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Enter your Email:</b></td>
                <td><input type="email" name="mail" placeholder="Enter your email" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Enter a New Pin:</b></td>
                <td><input type="password" name="pin"  pattern="[0-9]{2,5}" placeholder="Enter 2 to 5 digit pin" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Confirm the Pin:</b></td>
                <td><input type="password" name="repin" pattern="[0-9]{2,5}" placeholder="Enter 2 to 5 digit pin" required="required"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
          <tr>
    			<td style="gap:30px"><input type="submit" value="Update Pin"></td>
    			<td style=" gap:50px">
       			 <button type="button" onclick="window.location.href='Login.jsp';">Login</button>
   				 </td>
   				 <td style="gap:10px">

   				 </td>
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
