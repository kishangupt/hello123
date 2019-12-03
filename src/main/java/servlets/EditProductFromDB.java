package servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.ProductHandler;
@WebServlet(urlPatterns="/EditProductFromDB")
public class EditProductFromDB extends HttpServlet {
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp)
					throws SecurityException, IOException {
		
	
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("productname");
		String description = req.getParameter("productdescription");
		Double price = Double.parseDouble(req.getParameter("price"));
		
		Short stockqty = Short.parseShort(req.getParameter("stockqty"));
		Short categoryid= Short.parseShort(req.getParameter("categoryid"));
		
		Product p = new Product(id, name, description, price, stockqty, categoryid);

		ProductHandler ph = new ProductHandler();
		System.out.println(ph.update(p));

		resp.sendRedirect("ViewProduct.jsp");

	}

}
