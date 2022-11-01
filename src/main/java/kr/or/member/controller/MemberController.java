package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="/memberMgrAdmin.do")
	public String memberMgrAdmin() {
		return "myPage/memberMgrAdmin";
	}
	/*
	@RequestMapping(value="/mypage.do")
	public String insertProductFrm() {
		return "myPage/mypage";
	}
	 */
	@RequestMapping(value="/orderHistory.do")
	public String orderHistory() {
		return "myPage/orderHistory";
	}
	@RequestMapping(value="/classHistory.do")
	public String classHistory() {
		return "myPage/classHistory";
	}
	@RequestMapping(value="/myClub.do")
	public String myClub() {
		return "myPage/myClub";
	}
	@RequestMapping(value="/myComment.do")
	public String myComment() {
		return "myPage/myComment";
	}
	@RequestMapping(value="/teacherInfo.do")
	public String teacherInfo() {
		return "myPage/teacherInfo";
	}
	@RequestMapping(value="/activityEnroll.do")
	public String activityEnroll() {
		return "myPage/activityEnroll";
	}
	@RequestMapping(value="/activityMgrAdmin.do")
	public String activityMgrAdmin() {
		return "myPage/activityMgrAdmin";
	}
	@RequestMapping(value="/cart.do")
	public String cart() {
		return "myPage/cart";
	}
	
	@RequestMapping(value="/classMgrAdmin.do")
	public String classMgrAdmin() {
		return "myPage/classMgrAdmin";
	}
	@RequestMapping(value="/classMgrTeacher.do")
	public String classMgrTeacher() {
		return "myPage/classMgrTeacher";
	}
	
	//로그인
	@RequestMapping(value="/login.do")
	public String loginCheckMember(Member m, HttpSession session) {
		Member member = service.loginCheckMember(m);
		if(member!= null) {
			session.setAttribute("m", m);
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	//로그아웃
		@RequestMapping(value = "/logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";

		}
		
		//마이페이지가기
		@RequestMapping(value = "/mypage.do")
		public String mypageFrm(Model model, @SessionAttribute Member m) {
			Member m1 = new Member();
			m1.setMemberId(m.getMemberId());
			m1.setMemberPw(m.getMemberPw());
			Member member = service.selectOneMember(m1);
			if (member != null) {
				model.addAttribute("member", member);
				return "myPage/mypage";
			} else {
				return "redirect:/";
			}
		}
		
		
		//마이페이지 내정보수정하기
		@RequestMapping(value = "/mypageUpdate.do")
		public String mypageUpdate(Member member, @SessionAttribute Member m) {
			System.out.println("controller로 넘어온 member값: "+member);
			int result = service.updateMember(member);
			if (result > 0) {
				m.setMemberPhone(member.getMemberPhone());
				m.setMemberEmail(member.getMemberEmail());
				m.setFavorite(member.getFavorite());
				m.setMemberBirth(member.getMemberBirth());
				m.setNickName(member.getNickName());
				System.out.println("디비 거치고 온 member값: "+member);
				return "redirect:/mypage.do";
			} else {
				return "redirect:/";
			}
		}

}
