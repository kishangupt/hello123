package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

interface CategoryStandard {

	String insert(Category c);

	String update(Category c);

	// for delete:

	boolean deleteById(short id);

	Category fetchCategory(short id);

	List<Category> fetchAllCategories();

}

public class CategoryHandler  implements CategoryStandard{

	public String insert(Category c) {

		try {
			String query = "insert into category" + "(name,description) values (?,?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getName());
			p.setString(2, c.getDescription());

			p.executeUpdate();

		} catch (Exception e) {
			return e.getMessage();
		}

		return "Category Instert Successfully";
	}
	
	
//show
	public List<Category> fetchAllCategories() {
		List<Category> list = new ArrayList<Category>();

		try {
			String query = "select * from category";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				list.add(new Category(rs.getShort("id"),
						rs.getString("name"),
						rs.getString("description")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	//delete by id
	
	public boolean deleteById(short id) {
		// Delete

		try {

			String query = "delete from category where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setShort(1, id);
			p.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//fetch by id
	public Category fetchCategory(short id) {

		try {

			String query = "select * from category where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setShort(1, id);
			
			ResultSet rs=p.executeQuery();
			
			while(rs.next()) {
			return  new Category(
					rs.getShort("id"),
					rs.getString("name"),
					rs.getString("description")
					);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new Category();
	}
	
	//update

	public String update(Category c) {

		try {
			String query = "update category set name = ?, description = ? where id = ?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getName());
			p.setString(2, c.getDescription());
			p.setShort(3, c.getId());
			p.executeUpdate();

		} catch (Exception e) {
			
			return e.getMessage();
		}

		return "Category Updated Successfully";
	}




}
