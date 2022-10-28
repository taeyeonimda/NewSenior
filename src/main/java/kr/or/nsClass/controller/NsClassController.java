package kr.or.nsClass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nsClass.model.service.NsClassService;

@Controller
public class NsClassController {
	@Autowired
	private NsClassService service;
	
	@RequestMapping(value = "/classList.do")
	public String classList() {
		return "class/classList";
	}
	
	@RequestMapping(value = "/classDetail.do")
	public String classDetail(){
		return "class/classDetail";
	}
}
