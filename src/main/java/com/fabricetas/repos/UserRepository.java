package com.fabricetas.repos;

import org.springframework.data.repository.CrudRepository;

import com.fabricetas.domain.User;

/**
 * Interface for generic CRUD operations on a repository for a User type.
 * Created on 08/04/2017.
 * @author belman
 * @see org.springframework.data.repository.CrudRepository
 */
public interface UserRepository  extends CrudRepository<User, Integer> {}