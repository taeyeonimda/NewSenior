package kr.or.activity.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Activity {
	private int activityNo;
	private String activityName;
	private String activityPrice;
	private int activityManager;
	private String activityManagerName;// 자바에서만쓰는거 조인해서 이름불러오기
	private String activityIntroduce;
	private String activityDetail;
	private	int activityLimit;
	private String activityCategory;
	private int activityStatus; //'0 : 모집중 /1 : 모집종료 , 클래스 시작 /2 : 클래스 종료'
	private String startDate;
	private String endDate;
	private String filepath;
//	ACTIVITY_NO	        NUMBER	NOT NULL PRIMARY KEY,	-- '액티비티 고유식별번호',
//    ACTIVITY_NAME VARCHAR2(200) NOT NULL, -- 액티비티 이름
//	ACTIVITY_PRICE	    VARCHAR2(20) NOT NULL,
//    ACTIVITY_MANAGER NUMBER REFERENCES MEMBERS, --회원에서 관리자인애들중에 선택
//    ACTIVITY_INTRODUCE VARCHAR2(100) NOT NULL, --한줄짜리 소개
//    ACTIVITY_DETAIL VARCHAR2(4000) NOT NULL, --TEXTAREA로 소개 길게하기 
//	ACTIVITY_LIMIT	    NUMBER	NOT NULL ,	-- '최대로 들어갈 수 있는 회원수',
//	ACTIVITY_CATEGORY	VARCHAR2(30),	-- '디지털 / 주식.재테크 / 공예...',
//	ACTIVITY_STATUS	    NUMBER	NOT NULL,-- '0 : 모집중 /1 : 모집종료 , 클래스 시작 /2 : 클래스 종료'
//    filepath VARCHAR2(300) NOT NULL
}
