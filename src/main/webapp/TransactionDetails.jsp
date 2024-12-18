<%@ page import="com.Bank.DTO.*" %>
<%@ page import="com.Bank.DAO.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center">Transaction Details</h1>
        <table class="table table-bordered table-striped">
        <div class="container">
    	<a href="Dashboard.jsp" class="btn btn-primary position-absolute" style="top: 20px; right: 140px;">Back</a>
		</div>
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>User Account No</th>
                    <th>Receiver Account No</th>
                    <th>Transaction Date</th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Balance</th>
                </tr>
            </thead>
            <tbody>
                <%
                TransactionDAO tdao = new TransactionDAOImpl();
                List<Transaction> transactions = tdao.getTransaction();
                    if (transactions != null && !transactions.isEmpty()) {
                        Iterator<Transaction> it = transactions.iterator();
                        while (it.hasNext()) {
                            Transaction t = it.next();
                %>
                <tr>
                    <td><%= t.getTransactionId()%></td>
                    <td><%=t.getUser() %></td>
                     <td><%=t.getRec_acc() %></td>
                     <td><%=t.getDate() %>
                    <td><%= t.getTransaction()%></td>
                    <td><%= t.getAmount() %></td>
                    <td><%= t.getBalance() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No transactions found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
