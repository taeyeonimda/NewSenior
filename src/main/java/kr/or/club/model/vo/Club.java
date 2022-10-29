package kr.or.club.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Club {
	private int clubNo;
	private String clubName;	// 클럽명
	private int clubLimit;		// 클럽 최대 인원
	private int clubLeader; 	// 클럽장 닉네임
	private String clubMainImg;	// 클럽 메인 이미지
	private String clubIntro;	// 클럽소개
	private String clubCategory; //
	// private ArrayList<Member> memberList; // 클럽 멤버들의 멤버 객체 리스트
}
