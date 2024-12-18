<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
         .inner-div {
            border: 2px solid #4CAF50;
            background-color: #f9f9f9; 
            padding: 20px; 
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
        <h3 class="sub">Customer Registration Form</h3>
        
		 <% String success = (String) request.getAttribute("sucess");
        if (success != null) {
    	%>
        <h3 class="success" style="color : green"><%= success %></h3>
    	<% 
        }
    	%>
    
		<%String failure =(String)request.getAttribute("failure") ; 
		if(failure!=null)
		{%>
		<h3 class="failure" style="color : red"><%= failure %></h3>
		<%
		} %>
		<div class="inner-div">
        <form action="signup" method="post">
            <table>
                <tr>
                    <td><b>Enter your Name:</b></td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><b>Enter the Phone number:</b></td>
                    <td><input type="tel" name="phone" pattern="[0-9]{10}" required placeholder="1234567890"></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><b>Enter the Mail ID:</b></td>
                    <td><input type="email" name="mail" required placeholder="example@mail.com"></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><b>Enter the Pin:</b></td>
                    <td><input type="password" name="pin" required pattern="[0-9]{4,6}" placeholder="4 to 6 digits"></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><b>Confirm the Pin:</b></td>
                    <td><input type="password" name="repin" required pattern="[0-9]{4,6}" placeholder="4 to 6 digits"></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Create Account"></td>
                    <td><strong>Already have an account? </strong> <a href="Login.jsp">Log in</a></td>
                </tr>
            </table>
        </form>
        </div>
    </div>
</body>
</html>
