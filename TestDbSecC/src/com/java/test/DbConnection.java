package com.java.test;
import java.sql.Connection;
import java.sql.DriverManager;
public class DbConnection {
static Connection connection=null;
	
	public static Connection getConnection()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/flutterc", "root", "neMmi@2005!");
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return connection;
	}
}
