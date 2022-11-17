package kr.or.nsClass.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassHistory {
/*
 * CREATE TABLE CLASS_HISTORY(
    CLASS_HISTORY_NO            NUMBER      PRIMARY KEY,
    CLASS_NO                    NUMBER,
    MEMBER_NO                   NUMBER,
    AMOUNT                      NUMBER,
    CLASS_PAY_STATUS            CHAR(2)
);
 * */
	private int classHistoryNo;  //고유번호
	private int payNo; //
	private int classNo; //클래스 번호*
	private int memberNo; //*
	private int amount; //
	private int payStatus; //
	private int payPrice; //
	private String className; //클래스명*
	private String classTeacher; //강사이름(조인써서이름불러오기)*
	private int classStatus;//1:클래스시작 2:클래스 종료
	private String startDate; //시작일*
	private String endDate; //종료일*
	private String classDate; //총 수강기간
	private String dayDate; //남은 수강 기간
	
	
}
