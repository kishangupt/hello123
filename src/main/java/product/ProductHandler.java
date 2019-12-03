package product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import category.Category;
import config.Configuration;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import category.Category;
import config.Configuration;

interface ProductStandard {
	String insert(Product p);

	String update(Product c);

	//
	boolean deleteById(int id);

	//
	Product fetchProduct(int id);

	//
	List<Product> fetchAllProducts();
}

public class ProductHandler implements ProductStandard {

	public String insert(Product pr) {

		try {

			String query = "insert into Product " + "(name,description,price,stockqty,categoryid,imageId) " + "values "
					+ "(?,?,?,?,?,?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, pr.getName());
			p.setString(2, pr.getDescription());
			p.setDouble(3, pr.getPrice());
			p.setShort(4, pr.getStockqty());
			p.setShort(5, pr.getCategoryId());
			p.setInt(6, pr.getImageId());

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}

		return "Product Inserted Successfully";
	}

	public String update(Product c) {

		try {

			String query = "update product set name=?," + "description=?,price=?,stockqty=?,categoryid =? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			System.out.println("PRODUCT UPDATE:");
			System.out.println(c.getStockqty());

			p.setString(1, c.getName());
			p.setString(2, c.getDescription());
			p.setDouble(3, c.getPrice());
			p.setShort(4, c.getStockqty());
			p.setShort(5, c.getCategoryId());
			p.setInt(6, c.getId());
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}

		return "Product Updated Successfully";
	}

	public List<Product> fetchAllProducts() {
		List<Product> list = new ArrayList<Product>();

		try {

			String query = "select p.*,c.name as catName,c.description as catDesc , ib.url as imageUrl from product p,category c, imageBank ib where c.id = p.categoryid and ib.id=p.imageId";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				list.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("description"),
						rs.getDouble("price"), rs.getShort("stockqty"), rs.getShort("categoryid"),
						rs.getString("imageUrl"),

						new Category(rs.getString("catName"),

								rs.getString("catDesc"))));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteById(int id) {

		try {

			String query = "delete from Product where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			p.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public Product fetchProduct(int id) {
		try {

			String query = "select p.*,c.name as catName,c.description as catDesc , ib.url as imageUrl from product p,category c, imageBank ib where c.id = p.categoryid and ib.id=p.imageId and p.id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getShort("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getDouble("price"));
				product.setStockqty(rs.getShort("stockqty"));
				product.setCategoryId(rs.getShort("categoryId"));

				Category c = new Category();
				c.setName(rs.getString("catName"));
				c.setDescription(rs.getString("catDesc"));
				product.setCategory(c);
				// rs.getShort("categoryId"),
				product.setImageUrl(rs.getString("imageUrl"));

				return product;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Product();
	}

}