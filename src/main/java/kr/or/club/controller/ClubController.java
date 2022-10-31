package kr.or.club.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;


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
	public String clubDetail(int clubNo, Model model){
		HashMap<String, List> map = service.selectOneClubMap(clubNo);
		//Club c = service.selectOneClub(clubNo);
		// board리스트와 해당 클럽의 board에 대한 댓글리스트
		// model.addAttribute("c", c);
		Club c = (Club)map.get("club").get(0);
		model.addAttribute("c", c);
		model.addAttribute("cbList", map.get("board"));
		return "club/clubDetail";
	}

	@ResponseBody
	@RequestMapping(value="/UploadFile.do",produces = "application/json;charset=utf-8")
	public String uploadChatFile(MultipartFile[] chatFile, HttpServletRequest request) {
		String filepath = null;
		if(!chatFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/chat/");
			for(MultipartFile file: chatFile) {
				String filename = file.getOriginalFilename();
				filepath = fileRename.fileRename(savePath,filename);
				FileOutputStream fos;
				try {
					fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			System.out.println("filepath:"+filepath);
			return new Gson().toJson(filepath);
		}
		return new Gson().toJson(filepath);
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectOneClub.do", produces = "application/json;charset=utf-8")
	public String selectOneClub(int clubNo){
		Club c = service.selectOneClub(clubNo);
		return new Gson().toJson(c);
	}
	@RequestMapping(value = "/clubBoardWrite.do")
	public String clubBoardWrite(ClubBoard cb, MultipartFile[] files, HttpServletRequest request) {
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
				cb.setClubBoardFilepath(filepath);
			}// for문 종료
		}
		int result = service.insertClubBoard(cb);
		return "redirect:/clubDetail.do?clubNo="+cb.getClubNo();
	}
	
	
	
}
