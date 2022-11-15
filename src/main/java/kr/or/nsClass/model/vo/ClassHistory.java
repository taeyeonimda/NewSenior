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
	private int classHistoryNo;
	private int payNo;
	private int classNo;
	private int memberNo;
	private int amount;
	private int payStatus;
	private int payPrice;
}
