package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.UserDocumentDao;
import com.websystique.springmvc.model.UserDocument;

@Service("userDocumentService")
@Transactional
public class UserDocumentServiceImpl implements UserDocumentService{

	@Autowired
	UserDocumentDao dao;

	public UserDocument findByPath(String path) {
		return dao.findByPath(path);
	}

	public void saveDocument(UserDocument document){
		dao.save(document);
	}

	@Override
	public List<UserDocument> loadTop3News() {
		return dao.findTop3();
	}

	@Override
	public UserDocument findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public void updateDocument(UserDocument document) {
		// TODO Auto-generated method stub
		dao.update(document);
	}

	@Override
	public UserDocument findByCategory(String category) {
		// TODO Auto-generated method stub
		return dao.findByCategory(category);
	}

	@Override
	public List<UserDocument> findAllByCategory(String category) {
		// TODO Auto-generated method stub
		return dao.findAllByCategory(category);
	}

	@Override
	public void deleteDocument(int id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}

}
