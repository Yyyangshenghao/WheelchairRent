package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.UserMapper;
import com.wheelchair.wym.entity.Users;
import com.wheelchair.wym.service.IUserService;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements IUserService {

	private final UserMapper mapper;

	public UserServiceImpl(UserMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public Users login(Users user) {
		return mapper.login(user);
	}

	@Override
	public int regist(Users user) {
		return mapper.regist(user);
	}

	@Override
	public int updateUserPwd(Users users) {
		return mapper.updateUserPwd(users);
	}

	@Override
	public Users checkOldPwd(Users users) {
		return mapper.checkOldPwd(users);
	}
}
