package kr.or.category.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.category.model.dao.CategoryDao;
import kr.or.category.model.vo.Category;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao dao;
	
	
	public ArrayList<Category> getAllCategory(){
		ArrayList<Category> list = dao.getAllCategory();
		return list;
	}
	public ArrayList<Category> withOutAll(){
		ArrayList<Category> list = dao.getAllCategory2();
		return list;
	}
	
}
