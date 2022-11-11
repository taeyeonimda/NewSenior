package kr.or.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCategoryVO {
	private String boardCategory; 
	private String categoryName; 
	private String boardType;
	private String boardName;

}
