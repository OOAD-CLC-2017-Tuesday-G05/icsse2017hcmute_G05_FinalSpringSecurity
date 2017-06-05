package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.model.User;


@Transactional
@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	public User findById(int id) {
		User user = getByKey(id);
		return user;
	}

	public User findBySSO(String sso) {
		System.out.println("SSO : "+sso);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
		User user = (User)crit.uniqueResult();
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<User> users = (List<User>) criteria.list();
		
		return users;
	}

	public void save(User user) {
		persist(user);
	}

	public void deleteById(int id) {
		Criteria crit1 = createEntityCriteria();
		crit1.add(Restrictions.eq("id", id));
		User user = (User)crit1.uniqueResult();
		delete(user);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("email", email));
		User user = (User)crit.uniqueResult();
		return user;
	}

}
