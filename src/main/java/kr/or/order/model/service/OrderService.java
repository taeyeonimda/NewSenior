package kr.or.order.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.or.order.model.dao.OrderDao;
import kr.or.order.model.vo.Order;

@Service
public class OrderService {
	private OrderDao dao;

	public ArrayList<Order> selectAllOrderHistory() {
		ArrayList<Order> list = dao.selectAllOrderHistory();
		return (ArrayList<Order>) list;
	}
	
	
}
