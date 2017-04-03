package com.fabricetas.dao;

import com.fabricetas.model.User;

import java.util.List;

public interface UserDaoBackup {

    public List<User> list();
     
    public User get(Integer id);
     
    public void saveOrUpdate(User user);
     
    public void delete(Integer id);
    
    public List<User> listArtistas();

}
