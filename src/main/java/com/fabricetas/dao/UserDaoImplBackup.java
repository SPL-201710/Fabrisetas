package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.User;

@Repository
public class UserDaoImplBackup implements UserDaoBackup {
    @Autowired
    private SessionFactory sessionFactory;
 
    public UserDaoImplBackup() {
         
    }
     
    public UserDaoImplBackup(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<User> list() {
        @SuppressWarnings("unchecked")
        List<User> listUser = (List<User>) sessionFactory.getCurrentSession()
                .createCriteria(User.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listUser;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        User userToDelete = new User();
        userToDelete.setUserId(id);
        sessionFactory.getCurrentSession().delete(userToDelete);
    }
 
    @Override
    @Transactional
    public User get(Integer id) {
        String hql = "from User where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<User> listUser = (List<User>) query.list();
         
        if (listUser != null && !listUser.isEmpty()) {
            return listUser.get(0);
        }
         
        return null;
    }
    
    @Override
    @Transactional
    public List<User> listArtistas() {
        
        String hql = "from User where tipo='Artista'";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        
        @SuppressWarnings("unchecked")
        List<User> listUser = (List<User>) query.list();
        
        if (listUser != null && !listUser.isEmpty()) {
            return listUser;
        }
 
        return null;
    }
}
