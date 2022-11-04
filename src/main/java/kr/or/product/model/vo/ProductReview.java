package kr.or.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReview {
	private int reviewNo;
	private String reviewContent;
	private String reviewDate;
	private int reviewScore;
	private String memberId;
	private int productNo;
}
