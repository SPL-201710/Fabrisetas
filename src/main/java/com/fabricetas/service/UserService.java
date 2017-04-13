package com.fabricetas.service;

import com.fabricetas.model.User;

import java.util.List;

public interface UserService {
	
	User findById(Integer id);
	
	User findBySSO(String sso);
	
	void saveUser(User user);
	
	void updateUser(User user);

	void deleteUserBySSO(String sso);

	void deleteUserById(Integer id);

	List<User> findAllUsers(); 
	
	boolean isUserSSOUnique(Integer id, String sso);

}