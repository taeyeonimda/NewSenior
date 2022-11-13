package kr.or.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping(value="/isLogin.do")
	public String isLogin(Model model,HttpServletResponse response) throws IOException   {
		System.out.println("맞나?");
		boolean isLogin = false;
		PrintWriter out = response.getWriter();
		out.print("A");
		return "redirect:/";
	}
}
