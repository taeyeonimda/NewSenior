package common;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class FileRename {

	public String fileRename(String path, String filename) {
		// 파일 중복이름 체크 메서드
		// 최종적으로 사용할 파일 path를 돌려주는 클래스
		// 첫번재 매개변수 : upload다음에 올 파일명 받는다
		
		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); // onlyFilename=test
		String extention = filename.substring(filename.lastIndexOf("."));	// .txt
		
		// 실제 업로드할 파일 명
		String filepath = null;
		// 파일명이 중복되는 경우 뒤에 붙일 숫자
		int count = 0;
		while(true) {
			if(count==0) {
				// 파일이름체크 첫번째인 경우
				filepath = onlyFilename+extention;
				
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			File checkFile = new File(path+filepath);
			if(!checkFile.exists()) {
				// 중복파일명이 아닌 경우 무한 반복문 나가기
				break;
			}
			count++;
		}
		return filepath;
	}
}
