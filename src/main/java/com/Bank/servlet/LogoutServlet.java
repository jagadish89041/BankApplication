package com.Bank.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
    	
        HttpSession session = req.getSession(false);
        if (session!=null) {
            session.invalidate();
            req.setAttribute("lsucess", "logout sucessfull");
    		RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
    		rd.forward(req,resp);
        }
        else
        {
        	req.setAttribute("lfailure", "logout failed");
    		}
      
         
    }
}
