package kr.or.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int productNo;	// 상품 고유번호
	private int buyAmount;	// 구매 할 수량
	private int buyPrice;	// 구매 할 가격
	private String productType;// P = 키트상품 / A = 액티비티 / C = 클래스
	private String buyName; // product 테이블과 join해서 가져오자
	private int memberNo;
	private String receiveName;
	private String receiveAddr;
	private String productPhoto;
}
