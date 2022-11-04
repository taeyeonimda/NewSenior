package kr.or.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;

@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Cart> selectAllCartList(Member m) {
		List list = sqlSession.selectList("cart.selectAllCartList", m);
		return (ArrayList<Cart>) list;
	}

}
