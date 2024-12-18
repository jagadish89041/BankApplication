package com.Bank.servlet;

import java.io.IOException;

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

@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accountnumStr = request.getParameter("accountnum");
        String pinStr = request.getParameter("pin");


        long accountnum = Long.parseLong(accountnumStr);
        int pin = Integer.parseInt(pinStr);


        CustomerDAO cdao = new CustomerDAOImpl();
        Customer customer = cdao.getCustomer(accountnum, pin);
        HttpSession session =  request.getSession();

        if (customer != null) {

           session.setAttribute("customer", customer);
   		RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
   		rd.forward(request,response);


        } else {
            request.setAttribute("failure", "Invalid account number or PIN.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
