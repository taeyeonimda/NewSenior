package kr.or.nsClass.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NsClass {
	private int classNo;
	private String className;
	private int classTeacher;
	private String classPrice;
	private int classLimit; //모집정원
	private int classStatus; //'0 : 모집중 / 1 : 모집종료 , 클래스 시작 / 2 : 클래스 종료 ' 3 승인대기or기타 ->누르면 0으로,
	private String classCategory;
	private char products;
	private String startDate;
	private String endDate;
	private String filepath;
	private String teacherName; // 조인써서 이름불러옴
	private String teacherIntroduce;
	private String curriculum;
	private ArrayList<FileVo> fileList;
}
	
//	CLASS_NO	    NUMBER	NOT NULL PRIMARY KEY,
//    CLASS_NAME      VARCHAR2(200) NOT NULL, --클래스 이름 
//	CLASS_TEACHER   NUMBER	NOT NULL ,--MEMBER_NO 참조 
//	CLASS_PRICE 	VARCHAR2(20)	NOT NULL, -- 20,000원 처럼 ,를 쓰기에 VARCHAR2로 함
//	CLASS_LIMIT	    NUMBER	NOT NULL,	-- '최대로 들어갈 수 있는 회원수',
//	CLASS_STATUS	NUMBER	NOT NULL,	--'0 : 모집중 /1 : 모집종료 , 클래스 시작 /2 : 클래스 종료',
//	CLASS_CATEGORY	CHAR(2),
//    PRODUCTS        CHAR(1), --준비물 필요 여부 0이면 준비물 필요없음, 1이면 준비물 필요함 
//    START_DATE      DATE, --시작날
//    END_DATE        DATE, --종료날 스케쥴로 sysdateㅁ종료날이면 맞으면 종료 업데이트를 status를 2로 
//	FILEPATH        VARCHAR(255)       
