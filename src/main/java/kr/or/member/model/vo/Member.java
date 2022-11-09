package kr.or.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo; 		//PRIMARY KEY
	private String memberId; 	//UNIQUE
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAddr;
	private int memberGrade;	// 1회원 2강사 3관리자 NOT NULL
	private String memberBirth;	// YYYY-MM-DD
	private String enrollDate;	// YYYY-MM-DD
	private String nickName; 	//닉네임
	private Date memberState;	// NOT NULL 회원탈퇴시 날짜넣고 몇일뒤 자동삭제
	private String memberImg;	 //UNIQUE
	private String favorite; 	//(N(선택x)/dg/fu/cr/de/ex/fs/me/so/fo/co)
	private int orderNo;
	private char kakaoYN;
}
