package com.fabricetas.dao;

import com.fabricetas.model.PersistentFile;

import java.util.List;

public interface PersistentFileDao {

	List<PersistentFile> findAll();
	
	PersistentFile findById(Integer id);
	
	void save(PersistentFile document);
	
	List<PersistentFile> findAllByUserId(Integer userId);
	
	void deleteById(Integer id);
}
