package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nsClass.model.service.NsClassService;
import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;
import kr.or.nsClass.model.vo.NsClassPageData;

@Controller
public class AdminClassController {
	
	@Autowired
	private NsClassService service;
	
	@RequestMapping(value="/adminMgrClass.do")
	public String adminPage(int reqPage, Model model) {
		NsClassPageData npd = service.getAllClass(reqPage);
		ArrayList<NsClass> nsCla = service.holdClass();
		
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		model.addAttribute("reqPage",npd.getReqPage());
		model.addAttribute("numPerPage",npd.getNumPerPage());
		model.addAttribute("holdClass",nsCla);
		return "admin/adminMgrClass";
	}
	@RequestMapping(value="/classUpdateFrm.do")
	public String updateFrm(int classNo,Model model) {
		NsClass nsCl = service.getOneClass(classNo);
		ArrayList<FileVo> fileVo = service.getOneFile(classNo);
		nsCl.setFileList(fileVo);
		model.addAttribute("cla",nsCl);
		//model.addAttribute("files",fileVo);
		return "admin/classUpdate";
	}
	
	@RequestMapping(value="/changeStatus.do")
	public String updateFrm(NsClass nscl) {
		int result = service.chnageStatus(nscl);
		if(result>0) {
			return "redirect:adminMgrClass.do?reqPage=1";
		}
			return "redirect:classUpdateFrm.do?classNo"+nscl.getClassNo();
	}
	
	@RequestMapping(value="/changeStatus2.do")
	public String updateStatus(NsClass nscl) {
		int result = service.changeStatus2(nscl);
		
		if(result>0) {
			return "redirect:adminMgrClass.do?reqPage=1";
		}else {
			return "redirect:adminMgrClass.do?reqPage=1";
		}
	}
	//클래스관리에서 관리자가 삭제
	@RequestMapping(value="/classDelete.do")
	public String deleteClass(int classNo) {
		int result = service.deleteClass(classNo);
		if(result>0) {
			return "redirect:adminMgrClass.do?reqPage=1";
		}else {
			return "redirect:adminMgrClass.do?reqPage=1";
		}
	}
}
