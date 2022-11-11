package kr.or.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;
import kr.or.product.model.vo.Product;

@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Cart> selectAllCartList(Member m) {
		List list = sqlSession.selectList("cart.selectAllCartList", m);
		return (ArrayList<Cart>) list;
	}

	public int deleteCart(Cart c) {
		return sqlSession.delete("cart.deleteCart", c);
	}

	
	public boolean searchSameBook(Cart c) {
		boolean sameCheck = false;
		Cart cart = sqlSession.selectOne("cart.sameCheck",c);
		System.out.println(cart);
		if(cart != null) {	// 뭔가 있음
			sameCheck=true;
		}else {
			sameCheck=false;
		}
		return sameCheck;
	}

	public int insertCart(Cart c) {
		return sqlSession.insert("product.insertCart", c);
	}
	
	public int updateCartQuan(Cart c) {
		return sqlSession.update("cart.updateAmount", c);
	}
	

}
