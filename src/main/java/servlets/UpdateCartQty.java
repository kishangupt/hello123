package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.CartHandler;
import product.Product;
import product.ProductHandler;
@WebServlet(urlPatterns="/UpdateCartQty")
public class UpdateCartQty extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartHandler ch = new CartHandler();
		ProductHandler ph = new ProductHandler();
		
		Cart cart=ch.fetchProduct(Integer.parseInt(req.getParameter("id")));
		int currCartstock=cart.getQty();
		System.out.println(currCartstock);
		
		//Product p = ph.fetchProduct(Short.parseShort(req.getParameter("productId")));
		Product p = ph.fetchProduct(Integer.parseInt(req.getParameter("productId")));

		int currStock = p.getStockqty();
		System.out.println(currStock);

		int requestedStock = Integer.parseInt(req.getParameter("quantity"));

		System.out.println(requestedStock);

		

		if (currStock < requestedStock) {

			resp.sendRedirect("NotEnoughStock.jsp");
		} 

		 
		else{

			Cart c = new Cart(
					Integer.parseInt(req.getParameter("id")),
					Integer.parseInt(req.getParameter("productId")),
					Integer.parseInt(req.getParameter("user")),
					Integer.parseInt(req.getParameter("quantity"))
					);

			p.setStockqty((short) (currStock +currCartstock-requestedStock));

		//	System.out.println("PRODUCT BEFORE:");
		//	System.out.println(p);

			ph.update(p);
			ch.update(c);

			//System.out.println("PRODUCT AFTER:");
			//System.out.println(p);

			//System.out.println(ch.insert(c));
			
			resp.sendRedirect("ViewCart.jsp");
			System.out.println(c);
		}

	}

}
