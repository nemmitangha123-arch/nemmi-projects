package com.java.test;
import java.sql.Connection;
public class Tester {
public static void main(String[] args) {
		
		try 
		{
			Connection connection=DbConnection.getConnection();	
			if(connection!=null)
			{
				System.out.println("Connection Success");
			}
			else
			{
				System.out.println("Connection fail");

			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
