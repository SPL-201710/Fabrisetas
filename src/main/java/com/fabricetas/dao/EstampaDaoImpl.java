package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Estampa;

@Repository
public class EstampaDaoImpl implements EstampaDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public EstampaDaoImpl() {
         
    }
     
    public EstampaDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Estampa> list() {
        @SuppressWarnings("unchecked")
        List<Estampa> listEstampa = (List<Estampa>) sessionFactory.getCurrentSession()
                .createCriteria(Estampa.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listEstampa;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Estampa estampa) {
        sessionFactory.getCurrentSession().saveOrUpdate(estampa);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Estampa estampaToDelete = new Estampa();
        estampaToDelete.setEstampaId(id);
        sessionFactory.getCurrentSession().delete(estampaToDelete);
    }
 
    @Override
    @Transactional
    public Estampa get(Integer id) {
        String hql = "from Estampa where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Estampa> listEstampa = (List<Estampa>) query.list();
         
        if (listEstampa != null && !listEstampa.isEmpty()) {
            return listEstampa.get(0);
        }
         
        return null;
    }
}
