package com.wncg.service;

import com.wncg.exception.CustomException;
import com.wncg.po.Userlogin;

public interface UserService {

	/**
	 * 根据用户的id查询用户对象
	 * @param id
	 * @return
	 */
	Userlogin findUserById(Integer id);

	/**
	 * 根据用户名查询用户对象
	 * @param username
	 * @param password
	 * @return
	 */
	Userlogin finUserByName(String username, String password);

	/**
	 * 注册用户
	 * @param userlogin
	 */
	void regist(Userlogin userlogin) throws CustomException;
}
