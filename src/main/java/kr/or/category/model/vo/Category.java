package kr.or.category.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
	private String categoryCode;
	private String categoryName;
	private String categorySecondName;
}
