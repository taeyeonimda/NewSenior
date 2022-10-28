package kr.or.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nsClass.model.service.NsClassService;
import kr.or.nsClass.model.vo.NsClassPageData;

@Controller
public class AdminClassController {
	
	@Autowired
	private NsClassService service;
	
	@RequestMapping(value="/adminMgrClass.do")
	public String adminPage(int reqPage, Model model) {
		NsClassPageData npd = service.getAllClass(reqPage);
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		model.addAttribute("reqPage",npd.getReqPage());
		model.addAttribute("numPerPage",npd.getNumPerPage());
		return "admin/adminMgrClass";
	}
}
