package com.capgemini.web.hms.service;

import java.util.ArrayList;
import java.util.List;

import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;

public interface IHMSUserService {
	public User login(User user) throws HMSException;

	public int register(User user) throws HMSException;

	public ArrayList<Hotel> searchHotel() throws HMSException;

	public BookingDetails bookHotel(BookingDetails bookingDetails) throws HMSException;

	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException;

	public Hotel getHotelDetails(int hotelId) throws HMSException;

	public RoomDetails specificRoomDetails(int roomId) throws HMSException;

	public void changeRoomAvailability(int roomId) throws HMSException;

	public BookingDetails getBookingDetails(int bookId) throws HMSException;

	public User getUserDetails(String userEmail) throws HMSException;

	public List<BookingDetails> getUserBookings(int userId) throws HMSException;
}
