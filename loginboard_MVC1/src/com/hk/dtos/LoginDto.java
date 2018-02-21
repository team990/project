package com.hk.dtos;

import java.io.Serializable;
import java.util.Date;

public class LoginDto implements Serializable {

	private static final long serialVersionUID = -2145086687860032164L;
	private int seq;
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String role;
	private Date regDate;
	private String enabled;
	
	
	public LoginDto(String id, String password, String name, String address, String phone, String email) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}


	
	
	public LoginDto(int seq, String address, String phone, String email) {
		super();
		this.seq = seq;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}




	public LoginDto() {
		super();
	}


	@Override
	public String toString() {
		return "LoginDto [seq=" + seq + ", id=" + id + ", password=" + password + ", name=" + name + ", address="
				+ address + ", phone=" + phone + ", email=" + email + ", role=" + role + ", regDate=" + regDate
				+ ", enabled=" + enabled + "]";
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getEnabled() {
		return enabled;
	}


	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}


	public LoginDto(int seq, String id, String password, String name, String address, String phone, String email,
			String role, Date regDate, String enabled) {
		super();
		this.seq = seq;
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.role = role;
		this.regDate = regDate;
		this.enabled = enabled;
	}
	
	
}
