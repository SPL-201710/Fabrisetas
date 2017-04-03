package com.fabricetas.dao;

import com.fabricetas.model.User;

import java.util.List;

public interface UserDao {

	User findById(Integer id);
	
	User findBySSO(String sso);
	
	void save(User user);

	void deleteBySSO(String sso);

	void deleteById(Integer sso);
	
	List<User> findAllUsers();

}

