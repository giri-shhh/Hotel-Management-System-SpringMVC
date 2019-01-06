package com.capgemini.web.hms.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;

@Repository
public class HMSUserDAOImpl implements IHMSUserDAO {

	@PersistenceContext
	private EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public User login(User user) throws HMSException {
		User userDetails = null;
		try {
			String query = "select user from User user where user.id=:userId and user.password=:userPassword";
			TypedQuery<User> pQuery = entityManager.createQuery(query, User.class);
			pQuery.setParameter("userId", user.getId());
			pQuery.setParameter("userPassword", user.getPassword());
			userDetails = pQuery.getSingleResult();
			if (userDetails == null)
				throw new Exception("Wrong Credentails");
			else {
				return userDetails;
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
	}

	@Override
	public int register(User user) throws HMSException {
		int id = 0;
		try {
			String query = "from User user";
			TypedQuery<User> pQuery = entityManager.createQuery(query, User.class);
			List<User> details = pQuery.getResultList();
			for (User userDetail : details) {
				if (userDetail.getEmail().equalsIgnoreCase(user.getEmail()))
					throw new Exception("email already exists, please log in");
			}
			entityManager.persist(user);
			entityManager.flush();
			id = user.getId();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return id;
	}

	@Override
	public ArrayList<Hotel> searchHotel() throws HMSException {
		ArrayList<Hotel> hotels = null;
		try {
			String fetchAllHotelsQuery = "from Hotel hotel";
			TypedQuery<Hotel> pQuery = entityManager.createQuery(fetchAllHotelsQuery, Hotel.class);
			hotels = (ArrayList<Hotel>) pQuery.getResultList();
			if (hotels.isEmpty())
				throw new Exception("No hotels to dislay");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return hotels;
	}

	@Override
	public BookingDetails bookHotel(BookingDetails bookingDetails) throws HMSException {
		try {
			entityManager.persist(bookingDetails);
			entityManager.flush();
			bookingDetails = entityManager.find(BookingDetails.class, bookingDetails.getId());
			entityManager.flush();
			changeRoomAvailability(bookingDetails.getRoomId());
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return bookingDetails;
	}

	@Override
	public Hotel getHotelDetails(int hotelId) throws HMSException {
		Hotel hotel = null;
		try {
			String fetchHotelDetailsQuery = "select hotel from Hotel hotel where id=:hotelId";

			TypedQuery<Hotel> pQuery = entityManager.createQuery(fetchHotelDetailsQuery, Hotel.class);
			pQuery.setParameter("hotelId", hotelId);

			hotel = pQuery.getSingleResult();
			if (hotel == null)
				throw new Exception("Hotel Id is wrong");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return hotel;
	}

	@Override
	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException {
		List<RoomDetails> rooms = null;
		try {
			String fetchRoomsQuery = "select roomDetails from RoomDetails roomDetails where roomDetails.hotelId=:hotelId";
			TypedQuery<RoomDetails> pQeury = entityManager.createQuery(fetchRoomsQuery, RoomDetails.class);
			pQeury.setParameter("hotelId", hotelId);
			rooms = pQeury.getResultList();
			if (rooms.isEmpty())
				throw new Exception("No rooms are present in this Hotel.");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return rooms;
	}

	@Override
	public RoomDetails specificRoomDetails(int roomId) throws HMSException {
		RoomDetails roomDetails = null;
		try {
			String query = "select roomDetails from RoomDetails roomDetails where roomDetails.id=:roomId";
			TypedQuery<RoomDetails> pQuery = entityManager.createQuery(query, RoomDetails.class);
			pQuery.setParameter("roomId", roomId);
			roomDetails = pQuery.getSingleResult();
			if (roomDetails == null)
				throw new Exception("Room Id is wrong");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return roomDetails;
	}

	@Override
	public void changeRoomAvailability(int roomId) throws HMSException {
		try {
			RoomDetails roomDetails = specificRoomDetails(roomId);
			roomDetails.setAvailability("no");
			entityManager.merge(roomDetails);
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
	}

	@Override
	public BookingDetails getBookingDetails(int bookId) throws HMSException {
		BookingDetails bookingDetails = null;
		try {
			String query = "select bookingDetails from BookingDetails bookingDetails where bookingDetails.id=:bookId";
			TypedQuery<BookingDetails> pQuery = entityManager.createQuery(query, BookingDetails.class);
			pQuery.setParameter("bookId", bookId);
			bookingDetails = pQuery.getSingleResult();
			if (bookingDetails == null)
				throw new Exception("Booking Id is wrong");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return bookingDetails;
	}

	@Override
	public User getUserDetails(String userEmail) throws HMSException {
		User user = null;
		try {
			String query = "select user from User user where user.email=:userEmail";
			TypedQuery<User> pQuery = entityManager.createQuery(query, User.class);
			pQuery.setParameter("userEmail", userEmail);
			user = pQuery.getSingleResult();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return user;
	}

	@Override
	public List<BookingDetails> getUserBookings(int userId) throws HMSException {
		List<BookingDetails> bookings = null;
		try {
			String query = "select bookingDetails from BookingDetails bookingDetails where bookingDetails.userId=:userId";
			TypedQuery<BookingDetails> pQuery = entityManager.createQuery(query, BookingDetails.class);
			pQuery.setParameter("userId", userId);
			bookings = pQuery.getResultList();
			if (bookings.isEmpty())
				throw new Exception("No bookings are made");
		} catch (Exception e) {
		}
		return bookings;
	}

}
