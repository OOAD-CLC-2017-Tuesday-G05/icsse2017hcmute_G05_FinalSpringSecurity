package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.UserDocument;

public interface UserDocumentService {
	UserDocument findByCategory(String category);
	List<UserDocument> findAllByCategory(String category);
	UserDocument findByPath(String path);
	UserDocument findById(int id);
	void saveDocument(UserDocument document);
	void updateDocument(UserDocument document);
	void deleteDocument(int id);
	List<UserDocument> loadTop3News();
}
