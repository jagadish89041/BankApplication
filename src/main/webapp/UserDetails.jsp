<%@page import="java.util.Iterator"%>
<%@page import="com.Bank.DAO.*"%>
<%@ page import="com.Bank.DTO.Customer" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    	<div class="container mt-4">
        <h1 class="text-center">Customer List</h1>
        
        <div class="container">
    <a href="Dashboard.jsp" class="btn btn-primary position-absolute" style="top: 20px; right: 140px;">Back</a>
</div>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Customer Acc NO</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>phone Number</th>
                    <th>Balance</th>
                </tr>
            </thead>
            
            <tbody>
                <%
              
                CustomerDAO cdao = new CustomerDAOImpl();
                List<Customer> customers = cdao.getCustomer();
				Iterator it = customers.iterator();
				
				while(it.hasNext()){
				      Customer c1= ( Customer)it.next();
				 	 %>
  
                 <tr>
                    <td><%=c1.getAccno()%></td>
                    <td><%=c1.getName()%></td>
                    <td><%=c1.getMail()%></td>
                    <td><%=c1.getPhone()%></td>
                    <td><%=c1.getBal()%></td>
                </tr>
            
               <%} %>
                
               
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
