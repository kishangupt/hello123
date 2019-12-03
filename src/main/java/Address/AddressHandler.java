package Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cart.Cart;
import category.Category;
import config.Configuration;
import product.Product;
import product.ProductHandler;

interface AddressStandard{
	
	String insert(Address a);
	List<Address>fetchAddress(int userid);
	Address fetchAddressByid(int id);
	String update(Address a);
	String deleteById(int id);
}
public class AddressHandler  implements AddressStandard{

	public String insert(Address a) {
		try {

			String query = "insert into Address"+"( name,phone, pincode, locality,address,city,state,landmark, "
					+ "alternate_Phone,userid)"
					+ "value(?,?,?,?,?,?,?,?,?,?)";

					Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, a.getName());
			p.setString(2,a.getPhone());
			p.setInt(3, a.getPincode());
			p.setString(4,a.getLocality());
			p.setString(5,a.getAddress());
			p.setString(6,a.getCity());
			p.setString(7,a.getState());
			p.setString(8,a.getLandmark());
			p.setString(9,a.getAlalternate_Phone());
			/*p.setString(10,a.getAddress_type());*/
			p.setInt(10, a.getUserid());

			p.executeUpdate();
			System.out.println(p);
			
		
		System.out.println(p);
	}catch (Exception e) {
		return e.getMessage();
	}
		return "Address Inserted Successfully";

	}

	public List<Address> fetchAddress(int userid) {
		
		List<Address> list = new ArrayList<Address>();
		
		try {
			String query = "select * from address where userid = ?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, userid);
			
			ResultSet rs = p.executeQuery();

			
		
			while (rs.next()) {
				
				Address a=new Address();
				
						a.setId(rs.getInt("id"));
						a.setName(rs.getString("name")); 
						a.setPhone(rs.getString("phone"));
						a.setPincode(rs.getInt("pincode")); 
						a.setLocality(rs.getString("locality"));
						a.setAddress(rs.getString("address"));
						a.setCity(rs.getString("city"));
						a.setState(rs.getString("state")); 
						a.setLandmark(rs.getString("landmark"));
						a.setAlalternate_Phone(rs.getString("alternate_Phone"));
						a.setUserid(rs.getInt("userid"));	
						
				
			list.add(a);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	

	public String deleteById(int id) {
		try {

			String query = "delete from Address where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
		return "Image Bank Deletion Successful";
	}

	public Address fetchAddressByid(int id) {
		try {
			String query = "select * from address where id = ?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
              p.setInt(1, id);
			
			
			ResultSet rs = p.executeQuery();

			
		
			while (rs.next()) {
				
				return new Address(

						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("phone"),
						rs.getInt("pincode"), 
						rs.getString("locality"),
						rs.getString("address"),
						rs.getString("city"),
						rs.getString("state"), 
						rs.getString("landmark"),
						rs.getString("alternate_Phone"),
						rs.getInt("userid"));
			

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Address();
	}

	public String update(Address a) {
		try {

			String query = "update Address set name=?,phone=?, pincode=?, locality=?,address=?,city=?,"
					+ "    state=?,landmark=?,alternate_Phone=?,userid=?";
			

					Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, a.getName());
			p.setString(2,a.getPhone());
			p.setInt(3, a.getPincode());
			p.setString(4,a.getLocality());
			p.setString(5,a.getAddress());
			p.setString(6,a.getCity());
			p.setString(7,a.getState());
			p.setString(8,a.getLandmark());
			p.setString(9,a.getAlalternate_Phone());
			/*p.setString(10,a.getAddress_type());*/
			p.setInt(10, a.getUserid());

			p.executeUpdate();
			System.out.println(p);
			
		
		System.out.println(p);
	}catch (Exception e) {
		e.printStackTrace();
	}
		return "Update Successfully";

	}





		
		
	}


