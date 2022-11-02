package kr.or.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.order.model.dao.OrderDao;
import kr.or.order.model.vo.Order;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;

	public ArrayList<Order> selectAllOrderHistory(Member m) {
		ArrayList<Order> list = dao.selectAllOrderHistory(m);
		return (ArrayList<Order>) list;
	}
	
}
