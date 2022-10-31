package kr.or.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private String baordDate;
	private String boardType;
	private String boardCategory;
}
