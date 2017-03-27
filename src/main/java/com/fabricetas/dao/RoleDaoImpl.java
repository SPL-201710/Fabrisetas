package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Role;

@Repository
public class RoleDaoImpl implements RoleDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public RoleDaoImpl() {
         
    }
     
    public RoleDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Role> list() {
        @SuppressWarnings("unchecked")
        List<Role> listRole = (List<Role>) sessionFactory.getCurrentSession()
                .createCriteria(Role.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listRole;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Role role) {
        sessionFactory.getCurrentSession().saveOrUpdate(role);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Role roleToDelete = new Role();
        roleToDelete.setRoleId(id);
        sessionFactory.getCurrentSession().delete(roleToDelete);
    }
 
    @Override
    @Transactional
    public Role get(Integer id) {
        String hql = "from Role where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Role> listRole = (List<Role>) query.list();
         
        if (listRole != null && !listRole.isEmpty()) {
            return listRole.get(0);
        }
         
        return null;
    }
}
