package com.fabricetas.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import com.fabricetas.dao.UserDao;
//import com.fabricetas.model.User;
//
public class UserServiceImpl {// implements UserService {
//
//	@Autowired
//	private UserDao userDao;
//
//	// ------------------- Obtener todos los usuarios --------------------------------------------------------
//
//	@Override
//	public ResponseEntity<List<User>> listAllUsers() {
//		// List<User> users = userService.findAllUsers();
//		List<User> users = userDao.list();
//		
//		if (users.isEmpty()) {
//			return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);
//		}
//		return new ResponseEntity<List<User>>(users, HttpStatus.OK);
//	}
//
//	// ------------------- Obtener un usuario --------------------------------------------------------
//
//	@Override
//	public ResponseEntity<User> getUser(Integer id) {
//		System.out.println("Fetching User with id " + id);
//		User user = userDao.get(Integer.parseInt(id + ""));
//		if (user == null) {
//			System.out.println("User with id " + id + " not found");
//			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
//		}
//		return new ResponseEntity<User>(user, HttpStatus.OK);
//	}
//
//	// ------------------- Crear un usuario --------------------------------------------------------
//
//	@Override
//	public ResponseEntity<Void> createUser(User user) {
//		System.out.println("Creating User " + user.getName());
//
//		if (userDao.get(user.getUserId()) != null) {
//			System.out.println("A User with name " + user.getName()
//					+ " already exist");
//			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//		}
//
//		userDao.saveOrUpdate(user);
//
//		HttpHeaders headers = new HttpHeaders();
////		headers.setLocation(ucBuilder.path("/user/{id}")
////				.buildAndExpand(user.getUserId()).toUri());
//		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
//	}
//
//	// ------------------- Update a User --------------------------------------------------------
//
//	@Override
//	public ResponseEntity<User> updateUser(@PathVariable("id") long id,
//			@RequestBody User user) {
//		System.out.println("Updating User " + id);
//
//		User currentUser = userDao.get(Integer.parseInt(id + ""));
//
//		if (currentUser == null) {
//			System.out.println("User with id " + id + " not found");
//			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
//		}
//
//		currentUser.setName(user.getName());
////		currentUser.setAddress(user.getAddress());
//		currentUser.setIdentificationType(user.getIdentificationType());
//
//		userDao.saveOrUpdate(currentUser);
//		return new ResponseEntity<User>(currentUser, HttpStatus.OK);
//	}
//
//	// ------------------- Borrar un Usuario --------------------------------------------------------
//
//	@Override
//	public ResponseEntity<User> deleteUser(Integer id) {
//		System.out.println("Fetching & Deleting User with id " + id);
//
//		User user = userDao.get(Integer.parseInt(id + ""));
//		if (user == null) {
//			System.out.println("Unable to delete. User with id " + id
//					+ " not found");
//			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
//		}
//
//		userDao.delete(Integer.parseInt(id + ""));
//		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
//	}
//
//	// ------------------- Borrar todos los usuarios --------------------------------------------------------
//
////	@RequestMapping(value = "/user", method = RequestMethod.DELETE)
////	public ResponseEntity<User> deleteAllUsers() {
////		System.out.println("Deleting All Users");
////
////		userService.deleteAllUsers();
////		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
////	}
//
}
