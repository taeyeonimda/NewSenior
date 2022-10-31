package kr.or.nsClass.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nsClass.model.service.NsClassService;
import kr.or.nsClass.model.vo.NsClass;

@Controller
public class NsClassController {
	
	@Autowired
	private NsClassService service;
	
	@RequestMapping(value = "/classList.do")
	public String classList(Model model) {
		// 만약 category가 null이면,
		ArrayList<NsClass> claList = service.selectAllClass();
		model.addAttribute("claList", claList);
		return "class/classList";
	}
	@RequestMapping(value = "/classDetail.do")
	public String classDetail(){
		return "class/classDetail";
	}
}
