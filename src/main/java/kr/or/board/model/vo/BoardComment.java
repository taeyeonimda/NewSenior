package kr.or.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	private int boardCommNo;
	private String boardCommComment;
	private String boardCommDate;
	private int boardRef;
	private int boardCommRef;
	
}
