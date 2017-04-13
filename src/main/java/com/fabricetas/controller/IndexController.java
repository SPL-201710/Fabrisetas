package com.fabricetas.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fabricetas.dao.UserDaoBackup;
import com.fabricetas.model.User;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private UserDaoBackup userDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView handleRequest() throws Exception {
		List<User> listUsers = userDao.list();
		ModelAndView model = new ModelAndView("UserList");
		model.addObject("userList", listUsers);
		return model;
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ResponseEntity<Void> /*ModelAndView*/ newUser() {
		ModelAndView model = new ModelAndView("UserForm");
		model.addObject("user", new User());
		//return model;
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ResponseEntity<Void> /*ModelAndView*/ editUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userDao.get(userId);
		ModelAndView model = new ModelAndView("UserForm");
		model.addObject("user", user);
		//return model;
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ResponseEntity<Void> /*ModelAndView*/ deleteUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDao.delete(userId);
		//return new ModelAndView("redirect:/");
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResponseEntity<Void> /*ModelAndView*/ saveUser(@ModelAttribute User user) {
		userDao.saveOrUpdate(user);
		//return new ModelAndView("redirect:/");
		return new ResponseEntity<>(HttpStatus.OK);
	}

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String getIndexPage() {
//		return "/views/UserManagement.html";
//	}

}
