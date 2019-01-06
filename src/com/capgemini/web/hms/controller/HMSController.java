package com.capgemini.web.hms.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.capgemini.web.hms.entities.BookingDetails;
import com.capgemini.web.hms.entities.Hotel;
import com.capgemini.web.hms.entities.RoomDetails;
import com.capgemini.web.hms.entities.User;
import com.capgemini.web.hms.exception.HMSException;
import com.capgemini.web.hms.service.IHMSAdminService;
import com.capgemini.web.hms.service.IHMSUserService;

@Controller
public class HMSController {

	@Autowired
	private IHMSUserService userService;

	@Autowired
	private IHMSAdminService adminService;

	public IHMSUserService getUserService() {
		return userService;
	}

	public void setUserService(IHMSUserService userService) {
		this.userService = userService;
	}

	public IHMSAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IHMSAdminService adminService) {
		this.adminService = adminService;
	}

	@InitBinder("BookingDetails")
	public void customizeBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/getHomePage.html")
	public String getHomePage() {
		return "Home";
	}

	@RequestMapping("/getLoginPage.html")
	public String getLoginPage(@RequestParam("loginType") String loginType, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User user = new User();
		if (loginType.equalsIgnoreCase("Admin")) {
			user.setRole("admin");
		} else if (loginType.equalsIgnoreCase("Employee")) {
			user.setRole("Hotel Employee");
		} else if (loginType.equalsIgnoreCase("User")) {
			user.setRole("User");
		}
		session.setAttribute("user", user);
		model.addAttribute("loginType", loginType);
		session.setAttribute("loginType", loginType);
		return "LoginPage";
	}

	@RequestMapping(value = "/Login.html", method = RequestMethod.POST)
	public String userLogin(Model model, @RequestParam("userEmail") String userEmail,
			@RequestParam("userPassword") String userPassword, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String loginType = (String) session.getAttribute("loginType");
		try {
			User user = (User) session.getAttribute("user");
			user.setEmail(userEmail);
			user.setPassword(userPassword);
			try {
				user = adminService.login(user);
			} catch (Exception e) {
				model.addAttribute("info", "provide valid details");
				session.setAttribute("user", user);
				model.addAttribute("loginType", session.getAttribute("loginType"));
				return "LoginPage";
			}
			if (user != null && user.getRole().equalsIgnoreCase("admin")) {
				List<Hotel> hotels = adminService.listOfHotel();
				model.addAttribute("HotelList", hotels);
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				model.addAttribute("requestType", "1");
				return "adminHome";
			} else if (user != null
					&& (user.getRole().equalsIgnoreCase("user") || user.getRole().equalsIgnoreCase("Hotel Employee"))) {
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				List<Hotel> hotels = adminService.listOfHotel();
				model.addAttribute("HotelList", hotels);
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				model.addAttribute("requestType", "1");
				return "SearchHotel";
			} else {
				return "LoginPage";
			}
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			if (loginType.equalsIgnoreCase("Admin"))
				return "ErrorPage";
			return "UserErrorPage";
		}
	}

	@RequestMapping(value = "/getAdminHomePage.html", method = RequestMethod.GET)
	public String adminHomePage() {
		return "adminHome";
	}

	@RequestMapping("/getUserRegisterPage.html")
	public String getUserRegisterPage(Model model) {
		model.addAttribute("userDetails", new User());
		return "UserRegister";
	}

	@RequestMapping(value = "/userRegister.html", method = RequestMethod.POST)
	public String userRegister(Model model, @ModelAttribute("userDetails") User userDetails,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			userDetails.setRole(user.getRole());
			try {
				userService.register(userDetails);
				model.addAttribute("info", "successfully registered");
			} catch (Exception e) {
				model.addAttribute("info", e.getMessage());
				return "LoginPage";
			}
			return "LoginPage";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "UserErrorPage";
		}
	}

	@RequestMapping("/viewHotelDetails.html")
	public String viewHotelDetails(Model model, @RequestParam("hotelId") int hotelId, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			model.addAttribute("hotelId", hotelId);
			Hotel hotel = adminService.getHotelDetails(hotelId);
			model.addAttribute("hotelDetails", hotel);
			ArrayList<String> hotelPhotos = new ArrayList<>();
			ArrayList<String> roomCategories = new ArrayList<>();
			List<RoomDetails> roomDetails = userService.specificHotelRooms(hotelId);
			int count = 0;
			for (RoomDetails details : roomDetails) {
				if (count < 4) {
					hotelPhotos.add(details.getPhotoPath());
					roomCategories.add(details.getType());
					count++;
				}
			}
			if (hotelPhotos.isEmpty()) {
				hotelPhotos.add(hotel.getPhotoPath());
				model.addAttribute("available", "no");
			}
			model.addAttribute("roomCategories", roomCategories);
			model.addAttribute("hotelPhotos", hotelPhotos);
			model.addAttribute("bookDetails", new BookingDetails());
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "getBookingDetails";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "UserErrorPage";
		}
	}

	@RequestMapping("/viewHotelRooms.html")
	public String viewHotelRooms(@RequestParam("hotelId") int hotelId, Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<RoomDetails> rooms = userService.specificHotelRooms(hotelId);
			model.addAttribute("RoomList", rooms);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "2");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping(value = "/bookHotel.html", method = RequestMethod.POST)
	public String bookHotel(Model model, @ModelAttribute("bookDetails") BookingDetails bookDetails,
			@RequestParam("roomCategory") String roomCategory, @RequestParam("hotelId") int hotelId,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			user = userService.getUserDetails(user.getEmail());
			List<RoomDetails> Rooms = userService.specificHotelRooms(hotelId);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			for (RoomDetails roomDetails : Rooms) {
				if (roomDetails.getType().equalsIgnoreCase(roomCategory)
						&& roomDetails.getAvailability().equalsIgnoreCase("yes")) {
					bookDetails.setRoomId(roomDetails.getId());
					bookDetails.setUserId(user.getId());
					LocalDate fromDate = bookDetails.getBookFrom().toInstant().atZone(ZoneId.systemDefault())
							.toLocalDate();
					LocalDate toDate = bookDetails.getBookTo().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					int days = Period.between(fromDate, toDate).getDays();
					double amount;
					if (user.getRole().equalsIgnoreCase("Hotel Employee")) {
						amount = (roomDetails.getPerNightRate() - roomDetails.getPerNightRate() * 0.1) * days;
					} else {
						amount = roomDetails.getPerNightRate() * days;
					}
					bookDetails.setAmount(amount);
					bookDetails.setPhotoPath(roomDetails.getPhotoPath());
					bookDetails = userService.bookHotel(bookDetails);
					model.addAttribute("roomPhotoPath", roomDetails.getPhotoPath());
				}
			}
			if (bookDetails.getId() == 0) {
				model.addAttribute("errMsg", "Sorry, " + roomCategory + " room is not available");
				return "UserErrorPage";
			}
			model.addAttribute("bookDetails", bookDetails);
			Hotel hotel = userService.getHotelDetails(hotelId);
			model.addAttribute("hotelDetails", hotel);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			String message = "Your Booking has been successfully Done.\n Your Booking Id is :" + bookDetails.getId()
					+ "" + "\nCheck in Date : " + bookDetails.getBookFrom() + "\nCheck out Date : "
					+ bookDetails.getBookTo() + "Amount to be paid : " + bookDetails.getAmount();
			String toMail = user.getEmail();
			String subject = "Your Booking has been successfully Done.";
			sendEmail(message, toMail, subject);
			return "bookSuccess";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "UserErrorPage";
		}
	}

	public void sendEmail(String message, String toMail, String subject) {
		String fromMail = "hotelbookingmanagement@gmail.com";
		String userName = "hotelbookingmanagement";
		String password = "supersix6";
		try {
			Properties props = System.getProperties();

			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");

			Session mailSession = Session.getDefaultInstance(props, null);
			Message mailMessage = new MimeMessage(mailSession);

			mailMessage.setFrom(new InternetAddress(fromMail));
			mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			mailMessage.setContent(message, "text/html");
			mailMessage.setSubject(subject);
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(userName, password);
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
		} catch (Exception e) {
		}
	}

	@RequestMapping("/getHotelMangementPage.html")
	public String getHotelMangementPage() {
		return "HotelManagementPage";
	}

	@RequestMapping("/getRoomMangementPage.html")
	public String getRoomMangementPage() {
		return "RoomManagementPage";
	}

	@RequestMapping("/getGenerateReportPage.html")
	public String getGenerateReportPage() {
		return "getGenerateReportPage";
	}

	@RequestMapping("/getAddHotelPage.html")
	public String getAddHotelPage(Model model, HttpServletRequest request) {
		model.addAttribute("hotelDetails", new Hotel());
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		session.setAttribute("user", user);
		model.addAttribute("userName", user.getName());
		return "AddHotelPage";
	}

	@RequestMapping("/HotelModifyPage.html")
	public String HotelModifyPage(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels;
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "HotelModifyPage";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping(value = "/modifyHotelDetails.html", method = RequestMethod.POST)
	public String modifyHotelDetails(Model model, @ModelAttribute("hotelDetails") Hotel hotelDetails,
			HttpServletRequest request) {
		try {

			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			int hotelId = (int) session.getAttribute("hotelId");
			hotelDetails.setId(hotelId);
			adminService.modifyHotel(hotelDetails);
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/RoomModifyPage.html")
	public String RoomModifyPage(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels;
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "getRoomModifyPage";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping("/getModifyRoomDetailsPage.html")
	public String getModifyRoomDetailsPage(Model model, HttpServletRequest request,
			@RequestParam("hotelId") int hotelId) {
		try {
			HttpSession session = request.getSession(false);
			List<RoomDetails> rooms = userService.specificHotelRooms(hotelId);
			model.addAttribute("RoomList", rooms);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "ModifyRoomDetails";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping("/ModifyRoomDetails.html")
	public String ModifyRoomDetails(Model model, @RequestParam("roomId") int roomId, HttpServletRequest request) {
		try {
			RoomDetails roomDetails = adminService.getRoomDetails(roomId);
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("roomDetails", roomDetails);
			session.setAttribute("roomId", roomId);
			session.setAttribute("hotelId", roomDetails.getHotelId());
			return "ModifyRoomPage";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping(value = "/updateRoomDetails.html", method = RequestMethod.POST)
	public String updateRoomDetails(Model model, @ModelAttribute("roomDetails") RoomDetails roomDetails,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			int roomId = (int) session.getAttribute("roomId");
			int hotelId = (int) session.getAttribute("hotelId");
			roomDetails.setId(roomId);
			roomDetails.setHotelId(hotelId);
			adminService.modifyRoom(roomDetails);
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getModifyHotelDetailsPage.html")

	public String getModifyHotelDetailsPage(Model model, HttpServletRequest request,
			@RequestParam("hotelId") int hotelId) {
		Hotel hotel;
		try {
			hotel = adminService.getHotelDetails(hotelId);
			model.addAttribute("hotelDetails", hotel);
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			session.setAttribute("hotelId", hotelId);
			model.addAttribute("userName", user.getName());
			return "ModifyHotelPage";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping("/DeleteHotelPage.html")
	public String DeleteHotelPage(Model model, HttpServletRequest request) {

		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels;
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "DeleteHotelPage";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getDeleteHotelPage.html")
	public String getDeleteHotelPage(Model model, @RequestParam("hotelId") int hotelId, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			adminService.deleteHotel(hotelId);
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getDeleteRoomHotelsPage.html")
	public String getDeleteRoomHotelsPage(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "getDeleteRoomHotels";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping("/getDeleteRoomPage.html")
	public String getDeleteRoomPage(Model model, @RequestParam("hotelId") int hotelId, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<RoomDetails> rooms = adminService.specificHotelRooms(hotelId);
			model.addAttribute("RoomList", rooms);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "getDeleteRoom";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/DeleteRoom.html")
	public String DeleteRoom(Model model, HttpServletRequest request, @RequestParam("roomId") int roomId) {
		try {
			HttpSession session = request.getSession(false);
			List<Hotel> hotels;
			adminService.deleteRoom(roomId);
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			User user = (User) session.getAttribute("user");
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}

	@RequestMapping(value = "/addHotelDetails.html", method = RequestMethod.POST)
	public String addHotelDetails(Model model, @ModelAttribute("hotelDetails") Hotel hotel,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			adminService.addHotel(hotel);
			model.addAttribute("path", hotel.getPhotoPath());
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getHotelDetailsById.html")
	public String getHotelDetailsById(Model model, @RequestParam("hotelId") int hotelId) {
		try {
			Hotel hotel = adminService.getHotelDetails(hotelId);
			model.addAttribute("hotelDetails", hotel);
			return "ModifyHotelPage";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getAddRoom.html")
	public String getAddRoom(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "addRoom";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getAddRoomPage.html")
	public String getAddRoomPage(Model model, HttpServletRequest request, @RequestParam("hotelId") int hotelId) {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		session.setAttribute("user", user);
		session.setAttribute("hotelId", hotelId);
		model.addAttribute("userName", user.getName());
		model.addAttribute("roomDetails", new RoomDetails());
		return "AddRoomPage";
	}

	@RequestMapping(value = "/addRoomDetails.html", method = RequestMethod.POST)
	public String addRoomDetails(Model model, @ModelAttribute("roomDetails") RoomDetails room,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			int hotelId = (int) session.getAttribute("hotelId");
			room.setHotelId(hotelId);
			int roomId = adminService.addRoom(room);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("roomId", roomId);
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getSearchHotels.html")
	public String getSearchHotels(Model model, @RequestParam("searchStr") String searchStr,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<Hotel> hotels = userService.searchHotel();
			List<Hotel> resultHotels = new ArrayList<>();
			if (searchStr == null || searchStr.isEmpty() || searchStr.equalsIgnoreCase("")) {
				model.addAttribute("HotelList", hotels);
				User user = (User) session.getAttribute("user");
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				model.addAttribute("requestType", "1");
				return "SearchHotel";
			} else {
				for (Hotel hotel : hotels) {
					if (hotel.getName().equalsIgnoreCase(searchStr) || hotel.getCity().equalsIgnoreCase(searchStr)) {
						resultHotels.add(hotel);
						User user = (User) session.getAttribute("user");
						session.setAttribute("user", user);
						model.addAttribute("userName", user.getName());
					}
				}
			}
			if (resultHotels.isEmpty()) {
				model.addAttribute("info", "Sorry, No hotels found.");
				User user = (User) session.getAttribute("user");
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				model.addAttribute("requestType", "1");
				return "SearchHotel";
			}
			model.addAttribute("requestType", "1");
			model.addAttribute("HotelList", resultHotels);
			return "SearchHotel";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getAdminSearchHotels.html")
	public String getAdminSearchHotels(Model model, @RequestParam("searchStr") String searchStr,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<Hotel> hotels = adminService.listOfHotel();
			List<Hotel> resultHotels = new ArrayList<>();
			if (searchStr == null || searchStr.isEmpty() || searchStr.equalsIgnoreCase("")) {
				model.addAttribute("HotelList", hotels);
				User user = (User) session.getAttribute("user");
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				model.addAttribute("requestType", "1");
				return "adminHome";
			} else {
				for (Hotel hotel : hotels) {
					if (hotel.getName().equalsIgnoreCase(searchStr) || hotel.getCity().equalsIgnoreCase(searchStr)) {
						resultHotels.add(hotel);
						User user = (User) session.getAttribute("user");
						session.setAttribute("user", user);
						model.addAttribute("userName", user.getName());
						model.addAttribute("requestType", 1);
					}
				}
			}
			if (resultHotels.isEmpty()) {
				model.addAttribute("errMsg", "Sorry, No hotels found.");
				User user = (User) session.getAttribute("user");
				session.setAttribute("user", user);
				model.addAttribute("userName", user.getName());
				return "ErrorPage";
			}
			model.addAttribute("HotelList", resultHotels);
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/Userlogout.html")
	public String Userlogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "Home";
	}

	@RequestMapping("/getUserHomePage.html")
	public String getUserHomePage(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			List<Hotel> hotels;
			User user = (User) session.getAttribute("user");
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "SearchHotel";
		} catch (HMSException e) {
			model.addAttribute("errMsg", "Something went wrong.");
			return "UserErrorPage";
		}

	}

	@RequestMapping("/getAdminHomePageHotels.html")
	public String getAdminHomePage(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "1");
			return "adminHome";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	/*** generate reports ***/

	@RequestMapping("/getAdminBookingDetails.html")
	public String getAdminBookingDetails(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "AdminBookingDetails";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/AdminBookingDetails.html")
	public String AdminBookingDetails(Model model, HttpServletRequest request, @RequestParam("hotelId") int hotelId) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<BookingDetails> bookings = adminService.specificHotelBookings(hotelId);
			model.addAttribute("BookingList", bookings);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "AdminBookingDetailsPage";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getAdminHotelGuests.html")
	public String getAdminHotelGuests(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<Hotel> hotels;
			hotels = adminService.listOfHotel();
			model.addAttribute("HotelList", hotels);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "getAdminHotelGuests";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getAdminHotelGuestList.html")
	public String getAdminHotelGuestList(Model model, HttpServletRequest request,
			@RequestParam("hotelId") int hotelId) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<User> users = adminService.guestOfSpecificHotel(hotelId);
			model.addAttribute("userList", users);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			return "AdminHotelGuests";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}
	}

	@RequestMapping("/getUserBookings.html")
	public String getUserBookings(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<BookingDetails> bookings = userService.getUserBookings(user.getId());
			model.addAttribute("BookingList", bookings);
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "2");
			return "SearchHotel";
		} catch (HMSException e) {
			model.addAttribute("errMsg", e.getMessage());
			return "UserErrorPage";
		}

	}

	@RequestMapping("/getUserSpecificBooking.html")
	public String getUserSpecificBooking(Model model, HttpServletRequest request,
			@RequestParam("bookingId") int bookingId) {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			List<BookingDetails> bookings = new ArrayList<>();
			session.setAttribute("user", user);
			model.addAttribute("userName", user.getName());
			model.addAttribute("requestType", "2");
			try {
				bookings.add(userService.getBookingDetails(bookingId));
			} catch (HMSException e) {
				model.addAttribute("info", "Sorry no bookings found");
				return "SearchHotel";
			}
			model.addAttribute("BookingList", bookings);
			model.addAttribute("requestType", "2");
			return "SearchHotel";
		} catch (Exception e) {
			model.addAttribute("errMsg", e.getMessage());
			return "ErrorPage";
		}

	}
}