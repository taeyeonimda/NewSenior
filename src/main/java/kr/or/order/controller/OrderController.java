package kr.or.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.service.OrderService;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderDetail;
import kr.or.product.model.vo.Product;

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
	
	
	@RequestMapping(value="/orderDetail.do")
	public String orderDetail(Order o, Model model) {
		ArrayList<OrderDetail> list = service.selectOrderDetail(o);
		model.addAttribute("list",list);
	    return "myPage/orderDetailHistory";
	 }
	
	@RequestMapping(value="/insertOrder.do")
	public String insertOrder(Order o,Model model,HttpServletRequest request) {
		int result = service.insertOrder(o);
		
		return "myPage/orderHistory";
	}
	
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(Product p ) {
		int result = service.deleteCart(p);
		return "myPage/cart";
	}
	
	@RequestMapping(value="/goOrderHistory.do")
	public String goOrderHistory(Cart c, Model model) {
		ArrayList<Cart> list = service.goOrderHistory(c);
		model.addAttribute("list", list);
		return "myPage/orderInfo";
	}
	
	
	
	
}
