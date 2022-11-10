package kr.or.cart.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.apache.ibatis.javassist.compiler.TokenId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cart.model.dao.CartDao;
import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.product.model.vo.Product;

@Service
public class CartService {
	@Autowired
	private CartDao dao;

	public ArrayList<Cart> selectAllCartList(Member m) {
		ArrayList<Cart> list = dao.selectAllCartList(m);
		return (ArrayList<Cart>) list;
	}

	public boolean deleteCart(String productNoArr, int memberNo) {
		StringTokenizer token = new StringTokenizer(productNoArr, "/");
		boolean result = true;

		while (token.hasMoreTokens()) {
			int proNo = Integer.parseInt(token.nextToken());
			Cart c = new Cart();
			c.setProductNo(proNo);
			c.setMemberNo(memberNo);
			int changeResult = dao.deleteCart(c);
			if (changeResult == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	

	
	
	
	
	

}
