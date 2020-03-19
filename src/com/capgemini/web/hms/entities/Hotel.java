package com.capgemini.web.hms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Hotel")
public class Hotel {
	@Id
	@Column(name = "Hotel_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "city")
	private String city;

	@Column(name = "hotel_name")
	private String name;

	@Column(name = "address")
	private String address;

	@Column(name = "description")
	private String description;

	@Column(name = "avg_rate_per_night")
	private double avgPerNight;

	@Column(name = "phone_no1")
	private String phoneNo1;

	@Column(name = "phone_no2")
	private String phoneNo2;

	@Column(name = "rating")
	private int rating;

	@Column(name = "email")
	private String email;

	@Column(name = "fax")
	private String fax;

	@Column(name = "photo_Path")
	private String photoPath;

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Hotel() {
		super();
	}

	public Hotel(int id, String city, String name, String address, String description, double avgPerNight,
			String phoneNo1, String phoneNo2, int rating, String email, String fax, String photoPath) {
		super();
		this.id = id;
		this.city = city;
		this.name = name;
		this.address = address;
		this.description = description;
		this.avgPerNight = avgPerNight;
		this.phoneNo1 = phoneNo1;
		this.phoneNo2 = phoneNo2;
		this.rating = rating;
		this.email = email;
		this.fax = fax;
		this.photoPath = photoPath;
	}

	public Hotel(String city, String name, String address, String description, double avgPerNight, String phoneNo1,
			String phoneNo2, int rating, String email, String fax, String photoPath) {
		super();
		this.city = city;
		this.name = name;
		this.address = address;
		this.description = description;
		this.avgPerNight = avgPerNight;
		this.phoneNo1 = phoneNo1;
		this.phoneNo2 = phoneNo2;
		this.rating = rating;
		this.email = email;
		this.fax = fax;
		this.photoPath = photoPath;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getAvgPerNight() {
		return avgPerNight;
	}

	public void setAvgPerNight(double avgPerNight) {
		this.avgPerNight = avgPerNight;
	}

	public String getPhoneNo1() {
		return phoneNo1;
	}

	public void setPhoneNo1(String phoneNo1) {
		this.phoneNo1 = phoneNo1;
	}

	public String getPhoneNo2() {
		return phoneNo2;
	}

	public void setPhoneNo2(String phoneNo2) {
		this.phoneNo2 = phoneNo2;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}
}
