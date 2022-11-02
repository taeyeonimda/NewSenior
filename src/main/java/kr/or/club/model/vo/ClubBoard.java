package kr.or.club.model.vo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubBoard {
	private int clubBoardNo;
	private int clubNo;
	private String clubBoardWriter; // 닉네임으로 가져올 것
	private String clubBoardContent;
	private String clubBoardDate;
	private String clubBoardFilepath;
	private int memberNo;
	@Autowired
	private ArrayList<ClubBoardComment> commentList;
}
