package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Role;

public interface RoleDao {
	Role findByName(String name);
	void save(Role role);
}
