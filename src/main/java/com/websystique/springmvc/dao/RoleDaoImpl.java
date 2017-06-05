package com.websystique.springmvc.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.model.Role;
import com.websystique.springmvc.model.User;

@Transactional
@Repository("roleDao")
public class RoleDaoImpl extends AbstractDao<Integer, Role> implements RoleDao {

	@Override
	public Role findByName(String name) {
		// TODO Auto-generated method stub
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("name", name));
		Role role = (Role)crit.uniqueResult();
		return role;
	}

	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub
		persist(role);
	}
	
}
