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

		if ("list".equals(action)) {
			// For now, return empty list (until you add getAllEmployees in DAO)
			out.print("{\"success\": true, \"employees\": []}");
		}

		out.flush();
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

			// Auto generate employee joining date
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
