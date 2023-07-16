package com.spring.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object obj = request.getSession().getAttribute("userLoggedAdmin");
		if(obj != null) {
			return true;
		}

		response.sendRedirect(request.getContextPath() + "/loginAdmin");
		return false;
	}

}
