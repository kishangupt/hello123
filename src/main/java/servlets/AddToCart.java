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

@WebServlet(urlPatterns = "/AddToCart")
public class AddToCart extends HttpServlet {

	// @Override
	// protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	// throws ServletException, IOException {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int productId = Integer.parseInt(req.getParameter("productId"));
		int userId = Integer.parseInt(req.getParameter("userId"));

		ProductHandler ph = new ProductHandler();

		Product p = ph.fetchProduct(Short.parseShort(req.getParameter("productId")));

		int currStock = p.getStockqty();
		System.out.println(currStock);

		int requestedStock = Integer.parseInt(req.getParameter("quantity"));

		System.out.println(requestedStock);

		CartHandler ch = new CartHandler();

		if (currStock < requestedStock) {

			resp.sendRedirect("NotEnoughStock.jsp");
		} else if (ch.checkCartIn(userId, productId)) {

			resp.sendRedirect("AlreadyInCart.jsp");

		} else {

			Cart c = new Cart(productId, userId, requestedStock);

			p.setStockqty((short) (currStock - requestedStock));

			System.out.println("PRODUCT BEFORE:");
			System.out.println(p);

			ph.update(p);

			System.out.println("PRODUCT AFTER:");
			System.out.println(p);

			System.out.println(ch.insert(c));
			System.out.println(c);
			resp.sendRedirect("ViewCart.jsp");
		}

	}

}
