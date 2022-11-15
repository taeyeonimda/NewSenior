package kr.or.member.model.vo;

import kr.or.member.model.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
	private int fileNo;
	private int memberNo;
	private String filename;
	private String filepath;
}
