package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.User;

public interface UserDao {

    public List<User> list();
     
    public User get(Integer id);
     
    public void saveOrUpdate(User user);
     
    public void delete(Integer id);

}
