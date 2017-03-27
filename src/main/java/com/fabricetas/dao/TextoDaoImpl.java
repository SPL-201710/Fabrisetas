package com.fabricetas.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabricetas.model.Texto;

@Repository
public class TextoDaoImpl implements TextoDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public TextoDaoImpl() {
         
    }
     
    public TextoDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Texto> list() {
        @SuppressWarnings("unchecked")
        List<Texto> listTexto = (List<Texto>) sessionFactory.getCurrentSession()
                .createCriteria(Texto.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listTexto;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Texto texto) {
        sessionFactory.getCurrentSession().saveOrUpdate(texto);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Texto textoToDelete = new Texto();
        textoToDelete.setTextoId(id);
        sessionFactory.getCurrentSession().delete(textoToDelete);
    }
 
    @Override
    @Transactional
    public Texto get(Integer id) {
        String hql = "from Texto where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Texto> listTexto = (List<Texto>) query.list();
         
        if (listTexto != null && !listTexto.isEmpty()) {
            return listTexto.get(0);
        }
         
        return null;
    }
}
