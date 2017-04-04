package com.fabricetas.controller;

import com.fabricetas.model.Factura;
import com.fabricetas.service.FacturaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FacturaController {

	@Autowired
	private FacturaService facturaService;

	// ------------------- Obtener todas las facturas --------------------------------------------------------

	@RequestMapping(value = "/facturas", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Factura>> listAllFacturas() {
		List<Factura> facturas = facturaService.findAllFacturas();
		
		if (facturas.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(facturas, HttpStatus.OK);
	}

	// ------------------- Obtener una factura por facturaId --------------------------------------------------------

	@RequestMapping(value = "/factura/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Factura> getFactura(@PathVariable("id") long id) {
		System.out.println("Fetching Factura with id " + id);
		Factura factura = facturaService.findById(Integer.parseInt(id + ""));
		if (factura == null) {
			System.out.println("Factura with id " + id + " not found");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(factura, HttpStatus.OK);
	}

	// ------------------- Crear una factura --------------------------------------------------------

	@RequestMapping(value = "/factura-crear", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> createFactura(@RequestBody Factura factura, UriComponentsBuilder ucBuilder) {
		System.out.println("Creating Factura " + factura.getNumber());

		if (facturaService.findById(factura.getFacturaId()) != null) {
			System.out.println("A Factura with name " + factura.getNumber()
					+ " already exist");
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}

		facturaService.saveFactura(factura);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/factura/{id}")
				.buildAndExpand(factura.getFacturaId()).toUri());
		return new ResponseEntity<>(headers, HttpStatus.CREATED);
	}

	// ------------------- Actualizar una factura --------------------------------------------------------

	@RequestMapping(value = "/factura/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Factura> updateFactura(@PathVariable("id") long id,
			@RequestBody Factura factura) {
		System.out.println("Updating Factura " + id);

		Factura currentFactura = facturaService.findById(Integer.parseInt(id + ""));

		if (currentFactura == null) {
			System.out.println("Factura with id " + id + " not found");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		currentFactura.setNumber(factura.getNumber());
		currentFactura.setDate(factura.getDate());
		currentFactura.setItemPrice(factura.getItemPrice());
		currentFactura.setTotalPrice(factura.getTotalPrice());

		facturaService.updateFactura(currentFactura);
		return new ResponseEntity<>(currentFactura, HttpStatus.OK);
	}

	// ------------------- Borrar una factura --------------------------------------------------------

	@RequestMapping(value = "/factura/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Factura> deleteFactura(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Factura with id " + id);

		Factura factura = facturaService.findById(Integer.parseInt(id + ""));
		if (factura == null) {
			System.out.println("Unable to delete. Factura with id " + id
					+ " not found");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		facturaService.deleteFacturaById(Integer.parseInt(id + ""));
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
