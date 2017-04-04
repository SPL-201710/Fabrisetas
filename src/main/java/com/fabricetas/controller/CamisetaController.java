package com.fabricetas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.fabricetas.config.View;
import com.fabricetas.dao.CamisetaDao;
import com.fabricetas.model.Camiseta;
import com.fabricetas.model.Estampa;
import com.fabricetas.model.Tema;
import com.fabricetas.model.Texto;
import com.fabricetas.model.User;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CamisetaController {

	@Autowired
	private CamisetaDao camisetaDao;
	
//	@Autowired
//	private CamisetaService camisetaService;

	// ------------------- Obtener todos los usuarios --------------------------------------------------------

	@JsonView(View.Summary.class)
	@RequestMapping(value = "/camiseta", method = RequestMethod.GET)
	public ResponseEntity<List<Camiseta>> listAllCamisetas() {
//		 List<Camiseta> camisetas = camisetaService.listAllCamisetas();
		List<Camiseta> camisetas = camisetaDao.list();
		
		if (camisetas.isEmpty()) {
			return new ResponseEntity<List<Camiseta>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Camiseta>>(camisetas, HttpStatus.OK);
	}

	// ------------------- Obtener un usuario --------------------------------------------------------

	@RequestMapping(value = "/camiseta/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Camiseta> getCamiseta(@PathVariable("id") long id) {
		System.out.println("Fetching Camiseta with id " + id);
		Camiseta camiseta = camisetaDao.get(Integer.parseInt(id + ""));
		if (camiseta == null) {
			System.out.println("Camiseta with id " + id + " not found");
			return new ResponseEntity<Camiseta>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Camiseta>(camiseta, HttpStatus.OK);
	}

	// ------------------- Crear un usuario --------------------------------------------------------

	@RequestMapping(value = "/camiseta", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> createCamiseta(@RequestBody ModelMap camiseta,
			UriComponentsBuilder ucBuilder) {

		try
		{
			Camiseta currentCamiseta = new Camiseta();
			
			Texto texto = new Texto();
			texto.setTextoId(1);
			User user = new User();
			user.setUserId(1);
			
			currentCamiseta.setNombre(camiseta.get("nombre").toString());
			currentCamiseta.setDescripcion(camiseta.get("descripcion").toString());
			currentCamiseta.setUrlCamiseta(camiseta.get("urlImagen").toString());
			currentCamiseta.setValor(camiseta.get("valor").toString());
			currentCamiseta.setColor("Estandar");
			currentCamiseta.setMaterial("Estandar");
			currentCamiseta.setUser(user);
			currentCamiseta.setTexto(texto);
			
			camisetaDao.saveOrUpdate(currentCamiseta);
			
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		catch(Exception e)
		{
			System.out.print(e.toString());
			return new ResponseEntity<Void>(HttpStatus.NOT_MODIFIED);
		}
		
	}

	// ------------------- Actualizar un usuario --------------------------------------------------------

	@RequestMapping(value = "/camiseta/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Camiseta> updateCamiseta(@PathVariable("id") long id,
			@RequestBody ModelMap camiseta) {
		System.out.println("Updating Camiseta " + id);

		Camiseta currentCamiseta = camisetaDao.get(Integer.parseInt(id + ""));

		if (currentCamiseta == null) {
			System.out.println("Camiseta with id " + id + " not found");
			return new ResponseEntity<Camiseta>(HttpStatus.NOT_FOUND);
		}
		
		try
		{
			currentCamiseta.setNombre(camiseta.get("nombre").toString());
			currentCamiseta.setDescripcion(camiseta.get("descripcion").toString());
			currentCamiseta.setUrlCamiseta(camiseta.get("urlImagen").toString());
			currentCamiseta.setValor(camiseta.get("valor").toString());
			
			camisetaDao.saveOrUpdate(currentCamiseta);
			
			return new ResponseEntity<Camiseta>(currentCamiseta, HttpStatus.OK);
		}
		catch(Exception e)
		{
			return new ResponseEntity<Camiseta>(HttpStatus.NOT_MODIFIED);
		}
		
	}

	// ------------------- Borrar un Usuario --------------------------------------------------------

	@RequestMapping(value = "/camiseta/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Camiseta> deleteCamiseta(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Camiseta with id " + id);

		Camiseta camiseta = camisetaDao.get(Integer.parseInt(id + ""));
		if (camiseta == null) {
			System.out.println("Unable to delete. Camiseta with id " + id
					+ " not found");
			return new ResponseEntity<Camiseta>(HttpStatus.NOT_FOUND);
		}

		camisetaDao.delete(Integer.parseInt(id + ""));
		return new ResponseEntity<Camiseta>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Borrar todos los usuarios --------------------------------------------------------

//	@RequestMapping(value = "/camiseta", method = RequestMethod.DELETE)
//	public ResponseEntity<Camiseta> deleteAllCamisetas() {
//		System.out.println("Deleting All Camisetas");
//
//		camisetaService.deleteAllCamisetas();
//		return new ResponseEntity<Camiseta>(HttpStatus.NO_CONTENT);
//	}

}
