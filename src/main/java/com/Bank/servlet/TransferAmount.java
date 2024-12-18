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
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionID;

@WebServlet("/TransferAmount")
public class TransferAmount extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CustomerDAO cdao = new CustomerDAOImpl();
		Transaction t1=null; //sender transaction details
		Transaction t2=null; //receiver transaction details

        HttpSession session =  req.getSession(false);
        Customer c = (Customer) session.getAttribute("customer");

        String am=req.getParameter("amount");
        double amount = Double.parseDouble(am);

        String ac=req.getParameter("accountnum");
        long receiver_accno=Long.parseLong(ac);

        String pin1 =req.getParameter("pin");
        int pin = Integer.parseInt(pin1);

        TransactionDAO tdao=new TransactionDAOImpl();
        Customer receiver=cdao.getCustomer(receiver_accno);

        System.out.println(c.getAccno());
        System.out.println(receiver.getAccno());
        System.out.println(c.getBal());

        System.out.println(amount);
        if(c.getAccno()!=receiver.getAccno()&&c.getBal()>0&&c.getBal()>=amount&&amount>0)
		{


			if(pin==c.getPin())
			{
				c.setBal(c.getBal()-amount);
				boolean c_res=cdao.updateCustomer(c);
				if(c_res)
				{
					t1=new Transaction();
					t1.setTransactionId(TransactionID.generateTransactionId());
					t1.setUser(c.getAccno());
					t1.setRec_acc(receiver.getAccno());
					t1.setTransaction("DEBITED");
					t1.setAmount(amount);
					t1.setBalance(c.getBal());
					boolean res1=tdao.insertTransaction(t1);
					System.out.print("trasaction created" + res1);
				}
				receiver.setBal(receiver.getBal()+amount);
				boolean receiver_res=cdao.updateCustomer(receiver);
				if(receiver_res)
				{
					{
						t2=new Transaction();
						t2.setTransactionId(t1.getTransactionId());
						t2.setUser(receiver.getAccno());
						t2.setRec_acc(c.getAccno());
						t2.setTransaction("CREDITED");
						t2.setAmount(amount);
						t2.setBalance(receiver.getBal());
						boolean res1=tdao.insertTransaction(t2);
					}
				}
				if (c_res && receiver_res) {
				    req.setAttribute("sucess", "Transaction Suceess"); // Convert Long to String
				    RequestDispatcher rd = req.getRequestDispatcher("TransferAmount.jsp");
				    rd.forward(req, resp);
				} else {
				    req.setAttribute("failure", "An error Occurred!!");
				    RequestDispatcher rd = req.getRequestDispatcher("TransferAmount.jsp");
				    rd.forward(req, resp);
				}

			}
			else
			{
				req.setAttribute("failure","An error Occured !!" );
		   		RequestDispatcher rd = req.getRequestDispatcher("TransferAmount.jsp");
		   		rd.forward(req,resp);
			}
		}
		else
		{
			req.setAttribute("failure","An error Occured !!" );
	   		RequestDispatcher rd = req.getRequestDispatcher("TransferAmount.jsp");
	   		rd.forward(req,resp);
		}



	}
}