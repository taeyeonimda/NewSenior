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
	private int memberNo;
	private int orderNo;
	private String orderDate;
	private String orderName;
	private String orderDetailAmount;
	private int productNo;
	private int buyAmount;
	private int buyPrice;
	private int orderAmount;
	private int orderPrice;
	private String productName;
	private String receiveName;
	private String receiveAddr;
	private String receivePhone;
	private ArrayList<Product> productList;
}
