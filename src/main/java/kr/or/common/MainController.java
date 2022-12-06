package kr.or.common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;

@Controller
public class MainController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "/main.do")
	public String goMain(Model model) {
		ArrayList<Club> list = service.selectMainClubs();
		model.addAttribute("clubList", list);
		return "common/main";
	}
}
