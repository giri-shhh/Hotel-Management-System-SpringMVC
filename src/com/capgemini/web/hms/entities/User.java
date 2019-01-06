package com.capgemini.web.hms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@Column(name = "user_id")
	@SequenceGenerator(name = "userSeq", initialValue = 1, sequenceName = "user_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userSeq")
	private int id;

	@Column(name = "user_name")
	private String name;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "phone_no")
	private String mobileNumber;

	@Column(name = "role")
	private String role;

	@Column(name = "address")
	private String address;

	public User() {
		super();
	}

	public User(int id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public User(int id, String name, String password, String email, String mobileNumber, String role, String address) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.role = role;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", mobileNumber="
				+ mobileNumber + ", role=" + role + ", address=" + address + "]";
	}
}
