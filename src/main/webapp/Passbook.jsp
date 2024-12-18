<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.Bank.DTO.Transaction" %>
<%@ page import="com.Bank.DAO.TransactionDAO" %>
<%@ page import="com.Bank.DAO.TransactionDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Passbook</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center mb-0">PassBook</h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Transaction History</h3>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Transaction ID</th>
                        <th>Account No.</th>
                        <th>Transaction Type</th>
                        <th>Transaction Date</th>
                        <th>Amount</th>
                        <th>Updated Balance</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                    // Retrieve the customer object from the session
                    com.Bank.DTO.Customer c = (com.Bank.DTO.Customer) session.getAttribute("customer");
                    
                    if (c != null) {
                        TransactionDAO tdao = new TransactionDAOImpl();
                        List<Transaction> passbook = tdao.getTransaction(c.getAccno());

                        if (passbook != null && !passbook.isEmpty()) {
                            Iterator<Transaction> it = passbook.iterator();
                            while (it.hasNext()) {
                                Transaction t = it.next();
                %>
                                <tr>
                                    <td><%= t.getTransactionId() %></td>
                                    <td><%= t.getRec_acc() %></td>
                                    <td><%= t.getTransaction() %></td>
                                    <td><%= t.getDate() %></td>
                                    <td>
                                        <%= t.getTransaction().equals("CREDITED") ? 
                                            "+ " + t.getAmount() : "- " + t.getAmount() %>
                                    </td>
                                    <td><%= t.getBalance() %></td>
                                </tr>
                <% 
                            }
                        } else {
                %>
                            <tr>
                                <td colspan="6" class="text-center text-danger">
                                    No transactions found
                                </td>
                            </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-danger">
                            Customer session not found. Please log in again.
                        </td>
                    </tr>
                <% 
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="Dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
