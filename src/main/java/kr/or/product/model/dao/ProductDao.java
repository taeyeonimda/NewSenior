package kr.or.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.product.model.vo.Product;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Product> allProduct(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.allProduct",map);
		return (ArrayList<Product>)list;
	}

	public int selectProductCount() {
		return sqlSession.selectOne("product.selectCount");
	}

	public int insertProduct(Product p) {
		int result = sqlSession.insert("product.insertProduct",p);
		return result;
	}
}
