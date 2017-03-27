package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Address;

@Repository
public class AddressDaoImpl implements AddressDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public AddressDaoImpl() {
         
    }
     
    public AddressDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Address> list() {
        @SuppressWarnings("unchecked")
        List<Address> listAddress = (List<Address>) sessionFactory.getCurrentSession()
                .createCriteria(Address.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listAddress;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Address address) {
        sessionFactory.getCurrentSession().saveOrUpdate(address);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Address addressToDelete = new Address();
        addressToDelete.setAddressId(id);
        sessionFactory.getCurrentSession().delete(addressToDelete);
    }
 
    @Override
    @Transactional
    public Address get(Integer id) {
        String hql = "from Address where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Address> listAddress = (List<Address>) query.list();
         
        if (listAddress != null && !listAddress.isEmpty()) {
            return listAddress.get(0);
        }
         
        return null;
    }
}
