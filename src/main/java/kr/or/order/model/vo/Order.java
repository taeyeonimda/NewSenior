package kr.or.order.model.vo;

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
	private int orderAmount;
	private int orderPrice;
}
