package kr.or.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductFileVO {
	private int fileNo;
	private int productNo;
	private String fileName;
	private String filePath;
}
