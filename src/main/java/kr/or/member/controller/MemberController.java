package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
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
	@Autowired
	private FileRename fileRename;
	
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
		System.out.println("login정보:"+member);
		if(member!= null) {
			session.setAttribute("m", member);
			if(member.getMemberState() != null) {
				session.invalidate();
				model.addAttribute("msg","이미 탈퇴하신 회원입니다.");
				model.addAttribute("url","/");
				return "alert";
			}
			return "redirect:/";
		}else {
		
			return "redirect:/main.do?login=1";
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
			System.out.println("마이페이지컨트롤러 세션 m"+m);
			System.out.println("마이페이지컨트롤러 멤버"+member);
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
		public String mypageUpdate(Member member, @SessionAttribute Member m, MultipartFile[] files, HttpServletRequest request, String defaultImg) {
			
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
			if(member.getKakaoLogin() == null) {
				member.setMemberNo(m.getMemberNo());
			}
			//파일 
			if(!files[0].isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
				for(MultipartFile file : files) {
					String filename = file.getOriginalFilename();
					String filepath = fileRename.fileRename(savePath, filename);
					try {
						FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						try {
							byte[] bytes = file.getBytes();
							bos.write(bytes);
							bos.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					member.setMemberImg(filepath);
				}// for문 종료
			}
			
			System.out.println("$$$$"+member.getMemberImg());
			System.out.println("^^^^^"+m.getMemberImg());
			if(member.getMemberImg() == null) {
				member.setMemberImg(m.getMemberImg());
			}
			if(defaultImg != null) {
				if(defaultImg.equals("user.png")) {
					member.setMemberImg("user.png");
				}
			}
			System.out.println(member.getMemberImg());
			int result = service.updateMember(member);
			if (result > 0) {
				m.setMemberPhone(member.getMemberPhone());
				m.setMemberEmail(member.getMemberEmail());
				m.setFavorite(member.getFavorite());
				m.setMemberBirth(member.getMemberBirth());
				m.setNickName(member.getNickName());
				m.setMemberImg(member.getMemberImg());
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
				System.out.println("######여기1"+member);
				if(member.getMemberState() != null) {
					session.invalidate();
					System.out.println("######여기2");
					return "4";
				}
				return "0";
			}else {
				System.out.println("######여기2");
				int result = service.insertKakaoMember(m);
				System.out.println("kakao result:"+result);
				System.out.println("######여기3");
				if(result>0) {
					System.out.println("######여기4");
					return "1";
				}else {
					System.out.println("######여기5");
					return "2";
				}
			}
		}
		
		@RequestMapping(value="/kakao.do")
		public String kakao(@SessionAttribute Member m) {
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
				model.addAttribute("msg", "아이디를 찾을 수 없습니다.");
				model.addAttribute("url","/searchInfoFrm.do");
				return "alert";
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
					System.out.println("딜리버리1111:"+delivery);
					int result = service.updateAddr(delivery);
					System.out.println("딜리버리222:"+delivery);
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
		public String updateAddr(Delivery delivery, Model model, int deliveryNum, @SessionAttribute Member m) {
			delivery.setDeliveryNo(deliveryNum);
			delivery.setMemberNo(m.getMemberNo());
			if(delivery.getDefaultAddr().equals("y")) {
				//배송지 전부 n으로 바꾸기
				int result = service.updateAddr(delivery);
				if(result>0) {
					//기본 배송지 'y'로  update
					int result2 = service.updateOneAddr(delivery);
					if(result2>0) {
						return "redirect:/mypage.do";
					}else {
						model.addAttribute("msg", "배송지 수정에 실패했습니다.11");
						model.addAttribute("url","/mypage.do");
						return "alert";
					}
				}else {
					model.addAttribute("msg", "배송지 수정에 실패했습니다.22");
					model.addAttribute("url","/mypage.do");
					return "alert";
				}
			}
			int result2 = service.updateOneAddr(delivery);
			if(result2>0) {
				return "redirect:/mypage.do";
			}else {
				model.addAttribute("msg", "배송지 수정에 실패했습니다.33");
				model.addAttribute("url","/mypage.do");
				return "alert";
			}
		}
		
		
		//회원탈퇴
		@RequestMapping(value="/deleteMember.do")
		public String deleteMember(@SessionAttribute Member m, Model model, HttpSession session) {
			System.out.println("###member###:"+m);
			int result = service.deleteUser(m);
			if(result>0) {
				session.invalidate();
				return "redirect:/";
			}else {
				model.addAttribute("msg", "회원 탈퇴에 실패했습니다.");
				model.addAttribute("url","/mypage.do");
				return "alert";
			}
		}
}
