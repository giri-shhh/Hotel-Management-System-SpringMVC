package com.capgemini.web.hms.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BookingDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "booking_id")
	private int id;

	@Column(name = "room_id")
	private int roomId;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "booked_from")
	private Date bookFrom;

	@Column(name = "booked_to")
	private Date bookTo;

	@Column(name = "no_of_adults")
	private int noOfAdults;

	@Column(name = "no_of_children")
	private int noOfChildren;

	@Column(name = "amount")
	private double amount;

	@Column(name = "photo_path")
	private String photoPath;

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Date getBookTo() {
		return bookTo;
	}

	public void setBookTo(Date bookTo) {
		this.bookTo = bookTo;
	}

	public BookingDetails(int roomId, int userId, Date bookFrom, Date booTo, int noOfAdults, int noOfChildren,
			double amount, String photoPath) {
		super();
		this.roomId = roomId;
		this.userId = userId;
		this.bookFrom = bookFrom;
		this.bookTo = booTo;
		this.noOfAdults = noOfAdults;
		this.noOfChildren = noOfChildren;
		this.amount = amount;
		this.photoPath = photoPath;
	}

	public BookingDetails(int id, int roomId, int userId, Date bookFrom, Date booTo, int noOfAdults, int noOfChildren,
			double amount, String photoPath) {
		super();
		this.id = id;
		this.roomId = roomId;
		this.userId = userId;
		this.bookFrom = bookFrom;
		this.bookTo = booTo;
		this.noOfAdults = noOfAdults;
		this.noOfChildren = noOfChildren;
		this.amount = amount;
		this.photoPath = photoPath;
	}

	public BookingDetails() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getBookFrom() {
		return bookFrom;
	}

	public void setBookFrom(Date bookFrom) {
		this.bookFrom = bookFrom;
	}

	public int getNoOfAdults() {
		return noOfAdults;
	}

	public void setNoOfAdults(int noOfAdults) {
		this.noOfAdults = noOfAdults;
	}

	public int getNoOfChildren() {
		return noOfChildren;
	}

	public void setNoOfChildren(int noOfChildren) {
		this.noOfChildren = noOfChildren;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "BookingDetails [id=" + id + ", roomId=" + roomId + ", userId=" + userId + ", bookFrom=" + bookFrom
				+ ", bookTo=" + bookTo + ", noOfAdults=" + noOfAdults + ", noOfChildren=" + noOfChildren + ", amount="
				+ amount + ", photoPath=" + photoPath + "]";
	}

}