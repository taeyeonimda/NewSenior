package kr.or.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.nsClass.model.service.NsClassService;


@Controller
public class AdminUserController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="/adminPage.do")
	public String adminPage(int reqPage, Model model) {
		MemberPageData mpd = service.getAllMembers(reqPage);
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",mpd.getReqPage());
		model.addAttribute("numPerPage",mpd.getNumPerPage());
		return "admin/adminPage";
	}
	
	@RequestMapping(value="/changeLevel.do")
	public String chnageLevel(Member m) {
		int result = service.chnageLevel(m);
		if(result>0) {
			return "redirect:/adminPage.do?reqPage=1";
		}
		return "AS";
	}
	
	@RequestMapping(value="/checkedChangeLevel.do")
	public String checkedChangeLevel(String num, String level) {
		boolean result = service.checkedChangeLevel(num,level);
		if(result) {
			return "redirect:/adminPage.do?reqPage=1";
		}
		return "A";
	}
}
