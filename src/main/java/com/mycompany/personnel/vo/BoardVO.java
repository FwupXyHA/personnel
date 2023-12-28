package com.mycompany.personnel.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {

	private long employee_id;
	private String name;
	private String email;
	private String phone_number;
	private Date hire_date;
	private Date leave_date;
	private String address;
	private long reg_no;
	private String bank_account;
	
	private short department_id;
	private short bank_id;
	private String dept_name;
	
	
	private BankVO bankVO;
	private DeptVO deptVO;


	
	
	
	
	public String getDept_name() {
		return dept_name;
	}
	
	
	
	
	public BankVO getBankVO() {
		return bankVO;
	}
	public void setBankVO(BankVO bankVO) {
		this.bankVO = bankVO;
	}
	public DeptVO getDeptVO() {
		return deptVO;
	}
	public void setDeptVO(DeptVO deptVO) {
		this.deptVO = deptVO;
	}
	
	
	
	
	
	public String getEmployee_id() {
		return String.format("%06d", employee_id);
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getLeave_date() {
		return leave_date;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReg_no() {
		String regNoString = String.valueOf(reg_no);
		if (regNoString.length() ==13) {
			return regNoString.substring(0, 6) + "-" + regNoString.substring(6);
		}
		return regNoString;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = Long.parseLong(reg_no.replaceAll("-", ""));
	}

	public String getBank_account() {
		return bank_account;
	}
	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}




	public short getDepartment_id() {
		return department_id;
	}




	public void setDepartment_id(short department_id) {
		this.department_id = department_id;
	}




	public short getBank_id() {
		return bank_id;
	}




	public void setBank_id(short bank_id) {
		this.bank_id = bank_id;
	}
	
}