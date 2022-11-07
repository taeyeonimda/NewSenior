package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delivery {
	private int deliveryNo; //배송번호 seq
	private String deliveryName;  //배송지이름
	private String deliveryPhone; //주문자 전화번호
	private String zipcode; //우편번호
	private String deliveryAddr; //배송지주소
	private String deliveryDetail;  //상세주소
	private String receiverName; //수령인
	private String defaultAddr;  //기본배송지(y)/아님(n)
	private int memberNo; //주문번호(members참조)
}
