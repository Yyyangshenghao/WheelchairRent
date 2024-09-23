package com.wheelchair.wym.controller;

import java.util.ArrayList;
import java.util.List;

import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;

import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.entity.Comment;
import com.wheelchair.wym.service.IWheelchairService;
import com.wheelchair.wym.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WheelchairDetailsController {

	@Autowired
	private IWheelchairService wheelchairService;

	@Autowired
	private ICommentService commentService;

	@RequestMapping("/toDetailsPage")
	public String toDetailsPage(int id, HttpServletRequest request) {
		// 获取轮椅的详细信息
		Wheelchair wheelchairDetails = wheelchairService.findWheelchairDetailsById(id);

		// 处理轮椅的详情图片
		List<String> detailsImgList = new ArrayList<>();
		String[] split = wheelchairDetails.getWheelchairDetailsImg().split("~");
		for (String img : split) {
			detailsImgList.add(img);
		}

		// 获取与该轮椅相关的评论
		List<Comment> wheelchairComments = commentService.findCommentsByWheelchairID(id);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		for (Comment comment : wheelchairComments) {
			String formattedDate = sdf.format(comment.getCommentDate());
			comment.setCommentDateFormatted(formattedDate);
		}

		// 将轮椅详情和评论信息存入 session
		request.getSession().setAttribute("Details", wheelchairDetails);
		request.getSession().setAttribute("DetailsImg", detailsImgList);
		request.getSession().setAttribute("Comments", wheelchairComments);

		return "wheelchairdetails";
	}
}
