package org.tjut.bishe.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.tjut.bishe.bean.UserBean;

public class Userintercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean isF = request.getRequestURI().contains("login");
		if (isF) {
			return true;
		}
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		if (user != null && user.getNicheng() != null && (!user.getNicheng().equals(""))) {
			return true;
		}
		response.sendRedirect("index.jsp");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
