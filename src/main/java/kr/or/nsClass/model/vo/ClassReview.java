package kr.or.nsClass.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassReview {
	private int classReviewNo;		// 리뷰식별번호
	private int classNo;			// 리뷰 클래스 번호 고유식별번호
	private int classTeacher;		// 클래스 담당 강사 고유식별번호
	private String reviewWriter;	// 리뷰 작성자 닉네임 가져오기 용
	private int memberNo;	// 리뷰 작성자 넘버
	private String reviewContent;	// 리뷰 내용
	private int reviewRate;			// 리뷰 별점
	private String reviewDate;		// 리뷰 작성일
	private String className;		// 클래스 이름
	private String memberImg;		// 리뷰 작성자의 프로필사진
}
