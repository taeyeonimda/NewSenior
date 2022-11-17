package kr.or.club.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import common.FileRename;
import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubBoardComment;
import kr.or.member.model.vo.Member;


@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value = "/popularClubList.do")
	public String clubMemberList(Model model, Member m) {
		ArrayList<Club> popularList = service.searchClubPopularList(m);
		model.addAttribute("pList", popularList);
		return "club/clubList";
	}
	
	@RequestMapping(value = "/clubList.do")
	public String clubList() {
		return "club/clubList";
	}
	
	// 내가 가입한 동호회와 일치하는지 확인하는 ajax
	@ResponseBody
	@RequestMapping(value = "/searchMyClub.do", produces = "application/json;charset=utf-8")
	public String searchMyClub(Member m) {
		ArrayList<Club> myList = service.searchMyClub(m);
		return new Gson().toJson(myList);
	}
	
	// 모든 동호회 가져오는 ajax 페이징
	@ResponseBody
	@RequestMapping(value = "/searchAllClub.do", produces = "application/json;charset=utf-8")
	public String getMyClubCategory(String keyword) {
		ArrayList<Club> list = service.selectAllClub(keyword);
		System.out.println(list.size());
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "/insertClubFrm.do")
	public String insertClubFrm() {
		return "club/insertClubFrm";
	}
	
	@RequestMapping(value = "/joinClub.do")
	public String insertClubMember(Member m, Club c, Model model) {
		service.insertClubMember(m, c);
		return "redirect:/myClubList.do?memberNo="+m.getMemberNo()+"&clubNo="+c.getClubNo();
	}
	/*
	@RequestMapping(value = "/myClubList.do")
	public String myClubList(Member m, Club c, Model model) {
		ArrayList<Club> myList = service.searchMyClub(m);
		model.addAttribute("myList", myList);
		model.addAttribute("newClub", c.getClubNo());
		return "club/myClubList";
	}
	*/
	@RequestMapping(value = "/insertClub.do")
	public String insertClub(Club c, MultipartFile[] files, HttpServletRequest request) throws UnsupportedEncodingException {
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
		return "redirect:/popularClubList.do?memberNo="+c.getClubLeader();
	}
	
	
	@RequestMapping(value = "/clubDetail.do")
	public String clubDetail(Club c, Model model){
		HashMap<String, Object> map = service.selectOneClubMap(c);
		System.out.println(map.get("club"));
		model.addAttribute("c", map.get("club"));
		model.addAttribute("cbList", map.get("board"));
		return "club/clubDetail";
	}

	@ResponseBody
	@RequestMapping(value="/UploadFile.do", produces = "application/json;charset=utf-8")
	public String uploadChatFile(MultipartFile[] chatFile, HttpServletRequest request) throws UnsupportedEncodingException {
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
	public String selectOneClub(Club club){
		Club c = service.selectOneClub(club);
		return new Gson().toJson(c);
	}
	@RequestMapping(value = "/clubBoardWrite.do")
	public String clubBoardWrite(ClubBoard cb, MultipartFile[] files, HttpServletRequest request) throws UnsupportedEncodingException {
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
	
	@RequestMapping(value = "/insertClubComment.do")
	public String  insertClubComment(ClubBoardComment cbc) {
		System.out.println(cbc);
		int result = service.insertBoardCom(cbc);
		return "redirect:/clubDetail.do?clubNo="+cbc.getClubNo();
	}
	@RequestMapping(value = "/deleteComment.do")
	public String deleteClubComment(ClubBoardComment cbc) {
		int result = service.deleteClubComment(cbc);
		return "redirect:/clubDetail.do?clubNo="+cbc.getClubNo();
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateClubBoard.do", produces = "application/json;charset=utf-8")
	public String updateClubBoard(ClubBoard cb, MultipartFile[] upfile, String oldFilepath, String status, HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("upfile"+upfile);
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/club/");
		String filepath = null;
		
		// upfile 먼저
		if(!upfile[0].isEmpty()) {
			for(MultipartFile file : upfile) {
				String filename = file.getOriginalFilename();
				filepath = fileRename.fileRename(savePath, filename);
				System.out.println(filepath);
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
		
		if(oldFilepath != null && status.equals("stay")) {
			filepath = oldFilepath;
			cb.setClubBoardFilepath(filepath);
		}

		int result = service.updateClubBoard(cb);
		if(result>0) {
			if(status.equals("delete")) {
				File oldfile = new File(savePath+oldFilepath);
				if(oldfile.exists()) { // 파일이 존재하면
					oldfile.delete(); // 파일 삭제	
				}
			}
		}
		return new Gson().toJson(cb);
	}
	
	// 동호회장 변경
	@RequestMapping(value = "/changeClubLeader.do")
	public String changeClubLeader(Club c) {
		int result = service.updateClubLeader(c);
		return "redirect:/clubDetail.do?clubNo="+c.getClubNo();
	}
	// 동호회 탈퇴하기
	@RequestMapping(value = "/quitClub.do")
	public String quitClub(ClubBoard cb) {	// 클럽게시판 객체 빌려쓰기
		int result = service.deleteClubMember(cb);
		return "redirect:/popularClubList.do?memberNo="+cb.getMemberNo();
	}
	// 동호회 회원 강퇴 시키기
	@RequestMapping(value = "/blockMember.do")
	public String blockMember(int[] memberNo, int clubNo){
		System.out.println(memberNo);
		int result = service.blockClubMember(memberNo, clubNo);
		return "redirect:/clubDetail.do?clubNo="+clubNo;
	}
	// 클럽 detail에서 보여줄 내 동호회 버튼 구현 위한 total
	@ResponseBody
	@RequestMapping(value="/getMyClubListTotal.do", produces = "application/json;charset=utf-8")
	public String myClubList(Member m) {
		ArrayList<Club> myList = service.searchMyClub(m);
		return new Gson().toJson(myList);
	}
	// 클럽 detail에서 보여줄 내 동호회 리스트
	@ResponseBody
	@RequestMapping(value="/getMyClubList.do", produces = "application/json;charset=utf-8")
	public String myClubList(Member m, int startIndex, int endIndex) {
		ArrayList<Club> myList = service.searchMyClub(m, startIndex, endIndex);
		return new Gson().toJson(myList);
	}
	// 클럽을 없애는 delete
	@RequestMapping(value="/deleteClub.do")
	public String deleteClub(Club c) {
		int result = service.deleteClub(c);
		return "redirect:/popularClubList.do?memberNo="+c.getClubLeader();
	}
	// 클럽 공지사항 수정
	@RequestMapping(value = "/updateClubNotice.do")
	public String updateClubNotice(Club c) {
		int result = service.updateClubNotice(c);
		return "redirect:/clubDetail.do?clubNo="+c.getClubNo();
	}
	// 클럽 게시글 삭제
	@RequestMapping(value = "/deleteClubBoard.do")
	public String deleteClubBoard(ClubBoard cb) {
		int result = service.deleteClubBoard(cb);
		return "redirect:/clubDetail.do?clubNo="+cb.getClubNo();
	}
	// 블락 멤버 확인
	@ResponseBody
	@RequestMapping(value = "/searchBlockMember.do", produces = "application/json;charset=utf-8")
	public String blockMemberCheck(Club c) {
		String result = service.searchBlockMember(c);
		return new Gson().toJson(result);
	}
	
	//
}
