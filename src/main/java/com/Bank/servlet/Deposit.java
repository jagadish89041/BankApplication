package com.Bank.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionID;

@WebServlet("/deposit")
public class Deposit extends HttpServlet {

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
        Customer c = (Customer) session.getAttribute("customer");


        if (c == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double amount = Double.parseDouble(request.getParameter("amount"));


        CustomerDAO cdao = new CustomerDAOImpl();
        TransactionDAO tdao = new TransactionDAOImpl();


        c.setBal(c.getBal() + amount);
        boolean res = cdao.updateCustomer(c);


        if (res) {
            Transaction t = new Transaction();
            t.setTransactionId(TransactionID.generateTransactionId());
            t.setUser(c.getAccno());
            t.setRec_acc(c.getAccno());
            t.setTransaction("CREDITED");
            t.setAmount(amount);
            t.setBalance(c.getBal());

            boolean res1 = tdao.insertTransaction(t);

            if (res1) {

                request.setAttribute("success", "Rs. " + amount + " Deposited successfully!");
                request.getRequestDispatcher("Deposit.jsp").forward(request, response);
            } else {

                request.setAttribute("failure", "Failed to deposit! Try again later.");
                request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
            }
        } else {

            request.setAttribute("failure", "Failed to update your balance! Try again later.");
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
        }
    }
}
