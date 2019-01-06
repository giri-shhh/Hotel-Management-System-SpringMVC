package com.capgemini.web.hms.dao;

import java.util.ArrayList;
import java.util.Date;
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
public class HMSAdminDAOImpl implements IHMSAdminDAO {
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

		try {
			String query = "select user from User user where user.email=:email and user.password=:password and user.role=:role";
			TypedQuery<User> pQuery = entityManager.createQuery(query, User.class);
			pQuery.setParameter("email", user.getEmail());
			pQuery.setParameter("password", user.getPassword());
			pQuery.setParameter("role", user.getRole());
			User userDetails = pQuery.getSingleResult();
			entityManager.flush();
			if (userDetails == null)
				throw new Exception("User details not found");
			else if (userDetails.getEmail().equalsIgnoreCase(user.getEmail())
					&& userDetails.getPassword().equalsIgnoreCase(user.getPassword())
					&& userDetails.getRole().equalsIgnoreCase(user.getRole())) {
				String fetchQuery = "select user from User user where user.email=:userEmail";
				TypedQuery<User> pQuery1 = entityManager.createQuery(fetchQuery, User.class);
				pQuery1.setParameter("userEmail", user.getEmail());
				user = pQuery1.getSingleResult();
				entityManager.flush();
				return user;
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return user;
	}

	@Override
	public int addHotel(Hotel hotel) throws HMSException {
		int hotelId = 0;

		try {
			entityManager.persist(hotel);
			entityManager.flush();

			hotelId = hotel.getId();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return hotelId;
	}

	@Override
	public int deleteHotel(int hotelId) throws HMSException {
		try {
			Hotel hotel = getHotelDetails(hotelId);
			String query = "select roomdetails from RoomDetails roomdetails where roomdetails.hotelId=:hotelId";
			TypedQuery<RoomDetails> pQuery = entityManager.createQuery(query, RoomDetails.class);
			pQuery.setParameter("hotelId", hotelId);
			List<RoomDetails> rooms = pQuery.getResultList();
			if (!rooms.isEmpty())
				throw new Exception("Hotel can not be deleted.Rooms are present.");
			if (hotel == null)
				throw new Exception("Hotel Id is wrong");
			entityManager.remove(hotel);
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return hotelId;
	}

	@Override
	public int modifyHotel(Hotel hotel) throws HMSException {
		int hotelId = 0;

		try {
			entityManager.merge(hotel);
			entityManager.flush();

			hotelId = hotel.getId();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return hotelId;
	}

	@Override
	public List<Hotel> listOfHotel() throws HMSException {
		ArrayList<Hotel> hotels = null;
		try {
			String fetchAllHotels = "from Hotel hotel";
			TypedQuery<Hotel> pQuery = entityManager.createQuery(fetchAllHotels, Hotel.class);
			hotels = (ArrayList<Hotel>) pQuery.getResultList();
			if (hotels.isEmpty())
				throw new Exception("No Hotels to display");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return hotels;
	}

	@Override
	public List<BookingDetails> specificHotelBookings(int hotelId) throws HMSException {
		List<BookingDetails> bookings = null;
		try {
			String fetchRoomIdQuery = "select roomDetails.id from  RoomDetails roomDetails where roomDetails.hotelId=:hotelId and roomDetails.availability='no'";
			TypedQuery<Integer> pQuery1 = entityManager.createQuery(fetchRoomIdQuery, Integer.class);
			pQuery1.setParameter("hotelId", hotelId);
			List<Integer> roomIds = pQuery1.getResultList();
			String fetchBookDetails = "select bookingdetails from BookingDetails bookingdetails where bookingdetails.roomId=:roomId";
			TypedQuery<BookingDetails> pQuery2 = entityManager.createQuery(fetchBookDetails, BookingDetails.class);
			bookings = new ArrayList<>();
			for (Integer roomId : roomIds) {
				pQuery2.setParameter("roomId", roomId);
				List<BookingDetails> bookingDetails = pQuery2.getResultList();
				bookings.addAll(bookingDetails);
			}
			if (bookings.isEmpty()) {
				throw new Exception("No Rooms are booked");
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return bookings;
	}

	@Override
	public List<User> guestOfSpecificHotel(int hotelId) throws HMSException {
		List<User> userList = null;
		List<BookingDetails> bookings = null;
		try {
			String fetchRoomIdQuery = "select roomDetails.id from  RoomDetails roomDetails where roomDetails.hotelId=:hotelId and roomDetails.availability='no'";
			TypedQuery<Integer> pQuery1 = entityManager.createQuery(fetchRoomIdQuery, Integer.class);
			pQuery1.setParameter("hotelId", hotelId);
			List<Integer> roomIds = pQuery1.getResultList();
			String fetchBookDetails = "select bookingdetails from BookingDetails bookingdetails where bookingdetails.roomId=:roomId";
			TypedQuery<BookingDetails> pQuery2 = entityManager.createQuery(fetchBookDetails, BookingDetails.class);
			bookings = new ArrayList<>();
			for (Integer roomId : roomIds) {
				pQuery2.setParameter("roomId", roomId);
				List<BookingDetails> bookingDetails = pQuery2.getResultList();
				bookings.addAll(bookingDetails);
			}
			if (bookings.isEmpty()) {
				throw new Exception("No Rooms are booked");
			}
			String fetchQuery = "select user from User user where user.id=:userId";
			TypedQuery<User> pQuery3 = entityManager.createQuery(fetchQuery, User.class);
			userList = new ArrayList<>();
			for (BookingDetails bookingDetails : bookings) {
				pQuery3.setParameter("userId", bookingDetails.getUserId());
				List<User> users = pQuery3.getResultList();
				userList.addAll(users);
			}
			if (userList.isEmpty()) {
				throw new Exception("No Guests");
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return userList;

	}

	@Override
	public List<BookingDetails> bookingOfSpecificDate(Date date) throws HMSException {
		ArrayList<BookingDetails> bookings = null;
		try {
			String query = "select bookingDetails from Bookingdetails bookingdetails where bookingdetails.bookFrom=:bookDate";
			TypedQuery<BookingDetails> pQuery = entityManager.createQuery(query, BookingDetails.class);
			pQuery.setParameter("bookDate", date);
			bookings = (ArrayList<BookingDetails>) pQuery.getResultList();
			if (bookings.isEmpty())
				throw new Exception("No bookings has been made on " + date);
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return bookings;
	}

	@Override
	public int addRoom(RoomDetails room) throws HMSException {
		int id = 0;

		try {
			entityManager.persist(room);
			entityManager.flush();
			id = room.getId();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return id;
	}

	@Override
	public int deleteRoom(int roomID) throws HMSException {
		int id = 0;

		try {
			RoomDetails deleteRoom = entityManager.find(RoomDetails.class, roomID);
			String query = "select bookingdetails from BookingDetails bookingdetails where bookingdetails.roomId=:roomId";
			TypedQuery<BookingDetails> pQuery = entityManager.createQuery(query, BookingDetails.class);
			pQuery.setParameter("roomId", roomID);
			List<BookingDetails> bookings = pQuery.getResultList();
			if (!bookings.isEmpty()) {
				throw new Exception("cannot delete room. Room is booked.");
			}
			if (deleteRoom == null) {
				throw new Exception("Room with the ID " + roomID + " does not exists");
			} else {
				entityManager.remove(deleteRoom);
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return id;
	}

	@Override
	public int modifyRoom(RoomDetails room) throws HMSException {
		int id = 0;
		try {
			entityManager.merge(room);
			entityManager.flush();
			id = room.getId();
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}

		return id;
	}

	@Override
	public List<RoomDetails> listOfRoom() throws HMSException {
		List<RoomDetails> rooms = null;
		try {
			String query = "from Roomdetails roomdetails";
			TypedQuery<RoomDetails> pQuery = entityManager.createQuery(query, RoomDetails.class);
			rooms = pQuery.getResultList();
			if (rooms.isEmpty())
				throw new Exception("No Rooms present");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return rooms;
	}

	@Override
	public List<RoomDetails> specificHotelRooms(int hotelId) throws HMSException {
		List<RoomDetails> rooms = null;
		try {
			String query = "select roomdetails from RoomDetails roomdetails where roomdetails.hotelId=:hotelId";
			TypedQuery<RoomDetails> pQuery = entityManager.createQuery(query, RoomDetails.class);
			pQuery.setParameter("hotelId", hotelId);
			rooms = pQuery.getResultList();
			if (rooms.isEmpty())
				throw new Exception("No rooms present in this hotel");
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return rooms;
	}

	@Override
	public RoomDetails getRoomDetails(int roomID) throws HMSException {
		RoomDetails roomDetails = null;
		try {
			String query = "select roomdetails from RoomDetails roomdetails where roomdetails.id=:roomId";
			TypedQuery<RoomDetails> pQuery = entityManager.createQuery(query, RoomDetails.class);
			pQuery.setParameter("roomId", roomID);
			roomDetails = pQuery.getSingleResult();
			if (roomDetails == null) {
				throw new Exception("Room Id is wrong");
			}
		} catch (Exception e) {
			throw new HMSException(e.getMessage());
		}
		return roomDetails;
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
}