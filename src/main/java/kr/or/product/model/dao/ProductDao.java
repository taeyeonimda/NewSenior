package kr.or.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.product.model.vo.Product;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Product> allProduct() {
		List list = sqlSession.selectList("product.allProduct");
		return (ArrayList<Product>)list;
	}
}
