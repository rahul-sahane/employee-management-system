package com.luminous.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import com.luminous.dao.EmployeeDAO;
import com.luminous.model.Employee;

public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Allow cross-origin requests so frontend works from any URL
	private void setCorsHeaders(HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	}

	@Override
	protected void doOptions(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		setCorsHeaders(response);
		response.setStatus(HttpServletResponse.SC_OK);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		setCorsHeaders(response);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		EmployeeDAO employeeDAO = new EmployeeDAO();

		if ("list".equals(action)) {
		// return list of employee in json format
			try {
				// calling a method to fetch all employee data from database with the help of EmployeeDAO class
				List<Employee> empList = employeeDAO.getAllEmployees();
				StringBuilder json = new StringBuilder();
				json.append("{\"success\": true, \"message\": \"\", \"employees\": [");
				for (int i = 0; i < empList.size(); i++) {
					Employee emp = empList.get(i);
					if (i > 0) json.append(",");
					json.append("{");
					json.append("\"id\":\"").append(emp.getId()).append("\",");
					json.append("\"name\":\"").append(emp.getFullName()).append("\",");
					json.append("\"email\":\"").append(emp.getEmail()).append("\",");
					json.append("\"phone\":\"").append(emp.getPhoneNumber()).append("\",");
					json.append("\"department\":\"").append(emp.getDapartmentName()).append("\",");
					json.append("\"role\":\"").append(emp.getRole()).append("\",");
					json.append("\"salary\":").append(emp.getAnnualSalary()).append(",");
					json.append("\"status\":\"").append(emp.getStatus()).append("\",");
					json.append("\"joinDate\":\"").append(emp.getDateOfJoining()).append("\"");
					json.append("}");
				}
				json.append("]}");
				out.print(json.toString());
			}catch (SQLException e) {
				out.println("{\"success\": false, \"message\": \"Failed to fetch Employees data!\", \"employees\": []}");
			}
		}

		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		setCorsHeaders(response);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		EmployeeDAO employeeDAO = new EmployeeDAO();
		String action = request.getParameter("action");

		if ("add".equals(action)) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String department = request.getParameter("department");
			String role = request.getParameter("role");
			String salary = request.getParameter("salary");
			String status = request.getParameter("status");

			// generate default employee joining date 
			String date = java.time.LocalDate.now().toString();

			Employee employee = new Employee(0, name, email, phone, department, role, salary, status, date);
			try {
				employeeDAO.addEmployee(employee);
				out.print("{\"success\": true, \"message\": \"Employee added successfully!\"}");
			} catch (SQLException e) {
				out.print("{\"success\": false, \"message\": \"Failed to add employee!\"}");
				e.printStackTrace();
			}
		}
		
		if("update".equals(action)) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String department = request.getParameter("department");
			String role = request.getParameter("role");
			String salary = request.getParameter("salary");
			String status = request.getParameter("status");

			// generate default employee joining date 
			String date = java.time.LocalDate.now().toString();
			
			Employee employee = new Employee(id, name, email, phone, department, role, salary, status, date);
			
			try {
				int rowsUpdated = employeeDAO.updateEmployee(employee);
				
				//checking row updated or not
				if (rowsUpdated > 0) {
					out.print("{\"success\": true, \"message\": \"Employee updated!\"}");
				} else {
					out.print("{\"success\": false, \"message\": \"Employee not found with id: " + id + "\"}");
				}
			}catch (SQLException e){
				out.print("{\"success\": false, \"message\": \"Employee updation failed: " + e.getMessage() + "\"}");
				e.printStackTrace();
			}
			
		}

		out.flush();
	}

}
