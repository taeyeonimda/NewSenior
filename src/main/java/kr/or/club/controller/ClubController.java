package kr.or.club.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;


@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "/clubList.do")
	public String classList() {
		return "club/clubList";
	}	
	@RequestMapping(value = "/insertClubFrm.do")
	public String insertClubFrm() {
		return "club/insertClubFrm";
	}
	@RequestMapping(value = "/insertClub.do")
	public String insertClub(Club c) {
		int result = service.insertClub(c);
		return "redirect:/";
	}
	@RequestMapping(value = "/clubDetail.do")
	public String classDetail(){
		return "club/clubDetail";
	}
}
