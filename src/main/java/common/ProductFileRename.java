package common;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class ProductFileRename {
	public String productFileRename(String path, String filename) {
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));
		
		String filepath = null; //실제 업로드 파일명
		int count = 0; //파일명 중복시 숫자
		while(true) {
			if(count == 0) {
				//파일이름이 첫번째  경우
				filepath = onlyFilename + extention;
			} else {
				filepath = onlyFilename + "_" + count + extention;
			}
			File checkFile = new File(path+filepath);
			if(!checkFile.exists()) {
				//중복파일명이 아닐경우 무한반복문 탈출
				break;
			}
			count++;
		}
		return filepath;
	}
	
}
