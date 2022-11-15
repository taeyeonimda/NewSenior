package kr.or.cart.controller;

import java.text.DecimalFormat;
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
		/*	DecimalFormat formatter = new DecimalFormat("###,###");
	
		for(int i =0;i<list.size();i++) {
			int a = Integer.parseInt(formatter.format(list.get(i).getBuyPrice()));
			int b = Integer.parseInt(formatter.format(list.get(i).getActivityPrice()));
			System.out.println("프로덕트 가격"+a);
			System.out.println("액티비티 가격"+b);
		}
	*/
		model.addAttribute("list",list);
		
		return "myPage/cart";
	}
	
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(String cartNoArr, int memberNo) {
		boolean result = service.deleteCart(cartNoArr,memberNo);
		System.out.println(cartNoArr);
		return "redirect:/cart.do?memberNo="+memberNo;
				
	}
	
	
	@RequestMapping(value="/insertCart.do")
	public String insertCart(Cart c, int productNo, int buyAmount, Model model) {
		int result = service.insertCart(c, productNo, buyAmount);
//		model.addAttribute("msg","메시지?");
//		model.addAttribute("url", "/cart.do?memberNo="+c.getMemberNo());
//		return "redirect";
		return "redirect:/cart.do?memberNo="+c.getMemberNo();
	}
	
	
		
}
