package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

	public static Connection getConnection()  {
		Connection connection=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/con","root","");
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	public static int saveData(Student student){
		int s =0;
		Connection con=StudentDao.getConnection();
		try {
			PreparedStatement preparedStatement=con.prepareStatement("insert into student1 values(?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, student.getRoll());
			preparedStatement.setString(2, student.getName());
			preparedStatement.setString(3, student.getEmail());
			preparedStatement.setString(4, student.getGender());
			preparedStatement.setString(5, student.getPass());
			preparedStatement.setString(6, student.getContact());
			preparedStatement.setString(7, student.getCourse());
			
			s=preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
		
	}
	public static int deleteData(int roll) {
		int status=0;
		Connection con=StudentDao.getConnection();
		try {
			PreparedStatement preparedStatement=con.prepareStatement("delete from student1 where roll=?");
			preparedStatement.setInt(1, roll);
			status=preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
	}	
	public static int UpdateData(Student student) {
		int status=0;
		Connection con=StudentDao.getConnection();
		try {
			PreparedStatement preparedStatement=con.prepareStatement("update student1 set name=?,email=?,password=?,gender=?,contact=?,course=?,where roll=?");
			preparedStatement.setString(1, student.getName());
			preparedStatement.setString(2, student.getEmail());
			preparedStatement.setString(3, student.getPass());
			preparedStatement.setString(4, student.getGender());
			preparedStatement.setString(5, student.getContact());
			preparedStatement.setString(6, student.getCourse());	
			preparedStatement.setInt(7, student.getRoll());
			
			status=preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
	}
	public static Student getData(int roll) {
	Student status=null;
		Connection con=StudentDao.getConnection();
		try {
			PreparedStatement preparedStatement=con.prepareStatement("select * from student1 where roll=?");
			preparedStatement.setInt(1, roll);
			ResultSet rst=preparedStatement.executeQuery();
			status=new Student();
			while(rst.next()) {
			
				status.setRoll(rst.getInt("roll"));
				status.setName(rst.getString("name"));
				status.setEmail(rst.getString("email"));
				status.setGender(rst.getString("gender"));
				status.setPass(rst.getString("password"));
				status.setContact(rst.getString("contact"));
				status.setCourse(rst.getString("course"));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
	}

	public static List<Student> getAllData() {
		List<Student> list=new ArrayList<Student>();
		Connection con=StudentDao.getConnection();
		try {
			PreparedStatement preparedStatement=con.prepareStatement("select * from student1");
			ResultSet rst=preparedStatement.executeQuery();
			
			while(rst.next()) {
				Student status=new Student();
				
				status.setRoll(rst.getInt("roll"));
				status.setName(rst.getString("name"));
				status.setEmail(rst.getString("email"));
				status.setGender(rst.getString("gender"));
				status.setPass(rst.getString("password"));
				status.setContact(rst.getString("contact"));
				status.setCourse(rst.getString("course"));
				list.add(status);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
}





