package com.fabricetas.service;

import com.fabricetas.model.Factura;

import java.util.List;

public interface FacturaService {
	
	Factura findById(Integer id);
	
	void saveFactura(Factura factura);
	
	void updateFactura(Factura factura);

	void deleteFacturaById(Integer id);

	List<Factura> findAllFacturas();

}