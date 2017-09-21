package com.wncg.mapper;

import com.wncg.po.Userlogin;
import com.wncg.po.UserloginExample;
import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface UserloginMapper {

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    Userlogin findUserByUsername(String username);


    int countByExample(UserloginExample example);

    int deleteByExample(UserloginExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(Userlogin record);

    int insertSelective(Userlogin record);

    List<Userlogin> selectByExample(UserloginExample example);

    Userlogin selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") Userlogin record, @Param("example") UserloginExample example);

    int updateByExample(@Param("record") Userlogin record, @Param("example") UserloginExample example);

    int updateByPrimaryKeySelective(Userlogin record);

    int updateByPrimaryKey(Userlogin record);
}