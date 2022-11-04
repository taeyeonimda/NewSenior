package kr.or.cart.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cart.model.service.CartService;
import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	@RequestMapping(value="/cart.do")
	public String cart(Model model, Member m) {
		ArrayList<Cart> list = service.selectAllCartList(m);
		model.addAttribute("list",list);
		System.out.println(m);
		System.out.println(list);
		return "myPage/cart";
	}
}
