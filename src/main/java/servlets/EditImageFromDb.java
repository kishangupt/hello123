package servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditImageFromDb extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp)
					throws SecurityException, IOException {
	
	int id = Integer.parseInt(req.getParameter("id"));
	String name = req.getParameter("url");
	resp.sendRedirect("ViewImageBank.jsp");
	
}
}