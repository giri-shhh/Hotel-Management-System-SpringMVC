package com.capgemini.web.hms.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capgemini.web.hms.dao.IHMSAdminDAO;
import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;

@Service
@Transactional
public class HMSAdminServiceImpl implements IHMSAdminService {
	@Autowired
	private IHMSAdminDAO adminDao;

	public IHMSAdminDAO getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(IHMSAdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public int addHotel(Hotel hotel) throws HMSException {
		return adminDao.addHotel(hotel);
	}

	@Override
	public int deleteHotel(int hotelId) throws HMSException {
		return adminDao.deleteHotel(hotelId);
	}

	@Override
	public int modifyHotel(Hotel hotel) throws HMSException {
		return adminDao.modifyHotel(hotel);
	}

	@Override
	public List<Hotel> listOfHotel() throws HMSException {
		return adminDao.listOfHotel();
	}

	@Override
	public List<BookingDetails> specificHotelBookings(int hotelId) throws HMSException {
		return adminDao.specificHotelBookings(hotelId);
	}

	@Override
	public List<User> guestOfSpecificHotel(int hotelId) throws HMSException {
		return adminDao.guestOfSpecificHotel(hotelId);
	}

	@Override
	public List<BookingDetails> bookingOfSpecificDate(Date date) throws HMSException {
		return adminDao.bookingOfSpecificDate(date);
	}

	@Override
	public int addRoom(RoomDetails room) throws HMSException {
		return adminDao.addRoom(room);
	}

	@Override
	public int deleteRoom(int roomID) throws HMSException {
		return adminDao.deleteRoom(roomID);
	}

	@Override
	public int modifyRoom(RoomDetails room) throws HMSException {
		return adminDao.modifyRoom(room);
	}

	@Override
	public List<RoomDetails> listOfRoom() throws HMSException {
		return adminDao.listOfRoom();
	}

	@Override
	public User login(User user) throws HMSException {
		return adminDao.login(user);
	}

	@Override
	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException {
		return adminDao.specificHotelRooms(hotelId);
	}

	@Override
	public RoomDetails getRoomDetails(int roomID) throws HMSException {
		return adminDao.getRoomDetails(roomID);
	}

	@Override
	public Hotel getHotelDetails(int hotelId) throws HMSException {
		return adminDao.getHotelDetails(hotelId);
	}

}
