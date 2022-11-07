package kr.or.category.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.category.model.vo.Category;

@Repository
public class CategoryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Category> getAllCategory() {
		List list = sqlSession.selectList("category.getAllCategory");
		return (ArrayList<Category>) list;
	}

	public ArrayList<Category> getAllCategory2() {
		List list = sqlSession.selectList("category.withoutAll");
		return (ArrayList<Category>) list;
	}

}
