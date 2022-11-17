package kr.or.club.model.vo;

import java.util.ArrayList;

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
	private int clubComWriter;
	private String nickName;
	private String clubComContent;
	private String clubComDate;
	private String memberImg;
	private int clubComRef;		// 대댓글이 달린 댓글 참조 // 0이면 없슴
}
