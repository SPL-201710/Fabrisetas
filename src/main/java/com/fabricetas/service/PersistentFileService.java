package com.fabricetas.service;

import com.fabricetas.model.PersistentFile;

import java.util.List;

public interface PersistentFileService {

	PersistentFile findById(Integer id);

	List<PersistentFile> findAll();
	
	List<PersistentFile> findAllByUserId(Integer id);
	
	void saveDocument(PersistentFile document);
	
	void deleteById(Integer id);
}
