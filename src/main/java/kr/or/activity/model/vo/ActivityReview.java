package kr.or.activity.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivityReview {
	private int actReviewNo;
	private int activityNo;	
	private int actRiviewWriter;
	private String actReviewContent;
	private int actReviewRate;
	private String actReviewDate;
	
	private String memberName; //join해서 이름불러올꺼
//    ACTIVITY_REVIEW_NO NUMBER PRIMARY KEY,
//    ACTIVITY_NO NUMBER NOT NULL REFERENCES ACTIVITY, 
//    ACTIVITY_REVIEW_WRITER NUMBER,
//    ACTIVITY_REVIEW_CONTENT VARCHAR2(4000),
//    ACTIVITY_REVIEW_RATE NUMBER,
//    ACTIVITY_REVIEW_DATE CHAR(10) --YYYY-MM-DD
}
