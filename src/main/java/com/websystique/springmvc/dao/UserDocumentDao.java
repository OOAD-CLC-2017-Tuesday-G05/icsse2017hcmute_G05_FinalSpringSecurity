package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.UserDocument;

public interface UserDocumentDao {

	void save(UserDocument document);
	UserDocument findByCategory(String category);
	List<UserDocument> findAllByCategory(String category);
	UserDocument findByPath(String path);
	List<UserDocument> findTop3();
	void update(UserDocument document);
	UserDocument findById(int id);
	void deleteById(int id);
}
