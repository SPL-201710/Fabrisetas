package com.fabricetas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import com.fabricetas.domain.User;
import com.fabricetas.domain.dto.UserDto;
import com.fabricetas.service.UserService;
import com.fabricetas.util.UtilNumber;

/**
 * Controller that responds to http requests related to a user
 * Created on 08/04/2017.
 * @author belman
 * @see org.springframework.stereotype.Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * To create a user
     * @param user for create
     * @return user created
     * @return ucBuilder to response htt status
     */
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> create(@RequestBody User user, UriComponentsBuilder ucBuilder) {
        if (!UtilNumber.isNullOrZero(user.getUserId()))
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        return new ResponseEntity<>(userService.create(user), HttpStatus.CREATED);
    }

    /**
     * Read all users
     * @return user list
     */
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<User>> findAll() {
        List<User> users = userService.findAll();
        if (users.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(users, HttpStatus.OK);
    }
    
	/*
	 * find all user with role artist
	 * @return Collection with all artist
	 */
    @RequestMapping(value = "/role/artist", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<User>> findAllUserWithRoleArtist() {
        List<User> artists = (List<User>) userService.findAllUserWithRoleArtist();
        if (artists.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(artists, HttpStatus.OK);
	}

    /**
     * Read a user by id
     * @param id of the user to find
     * @return found user
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<UserDto> findOne(
		@PathVariable("id") Integer id, 
		@RequestParam(value="fetch", required= false) String fetch) {
    	UserDto userDto = userService.findOneDto(id, fetch);
        if (userDto == null)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(userDto, HttpStatus.OK);
    }

    /**
     * To edit a user
     * @param user to edit
     * @return edited user
     */
    @RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        if (UtilNumber.isNullOrZero(user.getUserId()))
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        else if(!userService.exist(user.getUserId()))
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(userService.update(user), HttpStatus.OK);
    }

    /**
     * To remove a user
     * @param id of the user to remove
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> delete(@PathVariable("id") Integer id) {
        if ( !userService.exist(id) )
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        userService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
