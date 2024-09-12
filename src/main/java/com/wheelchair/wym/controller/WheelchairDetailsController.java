package com.wheelchair.wym.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IWheelchairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class WheelchairDetailsController {
	
	@Autowired
	private IWheelchairService service;
	
	@RequestMapping("/toDetailsPage")
	public String toDetailsPage(int id,HttpServletRequest request) {
		Wheelchair WheelchairDetails = service.findWheelchairDetailsById(id);
		List<String> list = new ArrayList<String>();
		String[] split = WheelchairDetails.getWheelchairDetailsImg().split("~");
		for(int i=0;i<split.length;i++) {
			list.add(split[i]);
		}
		request.getSession().setAttribute("Details", WheelchairDetails);
		request.getSession().setAttribute("DetailsImg", list);
		return "wheelchairdetails";
	}
}
