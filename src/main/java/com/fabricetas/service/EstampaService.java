package com.fabricetas.service;

import com.fabricetas.model.Estampa;

import java.util.List;

public interface EstampaService {
	
	Estampa findById(Integer id);
	
	void saveEstampa(Estampa estampa);
	
	void updateEstampa(Estampa estampa);

	void deleteEstampaById(Integer id);

	List<Estampa> findAllEstampas();

}