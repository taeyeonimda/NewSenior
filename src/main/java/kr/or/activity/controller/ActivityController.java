package kr.or.activity.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.activity.model.service.ActivityService;
import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityHistory;
import kr.or.activity.model.vo.ActivityPageData;
import kr.or.activity.model.vo.ActivityReview;
import kr.or.activity.model.vo.ActivityReviewPageData;
import kr.or.cart.model.vo.Cart;
import kr.or.category.model.service.CategoryService;
import kr.or.category.model.vo.Category;
import kr.or.product.model.vo.ProductPageData;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService service;
	@Autowired
	private CategoryService service2;
	
	@RequestMapping(value="/activityList.do")
	public String activityMgrAdmin(String activityCategory, int reqPage,Model model) {
		ActivityPageData apd = service.categoryActivityList(activityCategory, reqPage);
		ArrayList<Category> list = service2.getAllCategory();
		model.addAttribute("activityCategory",activityCategory);
		model.addAttribute("list",apd.getList());
		model.addAttribute("pageNavi",apd.getPageNavi());
		model.addAttribute("reqPage",apd.getReqPage());
		model.addAttribute("numPerPage",apd.getNumPerPage());
		model.addAttribute("cateList",list);
		return "activity/activityList";
	}
	
	@RequestMapping(value="/activityDetail.do")
	public String activityDetail(Activity act,Model model) {
		Activity activity = service.getOneActivity(act);
		model.addAttribute("act",activity);
		return "activity/activityDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/actInsertCart.do")
	public String activity2(Cart cart,Model model) {
		int result = service.actInsertCart(cart);
		if(result>0) {
			return "1";
		}
		return "0";
	}
	
	//주문완료후에 넣어야할꺼
	@RequestMapping(value="/insertActHistory.do")
	public void insertActHistory(ActivityHistory actH) {
		service.insertActHistory(actH);
	}
	
	//액티비티 리뷰 쓰기전에 액티비티 구매여부 확인
	@ResponseBody
	@RequestMapping(value="/checkActHistory.do")
	public String checkActHistory(ActivityHistory actH) {
		ActivityHistory result = service.checkActHistory(actH);
		if(result!=null) {
			return "1";
		}
		return "0";
	}
	
	//액티비티 리뷰작성
	@ResponseBody
	@RequestMapping(value="/insertActivityReview.do")
	public String insertActivityReview(ActivityReview actR) {
		int result = service.insertActivityReview(actR);
		if(result>0) {
			return "1";
		}
			return "0";
	}
	
	@ResponseBody
	@RequestMapping(value = "/actReviewList.do",produces = "application/json;charset=utf-8")
	public String actReviewList(Model model,int activityNo, int reqPage) {
		ActivityReviewPageData arpd = service.actReviewList(reqPage,activityNo);
		model.addAttribute("list",arpd.getList());
		model.addAttribute("pageNavi",arpd.getPageNavi());
		model.addAttribute("reqPage",arpd.getReqPage());
		model.addAttribute("numPerPage",arpd.getNumPerPage());
		
		return new Gson().toJson(model);

	}
}
