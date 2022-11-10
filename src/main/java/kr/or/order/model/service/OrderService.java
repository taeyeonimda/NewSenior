package kr.or.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.dao.OrderDao;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderDetail;
import kr.or.product.model.vo.Product;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;

	public ArrayList<Order> selectAllOrderHistory(Member m) {
		ArrayList<Order> list = dao.selectAllOrderHistory(m);
		return (ArrayList<Order>) list;
	}

	
	public ArrayList<OrderDetail> selectOrderDetail(Order o) {
		ArrayList<OrderDetail> list = dao.selectOrderDetail(o);
		return (ArrayList<OrderDetail>) list;
	}

	@Transactional
	public int insertOrder(Order o) {
		int result = dao.insertOrder(o);
		
		
		return result;
	}


	


	public ArrayList<Cart> goOrderHistory(Cart c) {
		ArrayList<Cart> list = dao.goOrderHistory(c);
		return (ArrayList<Cart>) list;
	}
	
	
	
	
	
}
