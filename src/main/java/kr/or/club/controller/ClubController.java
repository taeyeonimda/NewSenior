package kr.or.club.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;


@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value = "/clubList.do")
	public String classList(Model model) {
		// 실제는 회원의 카테고리를 가져옴
		ArrayList<Club> list = service.selectAllClub();
		model.addAttribute("list", list);
		return "club/clubList";
	}	
	@RequestMapping(value = "/insertClubFrm.do")
	public String insertClubFrm() {
		return "club/insertClubFrm";
	}
	@RequestMapping(value = "/insertClub.do")
	public String insertClub(Club c, MultipartFile[] files, HttpServletRequest request) {
		System.out.println(files);
		if(!files[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/club/");
			for(MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					try {
						byte[] bytes = file.getBytes();
						bos.write(bytes);
						bos.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				c.setClubMainImg(filepath);
			}// for문 종료
		}
		// c.setFileList(list); 여러개 일 때 살리기
		int result = service.insertClub(c);
		return "redirect:/clubList.do";
	}
	@RequestMapping(value = "/clubDetail.do")
	public String classDetail(int clubNo, Model model){
		Club c = service.selectOneClub(clubNo);
		System.out.println(c);
		model.addAttribute("c", c);
		return "club/clubDetail";
	}

}
