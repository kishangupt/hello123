package servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.Category;
import category.CategoryHandler;

@WebServlet(urlPatterns="/EditCategory")
public class EditCategory extends HttpServlet {
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp)
					throws SecurityException, IOException {
		
	
		short id = Short.parseShort(req.getParameter("id"));
		String name = req.getParameter("categoryName");
		String description = req.getParameter("categoryDescription");

		Category c = new Category(id, name, description);

		CategoryHandler ch = new CategoryHandler();
		System.out.println(ch.update(c));

		resp.sendRedirect("ViewCategory.jsp");
	}
	


}
