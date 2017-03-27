package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Tema;

@Repository
public class TemaDaoImpl implements TemaDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public TemaDaoImpl() {
         
    }
     
    public TemaDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Tema> list() {
        @SuppressWarnings("unchecked")
        List<Tema> listTema = (List<Tema>) sessionFactory.getCurrentSession()
                .createCriteria(Tema.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listTema;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Tema tema) {
        sessionFactory.getCurrentSession().saveOrUpdate(tema);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Tema temaToDelete = new Tema();
        temaToDelete.setTemaId(id);
        sessionFactory.getCurrentSession().delete(temaToDelete);
    }
 
    @Override
    @Transactional
    public Tema get(Integer id) {
        String hql = "from Tema where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Tema> listTema = (List<Tema>) query.list();
         
        if (listTema != null && !listTema.isEmpty()) {
            return listTema.get(0);
        }
         
        return null;
    }
}
