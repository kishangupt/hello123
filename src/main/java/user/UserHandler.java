package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;
import product.Product;

interface UserStandard {
	String insert(User s);

	List<User> FetchAllUsers();
	User checkLogin( String email, String password );
	
	boolean deleteById(int id);
	List<User> FetchAllUsersOtherThanAdmin();
	String toggleActive(int id, boolean state);
}

public class UserHandler implements UserStandard {
	
	public String toggleActive(int id, boolean state) {
		
		try {
			String query = "update user set active=? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, state?1:0);
			p.setInt(2, id);
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}

		return "Success";
	}

	public String insert(User s) {

		try {
			String query = "insert into user" + "(name,phone,email,password) values (?,?,?,?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, s.getName());
			p.setString(2, s.getPhone());
			p.setString(3, s.getEmail());
			p.setString(4, s.getPassword());
		//	p.setInt(5, s.getActive());

			p.executeUpdate();

		} catch (Exception e) {
			return e.getMessage();
		}

		return "User Instert Successfully";
	}

	public List<User> FetchAllUsers() {
	
		List<User> list = new ArrayList<User>();

		try {
			String query = "select * from user";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				list.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("phone"), rs.getString("email"),
						rs.getString("password"), 
						rs.getInt("active")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteById(int id) {

		try {

			String query = "delete from user where id=?";
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

	public User checkLogin(String email, String password) {
try {
			
			Connection conn = Configuration.conn;
			
			String query = "SELECT * FROM user WHERE email =? AND password = ? and ACTIVE = 1";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				User u = new User();
				
				u.setEmail(rs.getString("EMAIL"));
				u.setRole(rs.getString("ROLE"));
				u.setId(rs.getInt("id"));
				
				return u;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<User> FetchAllUsersOtherThanAdmin() {
		List<User> list = new ArrayList<User>();

		try {
			String query = "select * from user where role <> 'ADMIN'";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				list.add(new User(rs.getInt("id"),
						rs.getString("name"), rs.getString("phone"),
						rs.getString("email"),
						rs.getString("password"), 
						rs.getInt("active")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}



	

}