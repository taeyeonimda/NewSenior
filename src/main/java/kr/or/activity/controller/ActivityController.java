package kr.or.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.activity.model.service.ActivityService;
import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityPageData;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService service;
	
	
	@RequestMapping(value="/activityList.do")
	public String activityMgrAdmin(int reqPage,Model model) {
		ActivityPageData apd = service.getAllActivity(reqPage);
		model.addAttribute("list",apd.getList());
		model.addAttribute("pageNavi",apd.getPageNavi());
		model.addAttribute("reqPage",apd.getReqPage());
		model.addAttribute("numPerPage",apd.getNumPerPage());
		return "activity/activityList";
	}
	
	@RequestMapping(value="/activityDetail.do")
	public String activityDetail(Activity act,Model model) {
		Activity activity = service.getOneActivity(act);
		model.addAttribute("act",activity);
		return "activity/activityDetail";
	}
	
}
