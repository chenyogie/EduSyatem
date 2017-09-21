package com.wncg.controller;


import com.wncg.exception.CustomException;
import com.wncg.po.Userlogin;
import com.wncg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	@Autowired
	private UserService userService;


	/**
	 * 用户登录的方法
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session,@RequestParam("username") String username,
							  @RequestParam("password") String password) throws Exception {

		ModelAndView mv = new ModelAndView();

		//判断用户输入是否为空
		if(username==null || "".equals(username)  || password==null || "".equals(password)){
			throw new CustomException("输入参数错误！");
		}

		Userlogin userlogin = userService.finUserByName(username,password);
		//判断查询对象是否为空
		if(userlogin==null){
			throw new CustomException("抱歉，没有相关用户信息!");
		}else{
			//登录成功后将用户绑定到seesion中
			session.setAttribute("userlogin",userlogin);
			mv.addObject(userlogin);
			mv.setViewName("index");
			return mv;
		}
	}

	/**
	 * 用户注册的方法
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/register")
	public ModelAndView register(@RequestParam("username") String username,
								 @RequestParam("password") String password) throws Exception {
		//目前默认设置所注册的用户的role值为1
		int role = 1;

		Userlogin userlogin = new Userlogin();
		userlogin.setUsername(username);
		userlogin.setPassword(password);
		userlogin.setRole(role);

		userService.regist(userlogin);

		ModelAndView mv = new ModelAndView();
		return mv;
	}


	/**
	 * 根据id值查询用户
	 * @return
	 */
	@RequestMapping("/find")
	public ModelAndView findUserById(){
		Integer id = 1;
		Userlogin userlogin = userService.findUserById(id);
		System.out.println(userlogin);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(userlogin);
		modelAndView.setViewName("userselect");
		return modelAndView;

	}

}
