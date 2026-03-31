package com.luminous.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.luminous.dao.EmployeeDAO;
import com.luminous.model.Employee;

public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		EmployeeDAO employeeDAO = new EmployeeDAO();
		

		if ("list".equals(action)) {
		// return list of employee in json format
			try {
				// calling a method to fetch all employee data from database with the help of EmployeeDAO class
				employeeDAO.getAllEmployees();
				out.print("{\"success\": true, \"mesaage\": \" \"}");
			}catch (SQLException e) {
				out.println("{\"success\": false, \"message\": \"Failed to fetch Employees data!\"}");
			}
		}

		//out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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

		out.flush();
	}

}
