package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.User;


public interface UserDao {

	User findById(int id);
	
	User findByEmail(String email);
	
	User findBySSO(String sso);
	
	void save(User user);
	
	void deleteById(int id);
	
	List<User> findAllUsers();

}

