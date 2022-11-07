package kr.or.activity.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVo {
	private int fileNo;
	private int activityNo;
	private String filename;
	private String filepath;
}
