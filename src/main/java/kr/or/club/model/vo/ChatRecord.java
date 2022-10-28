package kr.or.club.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRecord {
	private int chatNo;
	private String chatClub;
	private String chatContent;
	private String chatDate;
	private String chatMember; // 채팅을 보낸 아이디
	private String filepath; // 파일경로 
}
