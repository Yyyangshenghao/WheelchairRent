package com.wheelchair.wym.controller;

import javax.servlet.http.HttpServletRequest;

import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.entity.Users;
import com.wheelchair.wym.service.IWheelchairService;
import com.wheelchair.wym.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	
	@Autowired
	private IUserService service;
	@Autowired
	private IWheelchairService dao;
	
	@RequestMapping("/toUserSystem")
	public String toUserSystemPage() {
		return "customer";
	}
	
	@RequestMapping("/toUserRentalPage")
	public String toUserRentalPage() {
		return "myrental";
	}
	
	@RequestMapping("/welcome")
	public String toWelcomePage() {
		return "welcome";
	}
	
	@RequestMapping("/toUpdateWheelchairPage")
	public String toUpdatePage(int hID,HttpServletRequest request) {
		Wheelchair wheelchair = dao.findWheelchairDetailsById(hID);
		request.getSession().setAttribute("Wheelchair", wheelchair);
		return "updatewheelchair";
	}
	
	@RequestMapping("/updateUserPwd")
	@ResponseBody
	public String updateUserPwd(String id,String newPwd,String oldPwd) {
		Users oldUser = new Users();
		oldUser.setuID(Integer.parseInt(id));
		oldUser.setuPassword(oldPwd);
		Users checkUser = service.checkOldPwd(oldUser);
		if(checkUser!=null) {
			Users newUser = new Users();
			newUser.setuID(Integer.parseInt(id));
			newUser.setuPassword(newPwd);
			int n = service.updateUserPwd(newUser);
			if(n>0) {
				return "OK";
			}
		}
		return "FAIL";
	}
}
