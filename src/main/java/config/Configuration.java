package config;


import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import category.Category;
import category.CategoryHandler;

@WebListener
public class Configuration implements ServletContextListener {

	public static final Connection conn = getConnection();

	private static Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DB CONNECTED");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/myniit", "root", "root");
			// return DriverMa
			// nager.getConnection("jdbc:mysql://remotemysql.com:3306/uQAjV4tFkT",
			// "uQAjV4tFkT", "1HuSHKDZiu");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB CONNECTION FALIOR");
		}
		return null;

	}

	public void contextDestroyed(ServletContextEvent sce) {

		try {
			System.out.println("DB DISCONNECTED");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB DISCONNET FALIOR");

		}
	}

	public void contextInitialized(ServletContextEvent sce) {
		
	//	Category c=new Category("a","hello");
		
	//	CategoryHandler ch=new CategoryHandler();
		//System.out.println(ch.insert(c));
	
	
	//CategoryHandler ch = new CategoryHandler();
	//System.out.println(ch.fetchAllCategories());
		

	}

}

