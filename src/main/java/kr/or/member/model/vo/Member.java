package kr.or.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAddr;
	private int memberGrade;	// 1회원 2강사 3관리자
	private String memberBirth;	// YYYY-MM-DD
	private String enrollDate;	// YYYY-MM-DD
	private String nickName;
	private Date memberState;	// 회원탈퇴시 날짜넣고 몇일뒤 자동삭제
	private String memberImg;
	private char favorite;
	
}
