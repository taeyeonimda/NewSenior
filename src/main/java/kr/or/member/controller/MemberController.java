package kr.or.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.category.model.service.CategoryService;
import kr.or.category.model.vo.Category;
import kr.or.common.MailSender;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Delivery;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private CategoryService service2;
	
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
	
	
	
	@RequestMapping(value="/classMgrAdmin.do")
	public String classMgrAdmin() {
		return "myPage/classMgrAdmin";
	}
	
	
	//로그인
	@RequestMapping(value="/login.do")
	public String loginCheckMember(Member m, HttpSession session,Model model) {
		Member member = service.loginCheckMember(m);
		if(member!= null) {
			session.setAttribute("m", member);
			System.out.println("login정보:"+member);
			return "redirect:/";
		}else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url","/");
			return "alert";
		}
	}
	
	
	//로그아웃
		@RequestMapping(value = "/logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";

		}
		//카카오 로그아웃
		@ResponseBody
		@RequestMapping(value="/kakaoLogout.do")
		public String kakaoLogout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
		//마이페이지가기
		@RequestMapping(value = "/mypage.do")
		public String mypageFrm(Model model, @SessionAttribute Member m) {
			Member m1 = new Member();
			m1.setMemberId(m.getMemberId());
			m1.setKakaoLogin(m.getKakaoLogin());
			Member member = service.selectOneMember(m1);
			ArrayList<Delivery> list = service.selectAllDelivery(member);
			if (member != null) {
				model.addAttribute("list",list);
				model.addAttribute("member", member);
				return "myPage/mypage";
			} else {
				return "redirect:/";
			}
		}
		
		//마이페이지 내정보수정하기
		@RequestMapping(value = "/mypageUpdate.do")
		public String mypageUpdate(Member member, @SessionAttribute Member m) {
			System.out.println("생일이다:"+member.getMemberBirth());
			member.setKakaoLogin(m.getKakaoLogin());
			if(member.getMemberId() == "") {
				member.setMemberId(m.getMemberId());
			}
			if(member.getMemberName() == "") {
				member.setMemberName(m.getMemberName());
			}
			if(member.getMemberPhone() == "") {
				member.setMemberPhone(m.getMemberPhone());
			}
			if(member.getMemberBirth() == "") {
				member.setMemberBirth(m.getMemberBirth());
			}
			System.out.println("생일:"+member.getMemberBirth());
			System.out.println("controller에서 member값: "+member);
			int result = service.updateMember(member);
			System.out.println("###"+result);
			if (result > 0) {
				m.setMemberPhone(member.getMemberPhone());
				m.setMemberEmail(member.getMemberEmail());
				m.setFavorite(member.getFavorite());
				m.setMemberBirth(member.getMemberBirth());
				m.setNickName(member.getNickName());
				System.out.println("디비 거치고 온 member값: "+member);
				return "redirect:/mypage.do";
			} else {
				return "redirect:/mypage.do";
			}
		}

		//회원가입폼
		@RequestMapping(value="/joinFrm.do")
		public String joinFrm(Model model) {
			ArrayList<Category> cateList = service2.withOutAll();
	        model.addAttribute("cateList", cateList);     
			return "member/joinFrm";
		}
		
		//회원가입insert
		@RequestMapping(value="/join.do")
		public String join(Member m, String str_email01, String str_email02, String selectEmail, String memberPhone1, String memberPhone2, String memberPhone3) {
			if(selectEmail== "1") {
				m.setMemberEmail(str_email01+'@'+str_email02);
			}else {
				m.setMemberEmail(str_email01+'@'+selectEmail);
			}
			m.setMemberPhone(memberPhone1+"-"+memberPhone2+"-"+memberPhone3);
			int result = service.insertMember(m);
			if(result>0) {
				return "redirect:/";
			}else { 
				return "member/joinFrm";
			}
		}
		
		//카카오 회원가입&로그인
		@ResponseBody
		@RequestMapping(value="/kakaoLogin.do")
		public String kakaoLogin(Member m, HttpSession session, Model model) {
			Member member = service.loginCheckKaKaoMember(m);
			if(member != null) {
				session.setAttribute("m", member);
				return "0";
			}else {
				
				int result = service.insertKakaoMember(m);
				System.out.println("kakao result:"+result);
				if(result>0) {
					return "1";
				}else {
					return "2";
				}
			}
		}
		
		@RequestMapping(value="/kakao.do")
		public String kakao() {
			return "redirect:/";
		}
		
		//회원가입_아이디체크
		@ResponseBody //페이지 이동이 아니라 return으로 데이터를 넘겨주는 태그
		@RequestMapping(value="/idCheck.do")
		public String idCheck(Member m) {
			Member member = service.selectOneMember(m);
			if(member == null) {
				//사용 가능
				return "0";
			}else {
				//이미 사용 중
				return "1";
			}
		}
		
		//비밀번호 변경 페이지로 이동
		@RequestMapping(value="/pwChangeFrm.do")
		public String pwChangeFrm(){
			return "member/currentPwCheckFrm";
		}
		//비밀번호 변경클릭->현재 비밀번호 입력 -> 맞으면 새 비밀번호 입력
		@RequestMapping(value="/currentPwCheck.do")
		public String currentPwCheck(Member m, Model model, String memberPw) {
			//데이터베이스에서 pw를 조회한 후
			//입력한 비밀번호와 조회한 비밀번호가 같은지 체크/
			Member member = service.selectOneMember(m);
			if(member != null) {
				model.addAttribute("mPw",memberPw);
				return "member/pwChangFrm";
			}else {
				return "redirect:/pwChangeFrm.do";
			}
		}
		//새 비밀번호 입력
		@RequestMapping(value="/pwChange.do")
		public String pwChange(Member m) {
			int result = service.changePwMember(m);
			if(result>0) {
				//변경 성공 시 session 데이터 적용 안함 쓸일이 없음
				return "redirect:/logout.do";
			}else {
				return "redirect:/mypageInfo.do";
			}
		}
		
		//아이디,비밀번호 찾기 폼으로 이동
		@RequestMapping(value="/searchInfoFrm.do")
		public String searchInfoFrm() {
			return "member/searchInfoFrm";
		}
		
		//아이디찾기
		@RequestMapping(value="/searchId.do")
		public String searchId(Model model,Member m, String memberPhone1, String memberPhone2, String memberPhone3) {
		 m.setMemberPhone(memberPhone1+"-"+memberPhone2+"-"+memberPhone3);
		 Member member = service.selectOneMember(m);
		 if (member != null) {
				model.addAttribute("member", member);
				return "member/searchIdSuccess";
			} else {
				return "redirect:/";
			}
		}
		
		//비밀번호 찾기에서 회원 정보 있는지 체크
		@ResponseBody
		@RequestMapping(value="/pwCheck.do")
		public String searchPw(Member m) {
			Member member = service.selectOneMember(m);
			if(member != null) {
				//일치
				return "0";
			}else {
				//불일치
				return "1";
			}
		}
		
		//임시비밀번호 이메일 발송하고, db도 바꿔주기
		@ResponseBody
		@RequestMapping(value="/changePw.do")
		public String changePw(Member m, HttpSession session) {
			Member member = service.selectOneMember(m);
			if(member != null) {
				MailSender sender = new MailSender();
				String memberPw = member.getMemberPw();
				String randomCode = sender.sendMail2(member.getMemberEmail());
				member.setMemberPw(randomCode);
				int result = service.updatePwMember(member);
				if(result>0) {
					return "0";
				}else {
					return "1";
				}
			} else {
				return "1";

			}
		}
		
		//비밀번호 찾기에서 이메일 전송
		@RequestMapping(value="/searchPwSuccess.do")
		public String searchPw() {
			return "member/searchPwSuccess";
		}
		
		//배송지 insert
		@RequestMapping(value="/insertAddr.do")
		public String insertAddr(Delivery delivery, int memberNum, @SessionAttribute Member m, Model model) {
			delivery.setMemberNo(memberNum);
			ArrayList<Delivery> list = service.selectAllDelivery(m);
			if(list.size()<5) {
				if(delivery.getDefaultAddr().equals("y")) {
					// 기본 배송지 값 'n'으로 다 바꾸기
					int result = service.updateAddr(delivery);
					if(result>0) {
						//기본 배송지 'y'로 insert
						int result2 = service.insertAddr(delivery);
						if(result2>0) {
							return "redirect:/mypage.do";
						}else {
							return "redirect:/";
						}
					}else {
						return "redirect:/";
					}
				}
				System.out.println(delivery);
				int result = service.insertAddr(delivery);
				if(result>0) {
					return "redirect:/mypage.do";
				}else {
					return "redirect:/";
				}
			}else {
				model.addAttribute("msg", "배송지등록은 최대 5개입니다.");
				model.addAttribute("url","/mypage.do");
				return "alert";
			}
		}
		
		//배송지 삭제
		@RequestMapping(value="/deleteAddr.do")
		public String deleteAddr(Integer deliveryNo, Model model) {
			int result = service.deleteAddr(deliveryNo);
			if(result>0) {
				return "redirect:/mypage.do";
			}else {
				model.addAttribute("msg", "배송지 삭제에 실패했습니다.");
				model.addAttribute("url","/mypage.do");
				return "alert";
			}
		}
		//배송지 정보 가져오기
		@ResponseBody
		@RequestMapping(value="/selectAddr.do",produces = "application/json;charset=utf-8")
		public String selectAddr(Integer deliveryNo, Model model, @SessionAttribute Member m) {
			Delivery d = service.selectOneDelivery(deliveryNo);
			Gson gson = new Gson();
			String result = gson.toJson(d);
			if(d != null) {
				return result;
			}else {
				return "1";
			}
		}
		//배송지 정보 업데이트
		@RequestMapping(value="/updateAddr.do")
		public String updateAddr(Delivery delivery, Model model, int deliveryNum) {
			System.out.println("###delivery###:"+delivery+deliveryNum);
			delivery.setDeliveryNo(deliveryNum);
			int result = service.updateOneAddr(delivery);
			if(result>0) {
				return "redirect:/mypage.do";
			}else {
				model.addAttribute("msg", "배송지 수정에 실패했습니다.");
				model.addAttribute("url","/mypage.do");
				return "alert";
			}
		}
		/*
		//회원탈퇴(member_state에 시간 넣고 -> 5분뒤 삭제 )
		@RequestMapping(value="/deleteMember.do")
		public String deleteMember(@SessionAttribute Member m) {
			int result = service.deleteUser(m);
			return "redirect:/";
		}
		*/
		
}
