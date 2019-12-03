package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imagesbank.ImageBankHandler;
@WebServlet(urlPatterns="/DeleteImageFromBank")
public class DeleteImageFromBank extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		ImageBankHandler ibh = new ImageBankHandler();
		String msg =ibh.deleteById(id);
		if(msg.startsWith("Cannot delete or update a parent row: a foreign key constraint fails")){
		msg = "cannot delete: image refer to product!!";
		}
		else{
			String a=ibh.deleteById(id);
			req.setAttribute("hello", a);
		}
		req.setAttribute("msg", msg);	
		req.getRequestDispatcher("ViewImageBank.jsp").forward(req, resp);
	}
	
	

}
