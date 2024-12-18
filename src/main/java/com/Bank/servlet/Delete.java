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
import com.Bank.DTO.Customer;


@WebServlet("/deleteUser")
public class Delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long useraccno = Integer.parseInt(request.getParameter("accno"));

       HttpSession session= request.getSession(false);

       Customer admin = (Customer)session.getAttribute("customer");


        if (admin != null && admin.getAccno()== 1100 && admin.getAccno() != useraccno) {

        	CustomerDAO cdao = new CustomerDAOImpl();

             Customer customerToDelete = cdao.getCustomer(useraccno);



          // Debugging: Print the fetched customer details
          if (customerToDelete == null) {
              System.out.println("Customer with account number " + useraccno + " was not found in the database.");
          } else {
              System.out.println("Customer to delete: " + customerToDelete.getAccno() + ", " + customerToDelete.getName());
          }



             boolean isDeleted = cdao.deleteCustomer(customerToDelete); // Delete using the object
             if (isDeleted) {
                 request.setAttribute("success", "Customer deleted successfully.");
             } else {
                 request.setAttribute("failure", "Failed to delete the customer. Please try again.");
             }
        } else {

            request.setAttribute("failure", "You cannot delete your own account.");
        }


        request.getRequestDispatcher("deleteUser.jsp").forward(request, response);
    }
}

