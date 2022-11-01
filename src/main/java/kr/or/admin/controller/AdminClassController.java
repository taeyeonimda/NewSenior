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
		return "myPage/classUpdate";
	}
	
	@RequestMapping(value="/chnageStatus.do")
	public String updateFrm(NsClass nscl) {
		int result = service.chnageStatus(nscl);
		if(result>0) {
			return "admin/adminMgrClass";
		}
		return "admin/adminMgrClass";
	}
	
	//아직안씀
	@RequestMapping(value="/classUpdate.do")
	public String classUpdate(int classNo) {
		int result = service.classUpdate(classNo);
		return "A";
	}
	
}
