package cart;

import product.Product;

public class Cart {
	int id;
	int productId;
	int userId;
	int qty;

	Product product;
	
	/**
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * @param product the product to set
	 */
	
	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public Cart(int id, int productId, int userId, int qty) {
		this.id = id;
		this.productId = productId;
		this.userId = userId;
		this.qty = qty;
	}

	public Cart() {
	}

	public Cart(int productId, int userId, int qty) {
		this.productId = productId;
		this.userId = userId;
		this.qty = qty;
	}

	public Cart(int productId, int userId) {
		this.productId = productId;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", productId=" + productId + ", userId=" + userId + ", qty=" + qty + ", product="
				+ product + "]";
	}

}