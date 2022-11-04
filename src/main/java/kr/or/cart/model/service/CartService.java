package kr.or.cart.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cart.model.dao.CartDao;
import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;

@Service
public class CartService {
	@Autowired
	private CartDao dao;

	public ArrayList<Cart> selectAllCartList(Member m) {
		ArrayList<Cart> list = dao.selectAllCartList(m);
		System.out.println(list);
		System.out.println(m);
		return (ArrayList<Cart>) list;
	}

}
