package kr.or.club.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubBoardComment {
	private int clubComNo;
	private int clubNo;
	private int clubBoardNo;
	private String clubComWriter;
	private String clubComContent;
	private String clubComDate;
	private int clubComRef;		// 대댓글이 달린 댓글 참조
}
