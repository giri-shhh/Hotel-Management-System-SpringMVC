package com.capgemini.web.hms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class RoomDetails {

	@Column(name = "hotel_id")
	private int hotelId;

	@Id
	@Column(name = "room_id")
	@SequenceGenerator(name = "roomSeq", sequenceName = "user_seq", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "roomSeq")
	private int id;

	@Column(name = "room_no")
	private String number;

	@Column(name = "room_type")
	private String type;

	@Column(name = "per_night_rate")
	private double perNightRate;

	@Column(name = "availability")
	private String availability;

	@Column(name = "photo_path")
	private String photoPath;

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public RoomDetails() {
		super();
	}

	public RoomDetails(int id, String number, String type, double perNightRate, String availability, String photoPath) {
		super();
		this.hotelId = id;
		this.number = number;
		this.type = type;
		this.perNightRate = perNightRate;
		this.availability = availability;
		this.photoPath = photoPath;
	}

	public RoomDetails(int hotelId, int id, String number, String type, double perNightRate, String availability,
			String photoPath) {
		super();
		this.hotelId = hotelId;
		this.id = id;
		this.number = number;
		this.type = type;
		this.perNightRate = perNightRate;
		this.availability = availability;
		this.photoPath = photoPath;
	}

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getPerNightRate() {
		return perNightRate;
	}

	public void setPerNightRate(double perNightRate) {
		this.perNightRate = perNightRate;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	@Override
	public String toString() {
		return "RoomDetails [hotelId=" + hotelId + ", id=" + id + ", number=" + number + ", type=" + type
				+ ", perNightRate=" + perNightRate + ", availability=" + availability + ", photoPath=" + photoPath
				+ "]";
	}

}
