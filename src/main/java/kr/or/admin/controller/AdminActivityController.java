package kr.or.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.activity.model.service.ActivityService;
import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityPageData;
import kr.or.activity.model.vo.FileVo;
import kr.or.category.model.service.CategoryService;
import kr.or.category.model.vo.Category;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class AdminActivityController {

	@Autowired
	private ActivityService service;
	@Autowired
	private MemberService mService;
	@Autowired
	private CategoryService service2;
	@Autowired 
	private FileRename fileRename;
	
	@RequestMapping(value="/activityEnroll.do")
	public String activityEnroll(Model model) {
		ArrayList<Member> list = mService.getAllAdmin();
		ArrayList<Category> cateList = service2.withOutAll();
		model.addAttribute("cateList", cateList);
		model.addAttribute("list",list);
		return "admin/activityEnroll";
	}
	
	@RequestMapping(value="/insertActivity.do")
	public String insertActivity(Activity activity,MultipartFile[] files, 
			MultipartFile[] detailFiles,HttpServletRequest request) throws UnsupportedEncodingException {
		ArrayList<FileVo> list = new ArrayList<FileVo>();
		String filepaths = "";
		
		if(!files[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/activity/");
			for(MultipartFile file: files) {
				String filename = file.getOriginalFilename();
				filepaths = fileRename.fileRename(savePath,filename);
				
				FileOutputStream fos;
				try {
					fos = new FileOutputStream(new File(savePath+filepaths));
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
				
				
			}
		}
		
		if(!detailFiles[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/activity/");
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
		
		
		
		activity.setFilepath(filepaths);
		activity.setFileList(list);
		System.out.println("액티비티 컨트롤러 체크" +activity);
		int result = service.insertActivity(activity);
		if(result>0) {
			return "admin/activityMgrAdmin";
		}else {
			return "admin/activityMgrAdmin";
	
		}	
	}
	
	@RequestMapping(value="/activityMgrAdmin.do")
	public String activityMgrAdmin(int reqPage,Model model) {
		ActivityPageData apd = service.getAllActivity(reqPage);
		model.addAttribute("list",apd.getList());
		model.addAttribute("pageNavi",apd.getPageNavi());
		model.addAttribute("reqPage",apd.getReqPage());
		model.addAttribute("numPerPage",apd.getNumPerPage());
		return "admin/activityMgrAdmin";
	}
}
