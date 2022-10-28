package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private String memberEmail;
	private String memberAddr;
	private int memberGrade;	// 1회원 2강사 3관리자
	private String memberBirth; // YYYYMMDD
	private String enrollDate;	// YYYY-MM-DD
	private String nickname;
	private String memberState;	// 회원탈퇴시 날짜넣고 몇일뒤 자동삭제
}
