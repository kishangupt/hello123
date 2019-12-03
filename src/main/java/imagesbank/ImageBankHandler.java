package imagesbank;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import category.Category;
import config.Configuration;
import product.Product;

interface ImageBankStandard{
	void insert(ImageBank ib);
	List<ImageBank> fetchAllImagesInBank();
	String deleteById(int id);
//	String update(Image c);
	ImageBank fetchImage(int id);
}
public class ImageBankHandler implements ImageBankStandard {
	
	public String deleteById(int id) {
		try {

			String query = "delete from imagebank where id=?";

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

	public void insert(ImageBank ib) {
		try {

			String query = "insert into imagebank " + "(url) " + 
			"values " + "(?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, ib.getUrl());
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public List<ImageBank> fetchAllImagesInBank() {
		List<ImageBank> list = new ArrayList<ImageBank>();

		try {

			String query = "select * from imagebank";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new ImageBank(rs.getInt("id"), rs.getString("url")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

//	public String update(Image c) {
//		try {
//
//			String query = "update imagebank set id=?," + "url=?";
//
//			Connection conn = Configuration.conn;
//			PreparedStatement p = conn.prepareStatement(query);
//			p.setInt(1, );
//			p.setString(2, c.getUrl());
//			
//			
//			p.executeUpdate();
//
//		} catch (Exception e) {
//			return e.getMessage();
//		}
//
//		return "Product Updated Successfully";
//	}

	public ImageBank fetchImage(int id) {
		
		try {

			String query = "select * from imagebank where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				return  new ImageBank(rs.getInt("id"),
						rs.getString("url"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ImageBank();
	}




	
	}
	


