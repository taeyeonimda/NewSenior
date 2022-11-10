package kr.or.nsClass.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.or.category.model.service.CategoryService;
import kr.or.category.model.vo.Category;
import kr.or.member.model.vo.Member;
import kr.or.nsClass.model.service.NsClassService;
import kr.or.nsClass.model.vo.ClassReview;
import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;
import kr.or.nsClass.model.vo.NsClassPageData;

@Controller
public class NsClassController {
	
	@Autowired
	private NsClassService service;
	@Autowired 
	private CategoryService service2;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value = "/classList.do")
	public String classList(String classCategory, int reqPage, Model model) {
		NsClassPageData npd = service.selectClassList(classCategory, reqPage);
		ArrayList<Category> cateList = service2.getAllCategory();
		model.addAttribute("classCategory",classCategory);
		model.addAttribute("clist", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		model.addAttribute("reqPage", npd.getReqPage());
		model.addAttribute("numPerPage", npd.getNumPerPage());
		model.addAttribute("cateList", cateList);
		return "class/classList";
	}

	@RequestMapping(value = "/classDetail.do")
	public String classDetail(NsClass nc, Model model){
		NsClass cla = service.selectOneClass(nc);
		model.addAttribute("cla", cla);
		System.out.println(cla);
		return "class/classDetail";
	}
	
	@RequestMapping(value="/classEnroll.do")
	public String classEnroll(Model model) {
		
		ArrayList<Category> cateList = service2.withOutAll();
        model.addAttribute("cateList", cateList);     
		
		return "myPage/classEnroll";
	}
	
	@RequestMapping(value = "/insertClass.do")
	public String insertClass(NsClass nsCl, 
			MultipartFile[] files, MultipartFile[] detailFiles, HttpServletRequest request) throws UnsupportedEncodingException{
		ArrayList<FileVo> list = new ArrayList<FileVo>();
		String filepaths ="";
		if(!files[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/class/");
			for(MultipartFile file: files) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath,filename);
				
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
				//파일업로드 끝(파일1개 업로드)

				filepaths = filepath;
			}
		}
		
		
		
		if(!detailFiles[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/class/");
			for(MultipartFile file: detailFiles) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath,filename);
				
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
				FileVo fileVo = new FileVo();
				fileVo.setFilename(filename);
				fileVo.setFilepath(filepath);
				list.add(fileVo);
			}
		}
		
		nsCl.setFilepath(filepaths);
		nsCl.setFileList(list);
		int result = service.insertClass(nsCl);
		System.out.println("아래서 확인:"+nsCl);
	
		if(result>0) {
			return "admin/adminMgrClass";
		}else {
			return "admin/adminMgrClass";
	
		}	
	}
	
	@RequestMapping(value="/classMgrTeacher.do")
	public String classMgrTeacher(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("m");
		ArrayList<NsClass> list = service.getMyClass(m.getMemberNo());
		ArrayList<NsClass> list2 = service.getMyEndClass(m.getMemberNo());
		model.addAttribute("myClass",list);
		model.addAttribute("endClass",list2);
		return "myPage/classMgrTeacher";
	}
	
	
	@RequestMapping(value = "/insertClassReview.do")
	public String classReview(ClassReview cr) {
		int result = service.insertClassReview(cr);
		return "redirect:/classDetail.do?classNo="+cr.getClassNo();
	}
	
	@RequestMapping(value = "/getTeacherReview.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getTeacherReview(NsClass cla) {
		ArrayList<ClassReview> crList = service.getTeacherReview(cla);
		return new Gson().toJson(crList);
	}
}
