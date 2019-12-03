package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Address.Address;
import Address.AddressHandler;

@WebServlet(urlPatterns="/AddToAddress")
public class AddToAddress  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =req.getParameter("name"),
		phone = req.getParameter("phone");
		int pin = Integer.parseInt(req.getParameter("pin"));
		String locality = req.getParameter("locality"),
				address = req.getParameter("address"),
				city = req.getParameter("city"),
				state= req.getParameter("state"),
				landmark = req.getParameter("landmark"),
				alternate_phone=req.getParameter("alternate_phone");
				
		int userid = Integer.parseInt(req.getParameter("UserId"));
		
		Address a =new Address(name,phone,pin,locality,address,city,state,landmark,alternate_phone,userid);
	AddressHandler ah = new AddressHandler();
	ah.insert(a);
	System.out.println(a);
	resp.sendRedirect("ViewAddress.jsp");
	}

}
