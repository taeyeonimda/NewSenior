package kr.or.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	private int boardCommNo;
	private String boardCommContent;
	private String boardCommDate;
	private int boardRef;
	private int boardCommRef;
	private int memberNo;
	//조인해서 추가한 컬럼
	private String nickName;
	private String memberImg;
	
}
