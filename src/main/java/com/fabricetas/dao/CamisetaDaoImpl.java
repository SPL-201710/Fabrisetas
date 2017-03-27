package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Camiseta;

@Repository
public class CamisetaDaoImpl implements CamisetaDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public CamisetaDaoImpl() {
         
    }
     
    public CamisetaDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Camiseta> list() {
        @SuppressWarnings("unchecked")
        List<Camiseta> listCamiseta = (List<Camiseta>) sessionFactory.getCurrentSession()
                .createCriteria(Camiseta.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listCamiseta;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Camiseta camiseta) {
        sessionFactory.getCurrentSession().saveOrUpdate(camiseta);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Camiseta camisetaToDelete = new Camiseta();
        camisetaToDelete.setCamisetaId(id);
        sessionFactory.getCurrentSession().delete(camisetaToDelete);
    }
 
    @Override
    @Transactional
    public Camiseta get(Integer id) {
        String hql = "from Camiseta where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Camiseta> listCamiseta = (List<Camiseta>) query.list();
         
        if (listCamiseta != null && !listCamiseta.isEmpty()) {
            return listCamiseta.get(0);
        }
         
        return null;
    }
}
