package kr.or.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Delivery;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderDetail;
import kr.or.product.model.vo.Product;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Order> selectAllOrderHistory(Order o) {
		List list = sqlSession.selectList("order.selectAllOrderHistory", o);
		return (ArrayList<Order>) list;
	}
	
	
	public ArrayList<OrderDetail> selectOrderDetail(Order o) {
		List list = sqlSession.selectList("order.selectOrderDetail",o);
		return (ArrayList<OrderDetail>) list;
	}

	public ArrayList<Cart> goOrderHistory(Cart c) {
		List list = sqlSession.selectList("order.goOrderHistory",c);
		return (ArrayList<Cart>) list;
	}


	public int goDelivery(Delivery de) {
		int result = sqlSession.insert("order.goDelivery",de);
		return result;
	}


	public int insertOrder(Order o) {
		int result = sqlSession.insert("order.insertOrder",o);
		return result;
	}


	public ArrayList<Order> findDate(Order o) {
		List list = sqlSession.selectList("order.findDate", o);
		return (ArrayList<Order>) list;
	}


	public int deleteOrder(Order o) {
		return sqlSession.delete("order.deleteOrder", o);
	}


	

	
}
