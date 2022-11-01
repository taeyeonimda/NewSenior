package kr.or.nsClass.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.nsClass.model.service.NsClassService;

import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;

@Controller
public class NsClassController {
	
	@Autowired
	private NsClassService service;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value = "/classList.do")
	public String classList(NsClass nc, Model model) {
		// 만약 category가 null이면,
		ArrayList<NsClass> claList = service.selectClassList(nc);
		model.addAttribute("claList", claList);
		return "class/classList";
	}
	@RequestMapping(value = "/classDetail.do")
	public String classDetail(){
		return "class/classDetail";
	}
	
	@RequestMapping(value="/classEnroll.do")
	public String classEnroll(Model model) {
		ArrayList<String> category = service.getAllCategory();
		model.addAttribute("category",category);
		return "myPage/classEnroll";
	}
	
	@RequestMapping(value = "/insertClass.do")
	public String insertClass(NsClass nsCl, 
			MultipartFile[] files, MultipartFile[] detailFiles, HttpServletRequest request){
		
		System.out.println("위에서 확인:"+nsCl);
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
			return "redirect:/adminMgrClass.do?reqPage=1";
		}else {
			return "redirect:/adminMgrClass.do?reqPage=1";
		}
		
	}
}
