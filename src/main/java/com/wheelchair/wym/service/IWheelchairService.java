package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.entity.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface IWheelchairService {
	/**
	 * 首页信息展示
	 * @return
	 */
	public List<Wheelchair> findHomeInfo();
	/**
	 * 通过id查询房屋详情
	 * @param id
	 * @return
	 */
	public Wheelchair findWheelchairDetailsById(int id);
	/**
	 * 添加房源信息
	 * @param wheelchair
	 * @return
	 */
	public int addNewWheelchair(Wheelchair wheelchair);

	public List<Wheelchair> findWheelchairByUser(Page page);
	/**
	 *  删除用户发布的房源信息
	 * @param hID
	 * @return
	 */
	public int deleteUserWheelchair(int hID);

	public int updateWheelchair(Wheelchair wheelchair);
	/**
	 * 条件查询
	 * @param keywords
	 * @return
	 */
	public List<Wheelchair> findWheelchairByLike(String keywords);
	/**
	 * 降序查询
	 * @return
	 */
	public List<Wheelchair> findWheelchairOrderByDesc();
	/**
	 * 升序序查询
	 * @return
	 */
	public List<Wheelchair> findWheelchairOrderByAsc();
}
