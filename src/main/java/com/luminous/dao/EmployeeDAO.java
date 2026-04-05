package com.luminous.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminous.model.Employee;
import com.luminouse.util.DBConnection;

public class EmployeeDAO {

	public void addEmployee(Employee employee) throws SQLException {
		String addEmployeeQuery = "INSERT INTO SMART_EMPLOYEE_MANAGEMENT (fullName, email, phoneNumber, departmentName, role, annualSalary, status, dateOfJoining) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement psmt = conn.prepareStatement(addEmployeeQuery);) {

			psmt.setString(1, employee.getFullName());
			psmt.setString(2, employee.getEmail());
			psmt.setString(3, employee.getPhoneNumber());
			psmt.setString(4, employee.getDapartmentName());
			psmt.setString(5, employee.getRole());
			psmt.setString(6, employee.getAnnualSalary());
			psmt.setString(7, employee.getStatus());
			psmt.setString(8, employee.getDateOfJoining());

			psmt.executeUpdate();

		}
	}

	public List<Employee> getAllEmployees() throws SQLException {
		List<Employee> employees = new ArrayList<>();

		String getAllEmployeesQuery = "SELECT * FROM SMART_EMPLOYEE_MANAGEMENT";

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllEmployeesQuery);) {
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee(
						rs.getInt("id"), 
						rs.getString("fullName"), 
						rs.getString("email"),
						rs.getString("phoneNumber"), 
						rs.getString("departmentName"), 
						rs.getString("role"),
						rs.getString("annualSalary"), 
						rs.getString("status"), 
						rs.getString("dateOfJoining"));
				employees.add(emp);
			}
		}
		return employees;
	}
	
	public int updateEmployee(Employee employee) throws SQLException {
		
		String updateEmployeeQuery = "UPDATE SMART_EMPLOYEE_MANAGEMENT SET fullName=?, email=?, phoneNumber=?, departmentName=?, role=?, status=?, annualSalary=?, dateOfJoining=? WHERE id=?";
		
		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(updateEmployeeQuery)){
			
			pstmt.setString(1, employee.getFullName());
			pstmt.setString(2, employee.getEmail());
			pstmt.setString(3, employee.getPhoneNumber());
			pstmt.setString(4, employee.getDapartmentName());
			pstmt.setString(5, employee.getRole());
			pstmt.setString(6, employee.getStatus());
			pstmt.setString(7, employee.getAnnualSalary());
			pstmt.setString(8, employee.getDateOfJoining());
			pstmt.setInt(9, employee.getId());
			
			return pstmt.executeUpdate();
		}
	}
}
