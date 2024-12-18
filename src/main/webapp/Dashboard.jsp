<%@ page import="com.Bank.DTO.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initialscale=1.0">
<title>Bank Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Welcome <%=c.getName() %></a>
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
				<%if(c.getAccno()==1100){ %>
				
				
								<%
       						 String success = (String) request.getAttribute("sucess");
       						 String failure = (String) request.getAttribute("failure");
      						  if (success != null) {
    							%>
     						 <div style="font-size: 40px; color:Green; width: 600px">
           					 <%= success %>
       						</div>
   							<% } else if (failure != null) { %>
       						 <div style="font-size: 40px; color:Red; width: 600px">
           					<%= failure %>
        					</div>
   							<% } %>
   									 
					<li class="nav-item"><a class="nav-link" href="UserDetails.jsp">Users Data</a></li>
					<li class="nav-item"><a class="nav-link" href="TransactionDetails.jsp">Transaction Data</a></li>
					<li class="nav-item"><a class="nav-link" href="deleteUser.jsp">Delete User</a></li>
					<li class="nav-item"><a class="nav-link" href="UpdateAcount.jsp">Update Account</a></li>
					<li class="nav-item"><a class="nav-link" href="TransferAmount.jsp">Transfer Ammount</a></li>
					<li class="nav-item"><a class="nav-link" href="Deposit.jsp">Deposit</a></li>
					<li class="nav-item">
					<form action="logout" method="post">
						<input class="btn btn-danger" type="submit" name="logout" value="Logout">
					</form>
					</li>
				<%}else{ %>
					<h1>Welcome <%=c.getName() %></h1>
				<%} %>
					
				</ul>
			</div>
		</div>
	</nav>
	
	

<%if(c.getAccno()==1100){ %>
	<div class="container mt-4">
		<h1 class="text-center mb-4">Dashboard</h1>
	</div>
	<!-- User Section -->
	<div class="row">
		<div class="col-md-12">
			<h3>View Your Data</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Account No.</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Mail ID</th>
						<th>Balance</th>
					</tr>
					<tr>
						<td><%=c.getAccno() %></td>
						<td><%=c.getName() %></td>
						<td><%=c.getPhone() %></td>
						<td><%=c.getMail() %></td>
						<td><%=c.getBal() %></td>
					</tr>
					
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<%}else{ %>
	
	

<div class="container mt-4">
    <h1 class="text-center mb-4">Actions</h1>
    
    <div class="d-flex flex-wrap justify-content-center">
      
        <div class="card text-center m-2" style="width: 18rem ;">
       
            <div class="card-body">
                <h5 class="card-title">Check Balance</h5>
                <a href="checkBalance.jsp" class="btn btn-outline-primary">Go</a>
            </div>
        </div>

       
        <div class="card text-center m-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Deposit</h5>
                <a href="Deposit.jsp" class="btn btn-outline-primary">Go</a>
            </div>
        </div>

       
        <div class="card text-center m-2" style="width: 18rem; border:5">
            <div class="card-body">
                <h5 class="card-title">Transfer Amount</h5>
                <a href="TransferAmount.jsp" class="btn btn-outline-primary">Go</a>
            </div>
        </div>

        
        <div class="card text-center m-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Passbook</h5>
                <a href="Passbook.jsp" class="btn btn-outline-success">Go</a>
            </div>
        </div>

       
        <div class="card text-center m-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Update Account</h5>
                <a href="UpdateAcount.jsp" class="btn btn-outline-success">Go</a>
            </div>
        </div>

        <!-- Card 6: Reset Pin -->
        <div class="card text-center m-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Reset Pin</h5>
                <a href="ForgotPin.jsp" class="btn btn-outline-danger">Go</a>
            </div>
        </div>

        <!-- Card 7: Logout -->
        <div class="card text-center m-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Logout</h5>
                <form action="logout" method="post">
                    <input class="btn btn-danger" type="submit" name="logout" value="Logout">
                </form>
            </div>
        </div>
    </div>
</div>


<%} %>


</body>
</html>