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

@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {


    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve customer from session
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");

//        if (customer == null) {
//            response.sendRedirect("login.jsp"); // Redirect to login if customer not in session
//            return;
//        }

        String field = request.getParameter("field");
        String value = request.getParameter("value");

        CustomerDAO customerDAO = new CustomerDAOImpl();
        boolean isUpdated = false;

        switch (field) {
            case "name":
                customer.setName(value);
                isUpdated = customerDAO.updateCustomer(customer);
                break;
            case "phone":
                try {
                    customer.setPhone(Long.parseLong(value));
                    isUpdated = customerDAO.updateCustomer(customer);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid phone number format.");
                }
                break;
            case "email":
                customer.setMail(value);
                isUpdated = customerDAO.updateCustomer(customer);
                break;
            default:
                request.setAttribute("error", "Invalid field selected.");
        }

        if (isUpdated) {
            
            request.setAttribute("message", " updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update the field. Please try again.");
        }


        request.getRequestDispatcher("UpdateAcount.jsp").forward(request, response);
    }
}
