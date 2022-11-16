package kr.or.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.club.model.service.ClubService;

@Controller
public class MainController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "main.do")
	public String goMain() {
		
		return "common/main";
	}
}
