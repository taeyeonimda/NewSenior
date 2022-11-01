package kr.or.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
import kr.or.order.model.service.OrderService;
import kr.or.order.model.vo.Order;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	@RequestMapping(value="/orderHistory.do")
	public String orderHistory(Model model, Member m ) {
		ArrayList<Order> list = service.selectAllOrderHistory(m);
		model.addAttribute("list",list);
		return "myPage/orderHistory";
	}
}
