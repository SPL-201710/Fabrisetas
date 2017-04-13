package com.fabricetas.dao;

import com.fabricetas.model.PersistentFile;

import java.util.List;

public interface PersistentFileDao {

	List<PersistentFile> findAll();
	
	PersistentFile findById(Integer id);
	
	void save(PersistentFile document);

	List<PersistentFile> findAllByUserId(Integer userId);

	List<PersistentFile> findAllByCamisetaId(Integer camisetaId);

	List<PersistentFile> findAllByEstampaId(Integer estampaId);

	List<PersistentFile> findAllByTemaId(Integer temaId);
	
	void deleteById(Integer id);
}
