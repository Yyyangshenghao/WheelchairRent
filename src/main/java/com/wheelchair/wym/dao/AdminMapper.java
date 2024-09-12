package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Admin;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
public interface AdminMapper {
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	public Admin adminAccess(Admin admin);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<Users> findAllUser();
	
	/**
	 * 查询所有房源信息
	 * @return
	 */
	public List<Wheelchair> findAllWheelchair(Page page);
	
	/**
	 * 管理员删除房源信息
	 * @return
	 */
	public int deleteWheelchair(int hID);
	
	/**
	 * 通过id查询用户
	 * @param uID
	 * @return
	 */
	public Users findUserById(int uID);
	
	/**
	 * 管理员更新普通用户信息
	 * @return
	 */
	public int updateUser(Users users);
	/**
	 * 管理员删除用户
	 * @param uID
	 * @return
	 */
	public int deleteUser(int uID);
	
	/**
	 *  检查修改密码原密码
	 * @param admin
	 * @return
	 */
	public Admin checkAdminPwd(Admin admin);
	
	/**
	 *  修改管理员密码
	 * @param admin
	 * @return
	 */
	public int updateAdminPwd(Admin admin);
}
