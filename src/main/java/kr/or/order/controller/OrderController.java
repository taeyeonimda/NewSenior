package kr.or.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Delivery;
import kr.or.member.model.vo.Member;
import kr.or.order.model.service.OrderService;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderDetail;
import kr.or.product.model.vo.Product;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
//	@RequestMapping(value="/orderHistory.do")
//	public String orderHistory(Model model, Order o ) {
//		ArrayList<Order> list = service.selectAllOrderHistory(o);
//		model.addAttribute("list",list);
//		
//		return "myPage/orderHistory";
//	}
//	

	@RequestMapping(value="/orderHistory.do")
	public String orderHistory(Model model, Delivery de ) {
		ArrayList<Delivery> list = service.selectAllOrderHistory(de);
		model.addAttribute("list",list);
		
		return "myPage/orderHistory";
	}
	
	
	
	@RequestMapping(value="/findDate.do")
	public String findDate(Model model,Order o, String startDate,String orderDate, String endDate) {
		o.setStartDate(startDate);
		o.setOrderDate(orderDate);
		o.setEndDate(endDate);
		ArrayList<Order> list2 = service.findDate(o);
		System.out.println(o);
		model.addAttribute("o", o);
		model.addAttribute("list",list2);
		return "myPage/orderHistory";
	}
	
	
	@RequestMapping(value="/orderDetail.do")
	public String orderDetail(OrderDetail od, Model model, int orderNo, int memberNo, int orderPrice) {
		//, int orderNo, int memberNo
		od.setMemberNo(memberNo);
		od.setOrderNo(orderNo);
		od.setOrderPrice(orderPrice);
		
		//ArrayList<Order> list2 = service.selectDetailOrderHistory(o);
		//model.addAttribute("list2",list2);
		//ArrayList<OrderDetail> list = service.selectOrderDetail(o);
		//model.addAttribute("list",list);
	    return "myPage/orderDetailHistory";
	 }
	
//	@RequestMapping(value="/insertOrder.do")
//	public String insertOrder(Order o) {
//		// int[] cartNo,Model model,HttpServletRequest request
//		System.out.println(o);
//		int result = service.insertOrder(o);
//		return "redirect:/orderHistory.do?memberNo="+o.getMemberNo();
//	}
	
	@RequestMapping(value="/goDelivery.do")
	public String goDelivery(Delivery de,Order o) {
		int result1 = service.insertOrder(o);
		
		int result2 = service.gogoDelivery(de);
		
		int result3 = service.deleteOrder(o);
		
		//int result4 = service.insertDetail(o);
		
		return "redirect:/orderHistory.do?memberNo="+de.getMemberNo();
	}
	
	@RequestMapping(value="/goOrderHistory.do")
	public String goOrderHistory(Cart c, Model model) {
		ArrayList<Cart> list = service.goOrderHistory(c);
		model.addAttribute("list", list);
		return "myPage/orderInfo";
	}
	
	@RequestMapping(value="/inputDeliveryInfo.do")
	public String inputDeliveryInfo(Order o) {
		int result = service.inputDeliveryInfo(o);
		return "redirect:/goOrderHistory.do?memberNo="+o.getMemberNo();
	}
	
	
	
}
