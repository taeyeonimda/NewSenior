package kr.or.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.or.member.model.vo.Member;


public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean isLogin = true;
		
		if(!request.getRequestURI().equals("/")) {
			Member m = (Member)request.getSession().getAttribute("m");
			if(m == null||m.getMemberGrade()!=3){
				response.sendRedirect("/");
				isLogin = false;
			}
		}
		
		return isLogin;
	}

}
