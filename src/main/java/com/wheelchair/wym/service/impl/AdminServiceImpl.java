package com.wheelchair.wym.service.impl;


import com.wheelchair.wym.dao.AdminMapper;
import com.wheelchair.wym.entity.Admin;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.Users;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IAdminService;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminServiceImpl implements IAdminService {

	private final AdminMapper service;

	public AdminServiceImpl(AdminMapper service) {
		this.service = service;
	}

	@Override
	public Admin adminAccess(Admin admin) {
		return service.adminAccess(admin);
	}

	@Override
	public List<Users> findAllUser() {
		return service.findAllUser();
	}

	@Override
	public List<Wheelchair> findAllWheelchair(Page page) {
		return service.findAllWheelchair(page);
	}

	@Override
	public int deleteWheelchair(int hID) {
		return service.deleteWheelchair(hID);
	}

	@Override
	public Users findUserById(int uID) {
		return service.findUserById(uID);
	}

	@Override
	public int updateUser(Users users) {
		return service.updateUser(users);
	}
	@Override
	public int deleteUser(int uID) {
		return service.deleteUser(uID);
	}
	@Override
	public Admin checkAdminPwd(Admin admin) {
		return service.checkAdminPwd(admin);
	}
	@Override
	public int updateAdminPwd(Admin admin) {
		return service.updateAdminPwd(admin);
	}
}
