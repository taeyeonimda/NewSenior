package kr.or.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.order.model.vo.Order;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Order> selectAllOrderHistory() {
		List list = sqlSession.selectList("order.selectAllOrderHistory"); 
return (ArrayList<Order>) list;
	}
}
