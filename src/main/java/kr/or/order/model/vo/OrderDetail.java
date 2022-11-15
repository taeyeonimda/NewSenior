package kr.or.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
	private int orderNo;
	private int orderDetailNo;
	private int orderDetailAmount;
	private int orderPrice;
	private int productNo;
	private String productName;
	private int memberNo;
}
