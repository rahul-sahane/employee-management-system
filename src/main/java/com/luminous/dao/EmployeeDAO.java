package com.luminous.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.luminous.model.Employee;
import com.luminouse.util.DBConnection;

public class EmployeeDAO {
	
	public void addEmployee(Employee employee) throws SQLException {
		 String addEmployeeQuery = "INSERT INTO SMART_EMPLOYEE_MANAGEMENT (id, fullName, email, phoneNumber, departmentName, role, annualSalary, status, dateOfJoining) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 
		 try(
				 Connection conn = DBConnection.getConnection();
				 PreparedStatement psmt = conn.prepareStatement(addEmployeeQuery);
				 ){
			 
			 psmt.setInt(1, employee.getId());
			 psmt.setString(2, employee.getFullName());
			 psmt.setString(3, employee.getEmail());
			 psmt.setString(3, employee.getPhoneNumber());
			 psmt.setString(4, employee.getDapartmentName());
			 psmt.setString(5, employee.getjobTitle());
			 psmt.setString(6, employee.getAnnualSalary());
			 psmt.setString(7, employee.getStatus());
			 psmt.setString(8, employee.getDateOfJoining());
			 
			 psmt.executeUpdate();
			 
			 }
	}
}
