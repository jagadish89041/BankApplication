package com.Bank.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

@WebServlet("/forgotPin")
public class ForgoPin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String phoneNumber = req.getParameter("phone");
        String email = req.getParameter("mail");
        String pin = req.getParameter("pin");
        String rePin = req.getParameter("repin");


        long phone = Long.parseLong(phoneNumber);
        int pin1 = Integer.parseInt(pin);
        int rePin1 = Integer.parseInt(rePin);


        PrintWriter out = resp.getWriter();

        CustomerDAO customerDAO = new CustomerDAOImpl();
        HttpSession session =req.getSession(false);
        Customer customer = (Customer)session.getAttribute("customer");


        if (customer != null && pin.equals(rePin) && customer.getPhone()==phone && customer.getMail().equals(email))
        {

            customer.setPin(rePin1);
            boolean result = customerDAO.updateCustomer(customer);

            if (result) {

                req.setAttribute("success", "Pin update successful. Click Login to Login");
                RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
                rd.forward(req, resp);
            }
            else {

                req.setAttribute("failure", "Update failed. Please try again.");
                RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
                rd.forward(req, resp);
            }
        }
        else {

            req.setAttribute("failure", "Update failed. Please try again.");
            RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
            rd.forward(req, resp);
        }
    }
}
