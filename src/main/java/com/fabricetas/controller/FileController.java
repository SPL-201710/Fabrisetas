package com.fabricetas.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import com.fabricetas.model.*;
import com.fabricetas.service.*;
import com.fabricetas.util.FileValidator;
import org.apache.commons.codec.binary.Base64;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/")
public class FileController {

	@Autowired
	UserService userService;

	@Autowired
	CamisetaService camisetaService;

	@Autowired
	EstampaService estampaService;

	@Autowired
	TemaService temaService;
	
	@Autowired
	PersistentFileService persistentFileService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	FileValidator fileValidator;
	
	@InitBinder("transientFile")
	protected void initBinder(WebDataBinder binder) {
	   binder.setValidator(fileValidator);
	}
	
	/**
	 * Este método retorna todo los usuarios.
	 */
	@RequestMapping(value = { "/file", "/file-list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "userslist";
	}

	/**
	 * Este método responde a una petición GET para enviar
     * un usuario vacio a la pantalla de creación
	 */
	@RequestMapping(value = { "/file-newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		return "registration";
	}

	/**
	 * Este método responde a una petición POST para crear un usuario
	 */
	@RequestMapping(value = { "/file-newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors())
			return "registration";

		userService.saveUser(user);
		
		model.addAttribute("user", user);
		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
		//return "success";
		return "registrationsuccess";
	}


	/**
	 * Este método responde a peticion GET para enviar
     * un usuario vacio a la pantalla de actualización
	 */
	@RequestMapping(value = { "/file-edit-user-{userId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable Integer userId, ModelMap model) {
		User user = userService.findById(userId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return "registration";
	}
	
	/**
	 * Este método responde a una petición POST para actualizar un usuario
	 */
	@RequestMapping(value = { "/file-edit-user-{userId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model, @PathVariable Integer userId) {

		if (result.hasErrors()) {
			return "registration";
		}

		userService.updateUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		return "registrationsuccess";
	}

    /**
     * Este método responde a una peticion GET para borrar un usuario
     * @param userId
     * @return
     */
	@RequestMapping(value = { "/file-delete-user-{userId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer userId) {
		userService.deleteUserById(userId);
		return "redirect:/list";
	}

	/**
	 * Este método retorna todos los documentos de un usuario
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.GET)
	public ResponseEntity<List<PersistentFile>> /*String*/ addDocuments(@PathVariable Integer userId, ModelMap model) {
		User user = userService.findById(userId);
		model.addAttribute("user", user);

		TransientFile fileModel = new TransientFile();
		model.addAttribute("transientFile", fileModel);

		List<PersistentFile> documents = persistentFileService.findAllByUserId(userId);

		for (PersistentFile document: documents)
			document.setImage(new String(Base64.encodeBase64(document.getContent())));

		model.addAttribute("documents", documents);

		//return "managedocuments";
		return new ResponseEntity<>(documents, HttpStatus.OK);
	}

	/**
	 * Este método retorna todas las imagenes de una camiseta configurada
	 * @param camisetaId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add-camiseta-{camisetaId}" }, method = RequestMethod.GET)
	public ResponseEntity<List<PersistentFile>> /*String*/ addCamisetaImagen(@PathVariable Integer camisetaId, ModelMap model) {
		Camiseta camiseta = camisetaService.findById(camisetaId);
		//model.addAttribute("user", user);

		TransientFile fileModel = new TransientFile();
		model.addAttribute("transientFile", fileModel);

		List<PersistentFile> documents = persistentFileService.findAllByCamisetaId(camisetaId);

		for (PersistentFile document: documents)
			document.setImage(new String(Base64.encodeBase64(document.getContent())));

		model.addAttribute("documents", documents);

		//return "managedocuments";
		return new ResponseEntity<>(documents, HttpStatus.OK);
	}

	/**
	 * Este método retorna todos los documentos de un usuario
	 * @param estampaId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add-estampa-{estampaId}" }, method = RequestMethod.GET)
	public ResponseEntity<List<PersistentFile>> /*String*/ addEstampaImagen(@PathVariable Integer estampaId, ModelMap model) {
		Estampa estampa = estampaService.findById(estampaId);
		//model.addAttribute("user", user);

		TransientFile fileModel = new TransientFile();
		model.addAttribute("transientFile", fileModel);

		List<PersistentFile> documents = persistentFileService.findAllByEstampaId(estampaId);

		for (PersistentFile document: documents)
			document.setImage(new String(Base64.encodeBase64(document.getContent())));

		model.addAttribute("documents", documents);

		//return "managedocuments";
		return new ResponseEntity<>(documents, HttpStatus.OK);
	}

	/**
	 * Este método retorna todos los documentos de un usuario
	 * @param temaId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add-tema-{temaId}" }, method = RequestMethod.GET)
	public ResponseEntity<List<PersistentFile>> /*String*/ addTemaImagen(@PathVariable Integer temaId, ModelMap model) {
		Tema tema= temaService.findById(temaId);
		//model.addAttribute("user", user);

		TransientFile fileModel = new TransientFile();
		model.addAttribute("transientFile", fileModel);

		List<PersistentFile> documents = persistentFileService.findAllByTemaId(temaId);

		for (PersistentFile document: documents)
			document.setImage(new String(Base64.encodeBase64(document.getContent())));

		model.addAttribute("documents", documents);

		//return "managedocuments";
		return new ResponseEntity<>(documents, HttpStatus.OK);
	}

    /**
     * Este método responde a una peticion GET para descargar un documento
     * de un usuario particular
     * @param userId
     * @param docId
     * @param response
     * @return
     * @throws IOException
     */
	@RequestMapping(value = { "/download-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public ResponseEntity<Void> /*String*/ downloadDocument(@PathVariable Integer userId, @PathVariable Integer docId, HttpServletResponse response) throws IOException {
			PersistentFile document = persistentFileService.findById(docId);
		response.setContentType(document.getType());
        response.setContentLength(document.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");
 
        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
 
 		//return "redirect:/add-document-"+userId;
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

    /**
     * Este método responde a una peticion GET para borrar un documento
     * de un usuario particular
     * @param userId
     * @param docId
     * @return
     */
	@RequestMapping(value = { "/delete-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public ResponseEntity<Void> /*String*/ deleteDocument(@PathVariable Integer userId, @PathVariable Integer docId) {
		persistentFileService.deleteById(docId);
		//return "redirect:/add-document-"+userId;
		return new ResponseEntity<>(HttpStatus.OK);
	}

    /**
     * Este método responde a una petición GET para subir una imagen
     * de un usuario particular
     * @param transientFile
     * @param result
     * @param model
     * @param userId
     * @return
     * @throws IOException
     */
	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid TransientFile transientFile, BindingResult result, ModelMap model, @PathVariable Integer userId) throws IOException{
		
		if (result.hasErrors()) {
			System.out.println("validation errors");
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			List<PersistentFile> documents = persistentFileService.findAllByUserId(userId);
			model.addAttribute("documents", documents);
			
			return "managedocuments";
		} else {
			
			System.out.println("Fetching file");
			
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			saveDocument(transientFile, user);

			return "redirect:/add-document-"+userId;
		}
	}
	
	private void saveDocument(TransientFile transientFile, User user) throws IOException{
		
		PersistentFile document = new PersistentFile();
		
		MultipartFile multipartFile = transientFile.getFile();
		
		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(transientFile.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setUser(user);
		persistentFileService.saveDocument(document);
	}
	
}
