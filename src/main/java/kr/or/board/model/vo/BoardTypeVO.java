package kr.or.board.model.vo;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardTypeVO {
	private String boardType;
	private String boardName;
	//1:n 관계
	//private List<BoardCategoryVO> categories;

}
