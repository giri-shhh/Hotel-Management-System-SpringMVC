package com.capgemini.web.hms.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capgemini.web.hms.dao.IHMSUserDAO;
import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;

@Service
@Transactional
public class HMSUserServiceImpl implements IHMSUserService {

	@Autowired
	private IHMSUserDAO userDao;

	public IHMSUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(IHMSUserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(User user) throws HMSException {
		return userDao.login(user);
	}

	@Override
	public int register(User user) throws HMSException {
		return userDao.register(user);
	}

	@Override
	public ArrayList<Hotel> searchHotel() throws HMSException {
		return userDao.searchHotel();
	}

	@Override
	public BookingDetails bookHotel(BookingDetails bookingDetails) throws HMSException {
		return userDao.bookHotel(bookingDetails);
	}

	@Override
	public Hotel getHotelDetails(int hotelId) throws HMSException {
		return userDao.getHotelDetails(hotelId);
	}

	@Override
	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException {
		return userDao.specificHotelRooms(hotelId);
	}

	@Override
	public RoomDetails specificRoomDetails(int roomId) throws HMSException {
		return userDao.specificRoomDetails(roomId);
	}

	@Override
	public void changeRoomAvailability(int roomId) throws HMSException {
		userDao.changeRoomAvailability(roomId);
	}

	@Override
	public BookingDetails getBookingDetails(int bookId) throws HMSException {
		return userDao.getBookingDetails(bookId);
	}

	@Override
	public User getUserDetails(String userId) throws HMSException {
		return userDao.getUserDetails(userId);
	}

	@Override
	public List<BookingDetails> getUserBookings(int userId) throws HMSException {
		return userDao.getUserBookings(userId);
	}

}
