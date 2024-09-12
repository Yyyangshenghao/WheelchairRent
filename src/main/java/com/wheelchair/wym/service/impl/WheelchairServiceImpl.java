package com.wheelchair.wym.service.impl;

import java.util.List;

import com.wheelchair.wym.dao.WheelchairMapper;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.service.IWheelchairService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WheelchairServiceImpl implements IWheelchairService {

	@Autowired
	private WheelchairMapper dao;
	
	@Override
	public List<Wheelchair> findHomeInfo() {
		return dao.findHomeInfo();
	}

	@Override
	public Wheelchair findWheelchairDetailsById(int id) {
		return dao.findWheelchairDetailsById(id);
	}

	@Override
	public int addNewWheelchair(Wheelchair wheelchair) {
		return dao.addNewWheelchair(wheelchair);
	}

	@Override
	public List<Wheelchair> findWheelchairByUser(Page page) {
		return dao.findWheelchairByUser(page);
	}
	
	@Override
	public int deleteUserWheelchair(int hID) {
		return dao.deleteUserWheelchair(hID);
	}
	@Override
	public int updateWheelchair(Wheelchair wheelchair) {
		return dao.updateWheelchair(wheelchair);
	}
	@Override
	public List<Wheelchair> findWheelchairByLike(String keywords) {
		return dao.findWheelchairByLike(keywords);
	}
	@Override
	public List<Wheelchair> findWheelchairOrderByAsc() {
		return dao.findWheelchairOrderByAsc();
	}
	@Override
	public List<Wheelchair> findWheelchairOrderByDesc() {
		return dao.findWheelchairOrderByDesc();
	}
}
