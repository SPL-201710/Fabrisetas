package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Camiseta;
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

	@SuppressWarnings("unchecked")
	public List<PersistentFile> findAllByCamisetaId(Integer camisetaId){
		Criteria crit = createEntityCriteria();
		Criteria userCriteria = crit.createCriteria("camiseta");
		userCriteria.add(Restrictions.eq("id", camisetaId));
		return (List<PersistentFile>)crit.list();
	}

	@SuppressWarnings("unchecked")
	public List<PersistentFile> findAllByEstampaId(Integer estampaId){
		Criteria crit = createEntityCriteria();
		Criteria userCriteria = crit.createCriteria("estampa");
		userCriteria.add(Restrictions.eq("id", estampaId));
		return (List<PersistentFile>)crit.list();
	}

	@SuppressWarnings("unchecked")
	public List<PersistentFile> findAllByTemaId(Integer temaId){
		Criteria crit = createEntityCriteria();
		Criteria userCriteria = crit.createCriteria("tema");
		userCriteria.add(Restrictions.eq("id", temaId));
		return (List<PersistentFile>)crit.list();
	}
	
	public void deleteById(Integer id) {
		PersistentFile document =  getByKey(id);
		delete(document);
	}

}
