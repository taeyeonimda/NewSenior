package kr.or.nsClass.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVo {
	private int fileNo;
	private int classNo;
	private String filename;
	private String filepath;
}
