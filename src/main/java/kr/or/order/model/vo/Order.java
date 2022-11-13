package kr.or.order.model.vo;

import java.util.ArrayList;

import kr.or.product.model.vo.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Order {
	private int orderNo;
	private int memberNo;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private int productNo;
	private String buyName;
	private int buyPrice;
	private int buyAmount;
	
	private String receiveName;
	private String receiveAddr;
	private String receivePhone;
	private String receiveEmail;
	
	private String orderDate;
	private String orderName;
	private String orderDetailAmount;
	private int orderAmount;
	private int orderPrice;
	
	private ArrayList<Product> productList;
}
