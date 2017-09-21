package com.wncg.exception;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver {
	public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

		ModelAndView mv = new ModelAndView();

		CustomException customException = null;

		if (e instanceof CustomException) {
			customException = (CustomException)e;
		} else {
			customException = new CustomException("未知错误");
		}

		//错误信息
		String message = customException.getMessage();

		//错误信息传递和错误页面跳转
		mv.addObject("message", message);
		mv.setViewName("error");

		return mv;
	}
}
