package kr.or.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderDetail;
import kr.or.product.model.vo.Product;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Order> selectAllOrderHistory(Member m) {
		List list = sqlSession.selectList("order.selectAllOrderHistory", m);
		return (ArrayList<Order>) list;
	}
	
	
	public ArrayList<OrderDetail> selectOrderDetail(Order o) {
		List list = sqlSession.selectList("order.selectOrderDetail",o);
		return (ArrayList<OrderDetail>) list;
	}


	public int insertOrder(Cart c) {
		int result = sqlSession.insert("order.insertOrder",c);
		return result;
	}


	public int deleteCart(Product p) {
		int result = sqlSession.delete("order.deleteCart", p);
		return result;
	}


	public ArrayList<Cart> goOrderHistory(Cart c) {
		List list = sqlSession.selectList("order.goOrderHistory",c);
		return (ArrayList<Cart>) list;
	}


	
}
