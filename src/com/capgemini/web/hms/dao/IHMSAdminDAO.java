package com.capgemini.web.hms.dao;

import java.util.Date;
import java.util.List;

import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;

public interface IHMSAdminDAO {

	public int addHotel(Hotel hotel) throws HMSException;

	public int deleteHotel(int hotelId) throws HMSException;

	public int modifyHotel(Hotel hotel) throws HMSException;

	public List<Hotel> listOfHotel() throws HMSException;

	public List<RoomDetails> listOfRoom() throws HMSException;

	public List<BookingDetails> specificHotelBookings(int hotelId) throws HMSException;

	public List<User> guestOfSpecificHotel(int hotelId) throws HMSException;

	public List<BookingDetails> bookingOfSpecificDate(Date date) throws HMSException;

	public int addRoom(RoomDetails room) throws HMSException;

	public int deleteRoom(int roomID) throws HMSException;

	public int modifyRoom(RoomDetails room) throws HMSException;

	public User login(User user) throws HMSException;

	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException;

	public RoomDetails getRoomDetails(int roomID) throws HMSException;

	public Hotel getHotelDetails(int hotelId) throws HMSException;
}
