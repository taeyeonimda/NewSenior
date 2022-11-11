package kr.or.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping(value="/isLogin.do")
	public String isLogin(Model model) {
		System.out.println("맞나?");
		boolean isLogin = false;
		model.addAttribute("isLogin",isLogin);
		return "redirect:/";
	}
}
