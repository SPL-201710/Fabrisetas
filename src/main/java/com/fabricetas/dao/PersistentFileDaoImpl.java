package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.PersistentFile;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("persistentFileDao")
public class PersistentFileDaoImpl extends AbstractDao<Integer, PersistentFile> implements PersistentFileDao {

	@SuppressWarnings("unchecked")
	public List<PersistentFile> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<PersistentFile>)crit.list();
	}

	public void save(PersistentFile document) {
		persist(document);
	}

	
	public PersistentFile findById(Integer id) {
		return getByKey(id);
	}

	@SuppressWarnings("unchecked")
	public List<PersistentFile> findAllByUserId(Integer userId){
		Criteria crit = createEntityCriteria();
		Criteria userCriteria = crit.createCriteria("user");
		userCriteria.add(Restrictions.eq("id", userId));
		return (List<PersistentFile>)crit.list();
	}

	
	public void deleteById(Integer id) {
		PersistentFile document =  getByKey(id);
		delete(document);
	}

}
