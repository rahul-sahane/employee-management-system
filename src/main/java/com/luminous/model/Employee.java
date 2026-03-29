package com.luminous.model;

public class Employee {
	int id;
	String fullname;
	String email;
	String phoneNumber;
	String departmentName;
	String role;
	String annualSalary;
	String status;
	String dateOfJoining;
	
	public Employee(int id,String fullname, String email, String phoneNumber, String departmentName, String role, String annualSalary, String status,String dateOfJoining) {
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.departmentName = departmentName;
		this.role = role;
		this.annualSalary = annualSalary;
		this.status = status;
		this.dateOfJoining = dateOfJoining;
		}
	
	public int getId() {
		return id;
	}
	
	public String getFullName() {
		return fullname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public String getDapartmentName() {
		return departmentName;
	}
	
	public String getjobTitle() {
		return role;
	}
	
	public String getAnnualSalary() {
		return annualSalary;
	}
	
	public String getStatus() {
		return status;
	}
	
	public String getDateOfJoining() {
		return dateOfJoining;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setAnnualSalary(String annualSalary) {
		this.annualSalary = annualSalary;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", fullname=" + fullname + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", departmentName=" + departmentName + ", jobTitle=" + role + ", annualSalary=" + annualSalary
				+ ", status=" + status + ", dateOfJoining=" + dateOfJoining + "]";
	}
}

