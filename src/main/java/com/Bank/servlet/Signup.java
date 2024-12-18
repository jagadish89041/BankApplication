package com.Bank.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

@WebServlet("/signup")
public class Signup extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =  req.getParameter("name");
		 String phonenumber=req.getParameter("phone");
		String mail  = req.getParameter("mail");
		 String pin=req.getParameter("pin");
		 String repin=req.getParameter("repin");

		 long phone=Long.parseLong(phonenumber);
		 int pin1=Integer.parseInt(pin);
		 int repin1=Integer.parseInt(repin);
		 PrintWriter out=resp.getWriter();

			Customer c = new Customer();
			CustomerDAO cdao = new CustomerDAOImpl();

			if(pin1==repin1) {

				c.setName(name);
				c.setPin(pin1);
				c.setPhone(phone);
				c.setMail(mail);
				boolean res =cdao.insertCustomer(c);
			    Customer c1 = cdao.getCustomer(phone, mail);



				if(res) {

					 	req.setAttribute("sucess", "Signup Sucessful! Your Account NO :" +c1.getAccno());
						RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
						rd.forward(req,resp);

				}
				else {
					req.setAttribute("failure", "Signup failed!");
					RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
					rd.forward(req,resp);
			}

	}else {
		req.setAttribute("failure", "Signup failed!");
		RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
		rd.forward(req,resp);
}

			}
}
