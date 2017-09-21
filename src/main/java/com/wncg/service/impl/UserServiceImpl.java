package com.wncg.service.impl;

import com.wncg.exception.CustomException;
import com.wncg.mapper.UserloginMapper;
import com.wncg.po.Userlogin;
import com.wncg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserloginMapper userloginMapper;

	/**
	 * 根据用户id查找用户
	 * @param id
	 * @return
	 */
	public Userlogin findUserById(Integer id) {
		if(id==null){
			return null;
		}
		Userlogin userlogin = userloginMapper.selectByPrimaryKey(id);
		if (userlogin==null){
			return null;
		}else{
			return userlogin;
		}
	}

	/**
	 * 根据用户名查找用户
	 * @param username
	 * @param password
	 * @return
	 */
	public Userlogin finUserByName(String username, String password) {
		Userlogin userlogin = userloginMapper.findUserByUsername(username);
		if(userlogin == null){
			return null;
		}else if((!username.equals(userlogin.getUsername())) || (!password.equals(userlogin.getPassword()))){
			return null;
		}else{
			return userlogin;
		}
	}

	/**
	 * 用户注册的方法
	 * @param userlogin
	 */
	public void regist(Userlogin userlogin) throws CustomException {
		if (userlogin==null){
			return;
		}else{
			//检测用户名是否已经被注册
			Userlogin isRegist = userloginMapper.findUserByUsername(userlogin.getUsername());
			//如果已经注册
			if (isRegist!=null){
				throw new CustomException("该用户名已经存在！");
			}else{
				userloginMapper.insert(userlogin);
			}

		}
	}
}
